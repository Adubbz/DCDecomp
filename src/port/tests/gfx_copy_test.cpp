#include "gfx_fixture.hpp"

using namespace dc::test;

namespace {

constexpr std::array<uint8_t, 4> kBlack = {0, 0, 0, 0x80};
constexpr std::array<uint8_t, 4> kNeutral = {0x80, 0x80, 0x80, 0x80};

uint32_t TexelAt(const std::vector<uint8_t> &pixels, uint32_t width, uint32_t x, uint32_t y) {
    const uint8_t *p = &pixels[(static_cast<size_t>(y) * width + x) * 4];
    return Rgba(p[0], p[1], p[2], p[3]);
}

uint32_t Pattern(uint32_t x, uint32_t y) {
    return Rgba(static_cast<uint8_t>(x * 60 + 10), static_cast<uint8_t>(y * 60 + 10), 0x55, 0xFF);
}

} // namespace

DC_TEST(gfx_copy_and_blit) {
    GfxFixture         fixture;
    gfx::TextureHandle a = gfx::CreateTexture({4, 4, gfx::TextureFormat::Rgba8, 1, true});
    gfx::TextureHandle b = gfx::CreateTexture({4, 4, gfx::TextureFormat::Rgba8, 1, true});
    gfx::TextureHandle c = gfx::CreateTexture({8, 8, gfx::TextureFormat::Rgba8, 1, true});
    uint32_t           texels[16];
    for (uint32_t y = 0; y < 4; y++) {
        for (uint32_t x = 0; x < 4; x++) {
            texels[y * 4 + x] = Pattern(x, y);
        }
    }
    DC_CHECK(gfx::UpdateTexture(a, 0, 0, 0, 4, 4, texels));

    // Outside a frame the copy rides the upload command buffer.
    DC_CHECK(gfx::CopyTexture(a, {0, 0, 2, 2}, b, 2, 2));
    std::vector<uint8_t> pixels;
    uint32_t             width;
    uint32_t             height;
    DC_CHECK(gfx::ReadbackTexture(b, pixels, width, height));
    DC_CHECK(width == 4 && height == 4);
    DC_CHECK(TexelAt(pixels, 4, 2, 2) == Pattern(0, 0));
    DC_CHECK(TexelAt(pixels, 4, 3, 3) == Pattern(1, 1));
    DC_CHECK(TexelAt(pixels, 4, 0, 0) == 0);
    DC_CHECK(TexelAt(pixels, 4, 1, 3) == 0);

    // Inside a frame, after a draw has sampled both, in order with it.
    fixture.Frame(kBlack, [&] {
        gfx::TextureBinding binding;
        binding.texture = b;
        binding.filter = gfx::Filter::Nearest;
        auto quad = Quad(0, 0, 40, 40, kNeutral, 0, 0, 4, 4);
        gfx::Draw2D(gfx::Primitive::Quads, quad, binding, gfx::DrawState{});
        DC_CHECK(gfx::BlitTexture(a, {0, 0, 4, 4}, c, {0, 0, 8, 8}, gfx::Filter::Nearest));
        // Mirrored horizontally into b.
        DC_CHECK(gfx::BlitTexture(a, {0, 0, 4, 1}, b, {4, 0, -4, 1}, gfx::Filter::Nearest));
        auto after = Quad(40, 0, 40, 40, kNeutral, 0, 0, 4, 4);
        gfx::Draw2D(gfx::Primitive::Quads, after, binding, gfx::DrawState{});
    });
    // The first draw saw b before the mirrored blit, the second after it.
    DC_CHECK(fixture.PixelNear(5, 5, 0, 0, 0));
    DC_CHECK(fixture.PixelNear(45, 5, 3 * 60 + 10, 10, 0x55));

    DC_CHECK(gfx::ReadbackTexture(c, pixels, width, height));
    DC_CHECK(width == 8 && height == 8);
    DC_CHECK(TexelAt(pixels, 8, 0, 0) == Pattern(0, 0));
    DC_CHECK(TexelAt(pixels, 8, 1, 1) == Pattern(0, 0));
    DC_CHECK(TexelAt(pixels, 8, 7, 7) == Pattern(3, 3));
    DC_CHECK(TexelAt(pixels, 8, 4, 2) == Pattern(2, 1));
    DC_CHECK(gfx::ReadbackTexture(b, pixels, width, height));
    DC_CHECK(TexelAt(pixels, 4, 0, 0) == Pattern(3, 0));
    DC_CHECK(TexelAt(pixels, 4, 3, 0) == Pattern(0, 0));

    // A copy within one texture, overlapping itself: a one-texel scroll to the right.
    DC_CHECK(gfx::CopyTexture(a, {0, 0, 3, 4}, a, 1, 0));
    DC_CHECK(gfx::ReadbackTexture(a, pixels, width, height));
    DC_CHECK(TexelAt(pixels, 4, 0, 1) == Pattern(0, 1));
    DC_CHECK(TexelAt(pixels, 4, 1, 1) == Pattern(0, 1));
    DC_CHECK(TexelAt(pixels, 4, 3, 2) == Pattern(2, 2));

    // Index textures copy as bytes; mixing formats is refused.
    gfx::TextureHandle index = gfx::CreateTexture({4, 1, gfx::TextureFormat::Index8, 1, true});
    uint8_t            bytes[4] = {1, 2, 3, 4};
    DC_CHECK(gfx::UpdateTexture(index, 0, 0, 0, 4, 1, bytes));
    DC_CHECK(gfx::CopyTexture(index, {0, 0, 2, 1}, index, 2, 0));
    DC_CHECK(!gfx::CopyTexture(index, {0, 0, 1, 1}, a, 0, 0));
    DC_CHECK(gfx::ReadbackTexture(index, pixels, width, height));
    DC_CHECK(pixels.size() == 4 && pixels[0] == 1 && pixels[1] == 2 && pixels[2] == 1 && pixels[3] == 2);
}

DC_TEST(gfx_snapshot_and_previous_frame) {
    GfxFixture         fixture(640, 480);
    gfx::TextureHandle snapshot = gfx::CreateRenderTarget(64, 48, true);
    DC_CHECK(snapshot != gfx::kNullTexture);
    fixture.Frame(kBlack, [&] {
        auto left = Quad(0, 0, 320, 480, {255, 0, 0, 0x80});
        auto right = Quad(320, 0, 320, 480, {0, 0, 255, 0x80});
        gfx::Draw2D(gfx::Primitive::Quads, left, {}, gfx::DrawState{});
        gfx::Draw2D(gfx::Primitive::Quads, right, {}, gfx::DrawState{});
        DC_CHECK(gfx::SnapshotFrame(snapshot));
        // Drawing goes on after the snapshot, which does not see this.
        auto late = Quad(0, 0, 640, 100, {0, 255, 0, 0x80});
        gfx::Draw2D(gfx::Primitive::Quads, late, {}, gfx::DrawState{});
    });
    std::vector<uint8_t> pixels;
    uint32_t             width;
    uint32_t             height;
    DC_CHECK(gfx::ReadbackTexture(snapshot, pixels, width, height));
    DC_CHECK(width == 64 && height == 48);
    DC_CHECK(TexelAt(pixels, 64, 5, 5) == Rgba(255, 0, 0, 0xFF));
    DC_CHECK(TexelAt(pixels, 64, 60, 40) == Rgba(0, 0, 255, 0xFF));

    // The next frame samples the one before it, then draws the snapshot over a corner.
    fixture.Frame(kBlack, [&] {
        gfx::TextureBinding previous;
        previous.texture = gfx::kPreviousFrame;
        previous.filter = gfx::Filter::Nearest;
        auto whole = Quad(0, 0, 640, 480, kNeutral, 0, 0, 640, 480);
        gfx::Draw2D(gfx::Primitive::Quads, whole, previous, gfx::DrawState{});
        gfx::TextureBinding binding;
        binding.texture = snapshot;
        binding.filter = gfx::Filter::Nearest;
        auto corner = Quad(600, 440, 40, 40, kNeutral, 0, 0, 64, 48);
        gfx::Draw2D(gfx::Primitive::Quads, corner, binding, gfx::DrawState{});
    });
    DC_CHECK(fixture.PixelNear(100, 50, 0, 255, 0));
    DC_CHECK(fixture.PixelNear(100, 300, 255, 0, 0));
    DC_CHECK(fixture.PixelNear(500, 300, 0, 0, 255));
    DC_CHECK(fixture.PixelNear(605, 445, 255, 0, 0));
    DC_CHECK(fixture.PixelNear(635, 475, 0, 0, 255));
}

DC_TEST(gfx_render_target_shadow_composite) {
    // Render scale 2: a 160x120 logical target is 320x240 pixels.
    GfxFixture                      fixture(640, 480, 2.0f);
    gfx::TextureHandle              shadow = gfx::CreateRenderTarget(160, 120, false);
    std::optional<gfx::TextureInfo> info = gfx::GetTextureInfo(shadow);
    DC_CHECK(info && info->pixel_width == 320 && info->pixel_height == 240 && info->width == 160);

    fixture.Frame({200, 200, 200, 0x80}, [&] {
        // Into the 24-bit target: black, then a white block. Its alpha stays 0x80 whatever is drawn.
        gfx::SetRenderTarget(shadow);
        DC_CHECK(gfx::CurrentRenderTarget() == shadow);
        uint8_t black[4] = {0, 0, 0, 0};
        gfx::Clear(true, black, true, 0.0f);
        auto block = Quad(40, 30, 80, 60, {255, 255, 255, 0});
        gfx::Draw2D(gfx::Primitive::Quads, block, {}, gfx::DrawState{});
        gfx::SetRenderTarget(gfx::kMainTarget);

        // MGEndDrawShadow's composite: Cd - Cd * As with TEXA AEM, TA0 0x40.
        gfx::DrawState state;
        state.blend = true;
        state.alpha = {2, 1, 0, 1, 0};
        state.texa_aem = true;
        state.texa_ta0 = 0x40;
        gfx::TextureBinding binding;
        binding.texture = shadow;
        binding.filter = gfx::Filter::Nearest;
        auto whole = Quad(0, 0, 640, 480, kNeutral, 0, 0, 160, 120);
        gfx::Draw2D(gfx::Primitive::Quads, whole, binding, state);
    });
    DC_CHECK(fixture.PixelNear(20, 20, 200, 200, 200));
    DC_CHECK(fixture.PixelNear(320, 240, 100, 100, 100));

    std::vector<uint8_t> pixels;
    uint32_t             width;
    uint32_t             height;
    DC_CHECK(gfx::ReadbackTexture(shadow, pixels, width, height));
    DC_CHECK(TexelAt(pixels, width, 160, 120) == Rgba(255, 255, 255, 0xFF));
    DC_CHECK(TexelAt(pixels, width, 10, 10) == Rgba(0, 0, 0, 0xFF));

    // A new render scale keeps the target's contents.
    gfx::SetRenderScale(1.0f);
    info = gfx::GetTextureInfo(shadow);
    DC_CHECK(info && info->pixel_width == 160 && info->pixel_height == 120);
    DC_CHECK(gfx::ReadbackTexture(shadow, pixels, width, height));
    DC_CHECK(TexelAt(pixels, width, 80, 60) == Rgba(255, 255, 255, 0xFF));
    DC_CHECK(TexelAt(pixels, width, 5, 5) == Rgba(0, 0, 0, 0xFF));
    gfx::DestroyTexture(shadow);
    DC_CHECK(!gfx::GetTextureInfo(shadow).has_value());
}
