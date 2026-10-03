#include <SDL3/SDL.h>
#include <gtest/gtest.h>

#include <cmath>

#include "draw2d_fixture.hpp"
#include "gameutil.hpp"
#include "mglib_port.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "spritetable.hpp"
#include "texture_port.hpp"

using namespace dc::test;

namespace {

constexpr std::array<uint8_t, 4> kBlack = {0, 0, 0, 0x80};
constexpr uint32_t               kWhite = 0xFFFFFFFF;

bool Covered(const GfxFixture &fixture, uint32_t x, uint32_t y) {
    std::array<uint8_t, 4> p = fixture.Pixel(x, y);
    return p[0] != 0 || p[1] != 0 || p[2] != 0;
}

} // namespace

TEST(Draw2dSprite, CoversItsRect) {
    GfxFixture fixture;
    FakeGs     gs;
    CTexture  *white = gs.Solid("white", 0x100, 4, 4, kWhite);
    CTexture  *missing = gs.Name("missing", 0x200);

    fixture.Frame(kBlack, [&] {
        set2DSprite(nullptr, white, CRect_i_(100, 50, 40, 30), CRect_i_(0, 0, 4, 4), 0x80, 0x80, 0x80, 0x80);
        set2DSprite(nullptr, missing, CRect_i_(300, 50, 40, 30), CRect_i_(0, 0, 4, 4), 0x80, 0x80, 0x80,
                    0x80);
        set2DSprite(nullptr, nullptr, CRect_i_(400, 50, 40, 30), CRect_i_(0, 0, 4, 4), 0x80, 0x80, 0x80,
                    0x80);
    });

    ASSERT_TRUE(fixture.PixelNear(100, 50, 255, 255, 255));
    ASSERT_TRUE(fixture.PixelNear(139, 79, 255, 255, 255));
    ASSERT_TRUE(fixture.PixelNear(140, 50, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(99, 50, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(100, 49, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(100, 80, 0, 0, 0));
    // An unresolved texture draws nothing; a null one returns before touching any register.
    ASSERT_TRUE(fixture.PixelNear(320, 60, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(420, 60, 0, 0, 0));
    ASSERT_TRUE(gs.test_writes == 2 && gs.zbuf_writes == 2);
}

TEST(Draw2dSprite, FlatUntexturedRect) {
    GfxFixture fixture;
    FakeGs     gs;
    spRGBA     colour = {0x20, 0x40, 0x60, 0x80};

    fixture.Frame(kBlack, [&] {
        set2DSpriteC4(nullptr, CRect_i_(10, 20, 30, 40), &colour, &colour, &colour, &colour);
    });

    for (uint32_t y = 0; y < 80; y++) {
        for (uint32_t x = 0; x < 60; x++) {
            const bool inside = x >= 10 && x < 40 && y >= 20 && y < 60;
            ASSERT_TRUE(Covered(fixture, x, y) == inside);
        }
    }
    ASSERT_TRUE(fixture.PixelNear(25, 40, 0x20, 0x40, 0x60, 0));
}

TEST(Draw2dSprite, IntoRenderTargetHalvesRows) {
    GfxFixture         fixture;
    FakeGs             gs;
    CTexture          *white = gs.Solid("white", 0x100, 4, 4, kWhite);
    gfx::TextureHandle target = gfx::CreateRenderTarget(64, 64, true);

    fixture.Frame(kBlack, [&] {
        gfx::SetRenderTarget(target);
        set2DSprite(nullptr, white, CRect_i_(8, 20, 16, 40), CRect_i_(0, 0, 4, 4));
        gfx::SetRenderTarget(gfx::kMainTarget);
    });

    std::vector<uint8_t> pixels;
    uint32_t             width = 0;
    uint32_t             height = 0;
    ASSERT_TRUE(gfx::ReadbackTexture(target, pixels, width, height));
    ASSERT_TRUE(width == 64 && height == 64);
    auto red = [&](uint32_t x, uint32_t y) { return pixels[(y * width + x) * 4]; };
    ASSERT_TRUE(red(8, 10) == 255 && red(23, 29) == 255);
    ASSERT_TRUE(red(8, 9) == 0 && red(8, 30) == 0 && red(24, 10) == 0);
    gfx::DestroyTexture(target);
}

TEST(Draw2dSprite, AlphaFlagVariants) {
    GfxFixture fixture;
    FakeGs     gs;
    CTexture  *white = gs.Solid("white", 0x100, 4, 4, kWhite);

    sceGsAlpha additive = {};
    additive.A = 0;
    additive.B = 2;
    additive.C = 2;
    additive.D = 1;
    additive.FIX = 0x80;
    sceGsAlpha subtract = {};
    subtract.A = 1;
    subtract.B = 0;
    subtract.C = 2;
    subtract.D = 2;
    subtract.FIX = 0x80;

    fixture.Frame(kBlack, [&] {
        const CRect_i_ texel(0, 0, 4, 4);
        // Standard blend: half green over red.
        set2DSprite(nullptr, white, CRect_i_(0, 0, 100, 50), texel, 0x80, 0, 0, 0x80);
        set2DSprite(nullptr, white, CRect_i_(50, 0, 100, 50), texel, 0, 0x80, 0, 0x40);
        // Additive: green plus red, whatever the alpha.
        set2DSprite(nullptr, white, CRect_i_(0, 100, 100, 50), texel, 0x80, 0, 0, 0x80);
        setAlphaFlag(nullptr, &additive);
        set2DSprite(nullptr, white, CRect_i_(50, 100, 100, 50), texel, 0, 0x80, 0, 0x10);
        // Subtractive: white less half red.
        setAlphaFlag(nullptr, &mgAlpha);
        set2DSprite(nullptr, white, CRect_i_(0, 200, 100, 50), texel, 0x80, 0x80, 0x80, 0x80);
        setAlphaFlag(nullptr, &subtract);
        set2DSprite(nullptr, white, CRect_i_(50, 200, 100, 50), texel, 0x40, 0, 0, 0x80);
        // Back to the shadow: an opaque sprite replaces what is under it.
        setAlphaFlag(nullptr, &mgAlpha);
        set2DSprite(nullptr, white, CRect_i_(0, 300, 100, 50), texel, 0x80, 0, 0, 0x80);
        set2DSprite(nullptr, white, CRect_i_(50, 300, 100, 50), texel, 0, 0, 0x80, 0x80);
    });

    ASSERT_TRUE(fixture.PixelNear(25, 25, 255, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(75, 25, 127, 127, 0, 3));
    ASSERT_TRUE(fixture.PixelNear(125, 25, 0, 127, 0, 3));
    ASSERT_TRUE(fixture.PixelNear(75, 125, 255, 255, 0));
    ASSERT_TRUE(fixture.PixelNear(125, 125, 0, 255, 0));
    ASSERT_TRUE(fixture.PixelNear(75, 225, 127, 255, 255, 3));
    ASSERT_TRUE(fixture.PixelNear(75, 325, 0, 0, 255));
    ASSERT_TRUE(gs.alpha_writes == 4);
}

TEST(Draw2dSprite, C4GradientCorners) {
    GfxFixture fixture;
    FakeGs     gs;
    spRGBA     top_left = {0xFF, 0, 0, 0x80};
    spRGBA     top_right = {0, 0xFF, 0, 0x80};
    spRGBA     bottom_left = {0, 0, 0xFF, 0x80};
    spRGBA     bottom_right = {0xFF, 0xFF, 0xFF, 0x80};

    fixture.Frame(kBlack, [&] {
        set2DSpriteC4(nullptr, CRect_i_(100, 100, 200, 100), &top_left, &top_right, &bottom_left,
                      &bottom_right);
    });

    ASSERT_TRUE(fixture.PixelNear(100, 100, 255, 0, 0, 4));
    ASSERT_TRUE(fixture.PixelNear(299, 100, 0, 255, 0, 4));
    ASSERT_TRUE(fixture.PixelNear(100, 199, 0, 0, 255, 4));
    ASSERT_TRUE(fixture.PixelNear(299, 199, 255, 255, 255, 4));
    ASSERT_TRUE(fixture.PixelNear(200, 100, 127, 127, 0, 4));
    // A strip of TL, TR, BL, BR splits along TR-BL, so the centre is their mean, not all four's.
    ASSERT_TRUE(fixture.PixelNear(200, 150, 0, 127, 127, 4));
}

TEST(Draw2dSprite, RotatedSpriteQuarterTurn) {
    GfxFixture fixture;
    FakeGs     gs;
    CTexture  *white = gs.Solid("white", 0x100, 4, 4, kWhite);

    fixture.Frame(kBlack, [&] {
        set2DSpriteRot(nullptr, white, CRect_i_(200, 200, 40, 20), CRect_i_(0, 0, 4, 4), 0, 0,
                       static_cast<float>(M_PI / 2.0), 0x80, 0x80, 0x80, 0x80);
    });

    // A 40x20 rect turned a quarter about its top-left corner spans 20 left and 40 up of it.
    ASSERT_TRUE(Covered(fixture, 190, 180));
    ASSERT_TRUE(Covered(fixture, 181, 161));
    ASSERT_TRUE(Covered(fixture, 198, 198));
    ASSERT_TRUE(!Covered(fixture, 205, 180));
    ASSERT_TRUE(!Covered(fixture, 190, 205));
    ASSERT_TRUE(!Covered(fixture, 175, 180));
    ASSERT_TRUE(!Covered(fixture, 190, 155));
    ASSERT_TRUE(!Covered(fixture, 220, 210));
}

TEST(Draw2dSprite, 3dSpriteDepthTested) {
    GfxFixture fixture;
    FakeGs     gs;
    CTexture  *white = gs.Solid("white", 0x100, 4, 4, kWhite);
    gs.state.depth_test = gfx::DepthTest::GEqual;
    gs.state.depth_write = true;

    auto gs_point = [](int x, int y, int z) {
        return std::array<int, 4>{27648 + x * 16, 0x7880 + y * 8, z, 0};
    };

    fixture.Frame(kBlack, [&] {
        gfx::DrawState state;
        state.depth_test = gfx::DepthTest::Always;
        state.depth_write = true;
        auto quad = Quad(100, 100, 200, 100, {0, 0xC0, 0, 0x80}, 0, 0, 0, 0, MGPortDepth(8000000));
        gfx::Draw2D(gfx::Primitive::Quads, quad, {}, state);

        spRGBA             colour = {0x80, 0x80, 0x80, 0x80};
        const CRect_i_     source(0, 0, 4, 4);
        std::array<int, 4> far_top_left = gs_point(200, 120, 1000);
        std::array<int, 4> far_bottom_right = gs_point(400, 160, 1000);
        set3DSprite(nullptr, white, source, far_top_left.data(), far_bottom_right.data(), &colour);

        std::array<int, 4> near[4] = {gs_point(150, 170, 16000000), gs_point(250, 170, 16000000),
                                      gs_point(150, 190, 16000000), gs_point(250, 190, 16000000)};
        set3DSprite(nullptr, white, source, near[0].data(), near[1].data(), near[2].data(), near[3].data(),
                    0x80);
    });

    ASSERT_TRUE(fixture.PixelNear(250, 140, 0, 0xC0, 0));
    ASSERT_TRUE(fixture.PixelNear(350, 140, 255, 255, 255));
    ASSERT_TRUE(fixture.PixelNear(200, 180, 255, 255, 255));
    ASSERT_TRUE(fixture.PixelNear(120, 150, 0, 0xC0, 0));
    ASSERT_TRUE(fixture.PixelNear(350, 170, 0, 0, 0));
    ASSERT_TRUE(gs.test_writes == 2);
}

TEST(Draw2dSprite, TableLayers) {
    GfxFixture   fixture;
    FakeGs       gs;
    CTexture    *red = gs.Solid("red", 0x100, 4, 4, Rgba(255, 0, 0));
    CTexture    *blue = gs.Solid("blue", 0x200, 4, 4, Rgba(0, 0, 255));
    SPRITE_TABLE pool[8] = {};
    CSpriteTable table;
    table.Initialize(pool, 8, 2);

    MG_SPRITE top = {};
    top.tex0 = red->tex0;
    top.source = {0, 0, 50, 40};
    top.red = top.green = top.blue = top.alpha = 0x80;
    MG_SPRITE bottom = top;
    bottom.tex0 = blue->tex0;

    // Layer 1 is drawn first even though it was queued last.
    table.AddTable(100, 100, &top, 0, 0);
    table.AddTable(130, 120, &bottom, 1, 0);

    fixture.Frame(kBlack, [&] { table.DrawTable(); });

    ASSERT_TRUE(fixture.PixelNear(110, 110, 255, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(140, 130, 255, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(160, 150, 0, 0, 255));
    ASSERT_TRUE(fixture.PixelNear(149, 139, 255, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(179, 159, 0, 0, 255));
    ASSERT_TRUE(fixture.PixelNear(180, 159, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(110, 140, 0, 0, 0));
    ASSERT_TRUE(gs.alpha_writes == 1 && gs.test_writes == 1 && gs.zbuf_writes == 1);
}

TEST(Draw2dSprite, Batch) {
    GfxFixture fixture;
    FakeGs     gs;
    CTexture  *white = gs.Solid("white", 0x100, 4, 4, kWhite);

    fixture.Frame(kBlack, [&] {
        set2DSprite_Start(nullptr, white);
        set2DSprite_Core(nullptr, white, CRect_i_(10, 10, 20, 20), CRect_i_(0, 0, 4, 4), 0x80, 0, 0, 0x80);
        set2DSprite_Core(nullptr, white, CRect_i_(50, 10, 20, 20), CRect_i_(0, 0, 4, 4), 0, 0x80, 0, 0x80);
        set2DSprite_End(nullptr, white);
        // Without an open batch a quad goes nowhere.
        set2DSprite_Core(nullptr, white, CRect_i_(90, 10, 20, 20), CRect_i_(0, 0, 4, 4), 0x80, 0x80, 0x80,
                         0x80);
        set2DSprite_End(nullptr, white);
    });

    ASSERT_TRUE(fixture.PixelNear(20, 20, 255, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(60, 20, 0, 255, 0));
    ASSERT_TRUE(fixture.PixelNear(100, 20, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(40, 20, 0, 0, 0));
}

TEST(Draw2dSprite, SetClutReordersCsm1) {
    GfxFixture         fixture;
    FakeGs             gs;
    PortDecodedTexture decoded;
    decoded.width = 2;
    decoded.height = 1;
    decoded.format = gfx::TextureFormat::Index8;
    decoded.levels.push_back({8, 16});
    unsigned palette_key = 0;
    unsigned image_key = PortCreateTexture(decoded, PortTextureOwner::Other, &palette_key);
    ASSERT_TRUE(image_key != 0 && palette_key != 0);
    CTexture font;
    font.tex0 = SCE_GS_SET_TEX0(image_key, 1, SCE_GS_PSMT8, 1, 0, 1, 0, palette_key, 0, 0, 0, 0);

    u_int clut[256] = {};
    clut[16] = 0x800000FF;
    clut[8] = 0x8000FF00;

    fixture.Frame(kBlack, [&] {
        setbilinear(0);
        SetClut(nullptr, &font, reinterpret_cast<i *>(clut));
        set2DSprite(nullptr, &font, CRect_i_(0, 0, 100, 50), CRect_i_(0, 0, 2, 1));
        setbilinear(1);
    });

    // The GS reads index 8 from the 16th stored entry and index 16 from the 8th.
    ASSERT_TRUE(fixture.PixelNear(25, 25, 255, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(75, 25, 0, 255, 0));
    PortReleaseKey(image_key);
    PortReleaseKey(palette_key);
}

TEST(Draw2dSprite, FromRegisteredTexture) {
    GfxFixture         fixture;
    FakeGs             gs;
    PortDecodedTexture decoded;
    decoded.width = 2;
    decoded.height = 2;
    decoded.levels.push_back({255, 0, 0, 255, 0, 255, 0, 255, 0, 0, 255, 255, 255, 255, 255, 255});
    unsigned key = PortCreateTexture(decoded, PortTextureOwner::Other, nullptr);
    ASSERT_TRUE(key != 0);
    CTexture texture;
    texture.tex0 = SCE_GS_SET_TEX0(key, 1, SCE_GS_PSMCT32, 1, 1, 1, 0, 0, 0, 0, 0, 0);

    fixture.Frame(kBlack, [&] {
        setbilinear(0);
        set2DSprite(nullptr, &texture, CRect_i_(200, 100, 100, 80), 0, 0);
        setbilinear(1);
    });

    // set2DSprite(screen, u, v) maps texels one to one from (u, v): only the 2x2 corner is texture,
    // the rest clamps to its edges.
    ASSERT_TRUE(fixture.PixelNear(200, 100, 255, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(201, 100, 0, 255, 0));
    ASSERT_TRUE(fixture.PixelNear(200, 101, 0, 0, 255));
    ASSERT_TRUE(fixture.PixelNear(250, 150, 255, 255, 255));
    ASSERT_TRUE(fixture.PixelNear(300, 150, 0, 0, 0));
    PortReleaseKey(key);
}
