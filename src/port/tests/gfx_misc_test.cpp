#include <fstream>
#include <iterator>

#include "gfx_fixture.hpp"

using namespace dc::test;

namespace {

uint32_t ReadBigEndian(const uint8_t *p) {
    return static_cast<uint32_t>(p[0]) << 24 | static_cast<uint32_t>(p[1]) << 16 |
           static_cast<uint32_t>(p[2]) << 8 | p[3];
}

uint32_t Crc(const uint8_t *data, size_t size) {
    uint32_t crc = 0xFFFFFFFFu;
    for (size_t i = 0; i < size; i++) {
        crc ^= data[i];
        for (int bit = 0; bit < 8; bit++) {
            crc = (crc & 1) ? 0xEDB88320u ^ (crc >> 1) : crc >> 1;
        }
    }
    return ~crc;
}

} // namespace

DC_TEST(gfx_pipeline_cache) {
    std::filesystem::path cache =
        std::filesystem::temp_directory_path() / "dc_gfx_test" / "pipeline_cache.bin";
    {
        GfxFixture fixture;
        DC_CHECK(gfx::PipelineCount() > 0);
        DC_CHECK(fixture.progress_calls > 0);
        DC_CHECK(fixture.progress_done == fixture.progress_total);
        DC_CHECK(fixture.progress_total == gfx::PipelineCount());
        DC_CHECK(std::filesystem::exists(cache));
    }
    // A cache from another device or a corrupt file is ignored, not fed to the driver.
    {
        std::ofstream corrupt(cache, std::ios::binary | std::ios::trunc);
        corrupt << "not a pipeline cache at all, but long enough to have a header";
    }
    {
        GfxFixture fixture;
        DC_CHECK(gfx::PipelineCount() > 0);
    }
    DC_CHECK(std::filesystem::file_size(cache) >= 32);
}

DC_TEST(gfx_texture_limits) {
    GfxFixture fixture;
    // Past the device's maxImageDimension2D: an error, not a crash.
    DC_CHECK(gfx::CreateTexture({1u << 20, 4, gfx::TextureFormat::Rgba8, 1, true}) == gfx::kNullTexture);
    DC_CHECK(gfx::CreateTexture({0, 4, gfx::TextureFormat::Rgba8, 1, true}) == gfx::kNullTexture);
    DC_CHECK(gfx::CreateTexture({4, 4, gfx::TextureFormat::Rgba8, 4, true}) == gfx::kNullTexture);
    DC_CHECK(gfx::CreateRenderTarget(1u << 20, 4, true) == gfx::kNullTexture);

    gfx::TextureHandle texture = gfx::CreateTexture({4, 4, gfx::TextureFormat::Rgba8, 3, true});
    DC_CHECK(texture != gfx::kNullTexture);
    uint32_t texel = Rgba(1, 2, 3);
    DC_CHECK(gfx::UpdateTexture(texture, 2, 0, 0, 1, 1, &texel));
    DC_CHECK(!gfx::UpdateTexture(texture, 2, 0, 0, 2, 1, &texel));
    DC_CHECK(!gfx::UpdateTexture(texture, 3, 0, 0, 1, 1, &texel));
    gfx::DestroyTexture(texture);
    DC_CHECK(!gfx::UpdateTexture(texture, 0, 0, 0, 1, 1, &texel));

    // Handles of destroyed textures stay dead after their slot is reused.
    for (int frame = 0; frame < 3; frame++) {
        DC_CHECK(gfx::BeginFrame());
        gfx::EndFrame();
    }
    gfx::TextureHandle reused = gfx::CreateTexture({4, 4, gfx::TextureFormat::Rgba8, 1, true});
    DC_CHECK(reused != texture);
    DC_CHECK(!gfx::GetTextureInfo(texture).has_value());
    DC_CHECK(gfx::GetTextureInfo(reused).has_value());

    // GS alpha to the renderer's: 0x80 is opaque.
    uint32_t alpha[3] = {Rgba(0, 0, 0, 0x80), Rgba(0, 0, 0, 0x40), Rgba(0, 0, 0, 0xFF)};
    gfx::ConvertPs2Alpha(alpha, 3);
    DC_CHECK(alpha[0] >> 24 == 0xFF && alpha[1] >> 24 == 0x80 && alpha[2] >> 24 == 0xFF);
}

DC_TEST(gfx_draws_outside_a_frame_are_dropped) {
    GfxFixture fixture;
    auto       quad = Quad(0, 0, 640, 480, {255, 255, 255, 0x80});
    gfx::Draw2D(gfx::Primitive::Quads, quad, {}, gfx::DrawState{});
    fixture.Frame({0, 0, 0, 0x80}, [] {});
    DC_CHECK(fixture.PixelNear(320, 240, 0, 0, 0));
}

DC_TEST(gfx_png) {
    GfxFixture fixture(64, 48);
    fixture.Frame({10, 20, 30, 0x80}, [] {
        auto quad = Quad(0, 0, 320, 480, {200, 100, 50, 0x80});
        gfx::Draw2D(gfx::Primitive::Quads, quad, {}, gfx::DrawState{});
    });
    std::filesystem::path path = std::filesystem::temp_directory_path() / "dc_gfx_test" / "frame.png";
    DC_CHECK(gfx::WritePng(path, fixture.pixels.data(), fixture.width, fixture.height));

    std::ifstream        file(path, std::ios::binary);
    std::vector<uint8_t> png((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
    const uint8_t        signature[8] = {0x89, 'P', 'N', 'G', '\r', '\n', 0x1A, '\n'};
    DC_CHECK(png.size() > 8 && std::equal(signature, signature + 8, png.begin()));

    std::vector<uint8_t> zlib;
    size_t               pos = 8;
    while (pos + 12 <= png.size()) {
        uint32_t       length = ReadBigEndian(&png[pos]);
        const uint8_t *type = &png[pos + 4];
        DC_CHECK(ReadBigEndian(&png[pos + 8 + length]) == Crc(type, length + 4));
        if (std::equal(type, type + 4, "IHDR")) {
            DC_CHECK(ReadBigEndian(type + 4) == 64 && ReadBigEndian(type + 8) == 48);
            DC_CHECK(type[12] == 8 && type[13] == 2);
        } else if (std::equal(type, type + 4, "IDAT")) {
            zlib.insert(zlib.end(), type + 4, type + 4 + length);
        }
        pos += 12 + length;
    }
    DC_CHECK(pos == png.size());

    // Stored deflate blocks only: undo them by hand and compare with the frame.
    std::vector<uint8_t> raw;
    size_t               at = 2;
    bool                 last;
    do {
        last = zlib[at] & 1;
        DC_CHECK((zlib[at] & 6) == 0);
        uint32_t len = zlib[at + 1] | zlib[at + 2] << 8;
        DC_CHECK((len ^ (zlib[at + 3] | zlib[at + 4] << 8)) == 0xFFFF);
        raw.insert(raw.end(), zlib.begin() + static_cast<std::ptrdiff_t>(at + 5),
                   zlib.begin() + static_cast<std::ptrdiff_t>(at + 5 + len));
        at += 5 + len;
    } while (!last);
    DC_CHECK(raw.size() == (64 * 3 + 1) * 48);
    DC_CHECK(raw[0] == 0 && raw[1] == 200 && raw[2] == 100 && raw[3] == 50);
    size_t right = 10 * (64 * 3 + 1) + 1 + 60 * 3;
    DC_CHECK(raw[right] == 10 && raw[right + 1] == 20 && raw[right + 2] == 30);
}
