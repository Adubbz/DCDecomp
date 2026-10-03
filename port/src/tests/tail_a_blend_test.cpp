#include <memory>

#include "fireomni.hpp"
#include "rect.hpp"
#include "runeffect.hpp"
#include "tail_a_fixture.hpp"

using namespace dc::test;

namespace {

// A registry texture of one colour, alpha in GS units, and the CTexture whose TEX0 names it.
struct SolidTexture {
    unsigned                  key = 0;
    std::unique_ptr<CTexture> texture = std::make_unique<CTexture>();

    SolidTexture(unsigned width, unsigned height, uint8_t r, uint8_t g, uint8_t b, uint8_t gs_alpha) {
        PortDecodedTexture decoded;
        decoded.width = width;
        decoded.height = height;
        uint32_t texel = Rgba(r, g, b, gs_alpha);
        gfx::ConvertPs2Alpha(&texel, 1);
        std::vector<uint8_t> level(static_cast<size_t>(width) * height * 4);
        for (size_t i = 0; i < level.size(); i += 4) {
            std::memcpy(&level[i], &texel, 4);
        }
        decoded.levels.push_back(std::move(level));
        unsigned palette = 0;
        key = PortCreateTexture(decoded, PortTextureOwner::Other, &palette);
        DC_CHECK(key != 0);
        texture->tex0 = SCE_GS_SET_TEX0(key, 1, SCE_GS_PSMCT32, 6, 6, 1, 0, 0, 0, 0, 0, 0);
    }

    ~SolidTexture() { PortReleaseKey(key); }
};

} // namespace

// Into the target: flat grey under the first rect, the first texture over it with the caller's
// ALPHA (opaque, so red), then the second added as Cs + Cd * As with As one half.
DC_TEST(tail_a_blend_textures_into_named_target) {
    Draw3DFixture      fixture;
    unsigned           key = PortRegisterNamedTarget("blender", 128, 128, true, PortTextureOwner::Other);
    gfx::TextureHandle blender = gfx::FindNamedRenderTarget("blender");
    SolidTexture       red(64, 64, 255, 0, 0, 0x80);
    SolidTexture       green(64, 64, 0, 255, 0, 0x40);

    fixture.Frame([&] {
        blendTextuer(GetVif1Packet(), static_cast<int>(key), 2, SCE_GS_PSMCT32, red.texture.get(),
                     CRect_i_(0, 0, 64, 64), CRect_i_(0, 0, 64, 64), green.texture.get(), CRect_i_(32, 32, 64, 64),
                     CRect_i_(0, 0, 64, 64));
        DC_CHECK(gfx::CurrentRenderTarget() == gfx::kMainTarget);
    });

    TailAFixture::Pixels target = TailAFixture::Read(blender);
    DC_CHECK(target.Near(10, 10, 255, 0, 0));
    DC_CHECK(target.Near(48, 48, 128, 255, 0, -1, 4));
    DC_CHECK(target.Near(80, 80, 0, 255, 0));
    DC_CHECK(target.Near(110, 10, 0, 0, 0));
    DC_CHECK(MGPortCurrent().alpha.value == mgAlpha.value);
    DC_CHECK(MGPortCurrent().test.value == mgPixelTest.value);
    // The frame itself is untouched.
    DC_CHECK(fixture.PixelNear(10, 10, 0, 0, 0));
    PortReleaseKey(key);
}

// Two-row strips of the frame land in the target's rows (field rows of the frame), then the
// texture's alpha replaces theirs and the colour stays the frame's.
DC_TEST(tail_a_blend_frame_strips_take_texture_alpha) {
    Draw3DFixture      fixture;
    unsigned           key = PortRegisterNamedTarget("blender", 640, 256, true, PortTextureOwner::Other);
    gfx::TextureHandle blender = gfx::FindNamedRenderTarget("blender");
    SolidTexture       mask(64, 64, 9, 9, 9, 0x20);

    fixture.Frame([&] {
        MGFillBox(CRect_i_(0, 0, 640 * 16, 50 * 16), 200, 0, 0, 0x80);
        MGFillBox(CRect_i_(0, 50 * 16, 640 * 16, 190 * 16), 0, 0, 200, 0x80);
        blendTextuerTest(GetVif1Packet(), static_cast<int>(key), 10, SCE_GS_PSMCT32, CRect_i_(100, 20, 120, 64),
                         mask.texture.get(), CRect_i_(0, 0, 120, 64), CRect_i_(0, 0, 64, 64), 0.0f, 0.0f);
    });

    // Target row r holds the frame's field row 20 + r, logical row 40 + 2r; red stops at row 100.
    TailAFixture::Pixels target = TailAFixture::Read(blender);
    DC_CHECK(target.Near(10, 10, 200, 0, 0, 0x40));
    DC_CHECK(target.Near(100, 20, 200, 0, 0, 0x40));
    DC_CHECK(target.Near(10, 50, 0, 0, 200, 0x40));
    DC_CHECK(target.Near(200, 70, 0, 0, 0));
    DC_CHECK(fixture.PixelNear(150, 60, 200, 0, 0));
    PortReleaseKey(key);
}

// The heat haze: DrawRaster copies the frame behind the fire into "blender" through
// blendTextuerTest and draws it back over the same place, so with no shimmer the frame comes back
// as it was. The fire stands at depth 100 on the axis: the copy covers x 260..380, logical rows
// 136..264 (field rows 68..132).
DC_TEST(tail_a_draw_raster_round_trips_through_blender) {
    TailAFixture fixture;
    fixture.Placeholders({"#blender#640#256#4"});
    fixture.Images(texfix::Img({
        {"alpha01", SolidTim2(64, 64, texfix::Gs(0x80, 0x80, 0x80, 0x80))}
    }));
    static CFireOmni fire;
    fire.pos[0] = 0.0f;
    fire.pos[1] = 0.0f;
    fire.pos[2] = 100.0f;
    fire.pos[3] = 1.0f;
    fire.raster_phase = 0.0f;

    fixture.Frame([&] {
        MGFillBox(CRect_i_(0, 0, 640 * 16, 100 * 16), 200, 0, 0, 0x80);
        MGFillBox(CRect_i_(0, 100 * 16, 640 * 16, 140 * 16), 0, 0, 200, 0x80);
        fire.DrawRaster();
    });

    DC_CHECK(fixture.PixelNear(300, 170, 200, 0, 0, 4));
    DC_CHECK(fixture.PixelNear(300, 240, 0, 0, 200, 4));
    DC_CHECK(fixture.PixelNear(500, 170, 200, 0, 0));
    TailAFixture::Pixels target = TailAFixture::Read(TailAFixture::Handle("blender"));
    DC_CHECK(target.Near(10, 10, 200, 0, 0, 0xFF));
    DC_CHECK(target.Near(10, 50, 0, 0, 200, 0xFF));
}
