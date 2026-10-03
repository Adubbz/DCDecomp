#include <gtest/gtest.h>

#include "gfx_fixture.hpp"

using namespace dc::test;

namespace {

constexpr std::array<uint8_t, 4> kNeutral = {0x80, 0x80, 0x80, 0x80};
constexpr std::array<uint8_t, 4> kBlack = {0, 0, 0, 0x80};

} // namespace

TEST(GfxDraw2d, TexturedQuad) {
    GfxFixture         fixture;
    uint32_t           texels[4] = {Rgba(255, 0, 0), Rgba(0, 255, 0), Rgba(0, 0, 255), Rgba(255, 255, 255)};
    gfx::TextureHandle texture = gfx::CreateTexture({2, 2, gfx::TextureFormat::Rgba8, 1, true});
    ASSERT_TRUE(texture != gfx::kNullTexture);
    ASSERT_TRUE(gfx::UpdateTexture(texture, 0, 0, 0, 2, 2, texels));

    fixture.Frame(kBlack, [&] {
        gfx::TextureBinding binding;
        binding.texture = texture;
        binding.filter = gfx::Filter::Nearest;
        auto quad = Quad(100, 100, 200, 200, kNeutral, 0, 0, 2, 2);
        gfx::Draw2D(gfx::Primitive::Quads, quad, binding, gfx::DrawState{});
        // Vertex colour 0x40 halves the texel: MODULATE with 0x80 as 1.0.
        auto dim = Quad(400, 100, 100, 100, {0x40, 0x40, 0x40, 0x80}, 1, 1, 2, 2);
        gfx::Draw2D(gfx::Primitive::Quads, dim, binding, gfx::DrawState{});
        // 0xFF doubles it, saturating.
        auto bright = Quad(400, 300, 100, 100, {0xFF, 0x80, 0x40, 0x80}, 1, 1, 2, 2);
        gfx::Draw2D(gfx::Primitive::Quads, bright, binding, gfx::DrawState{});
    });

    ASSERT_TRUE(fixture.width == 640 && fixture.height == 480);
    ASSERT_TRUE(fixture.PixelNear(150, 150, 255, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(250, 150, 0, 255, 0));
    ASSERT_TRUE(fixture.PixelNear(150, 250, 0, 0, 255));
    ASSERT_TRUE(fixture.PixelNear(250, 250, 255, 255, 255));
    ASSERT_TRUE(fixture.PixelNear(50, 50, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(450, 150, 128, 128, 128));
    ASSERT_TRUE(fixture.PixelNear(450, 350, 255, 255, 128));
    // Untouched pixels at the quad's edge: x 300 is outside [100, 300).
    ASSERT_TRUE(fixture.PixelNear(300, 150, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(299, 150, 0, 255, 0));
    gfx::DestroyTexture(texture);
}

TEST(GfxDraw2d, UntexturedLinesAndStrips) {
    GfxFixture fixture;
    fixture.Frame(kBlack, [&] {
        // Untextured colour is written as is: 0x80 is mid grey, not white.
        std::array<gfx::Vertex2D, 4> strip = {Vertex(10, 10, 0, 0, {0x80, 0x80, 0x80, 0x80}),
                                              Vertex(110, 10, 0, 0, {0x80, 0x80, 0x80, 0x80}),
                                              Vertex(10, 110, 0, 0, {0x80, 0x80, 0x80, 0x80}),
                                              Vertex(110, 110, 0, 0, {0x80, 0x80, 0x80, 0x80})};
        gfx::Draw2D(gfx::Primitive::TriangleStrip, strip, {}, gfx::DrawState{});
        std::array<gfx::Vertex2D, 2> line = {Vertex(200, 50.5f, 0, 0, {255, 255, 0, 0x80}),
                                             Vertex(300, 50.5f, 0, 0, {255, 255, 0, 0x80})};
        gfx::Draw2D(gfx::Primitive::Lines, line, {}, gfx::DrawState{});
    });
    ASSERT_TRUE(fixture.PixelNear(60, 60, 128, 128, 128));
    ASSERT_TRUE(fixture.PixelNear(250, 50, 255, 255, 0));
    ASSERT_TRUE(fixture.PixelNear(250, 60, 0, 0, 0));
}

TEST(GfxDraw2d, PaletteQuad) {
    GfxFixture         fixture;
    uint8_t            indices[4] = {0, 1, 2, 3};
    gfx::TextureHandle texture = gfx::CreateTexture({4, 1, gfx::TextureFormat::Index8, 1, true});
    gfx::TextureHandle palette = gfx::CreatePalette();
    ASSERT_TRUE(texture != gfx::kNullTexture && palette != gfx::kNullTexture);
    ASSERT_TRUE(gfx::UpdateTexture(texture, 0, 0, 0, 4, 1, indices));
    uint32_t entries[256] = {};
    entries[0] = Rgba(255, 0, 0);
    entries[1] = Rgba(0, 255, 0);
    entries[2] = Rgba(0, 0, 255);
    entries[3] = Rgba(255, 255, 0);
    ASSERT_TRUE(gfx::UpdatePalette(palette, entries));

    gfx::TextureHandle pair = gfx::CreateTexture({2, 1, gfx::TextureFormat::Index8, 1, true});
    uint8_t            pair_index[2] = {0, 1};
    ASSERT_TRUE(gfx::UpdateTexture(pair, 0, 0, 0, 2, 1, pair_index));

    fixture.Frame(kBlack, [&] {
        gfx::TextureBinding binding;
        binding.texture = texture;
        binding.palette = palette;
        binding.filter = gfx::Filter::Nearest;
        auto top = Quad(0, 0, 400, 100, kNeutral, 0, 0, 4, 1);
        gfx::Draw2D(gfx::Primitive::Quads, top, binding, gfx::DrawState{});

        // A CLUT swap between two draws in one frame: the first keeps the old entries.
        uint32_t white = Rgba(255, 255, 255);
        ASSERT_TRUE(gfx::UpdatePalette(palette, &white, 0, 1));
        auto bottom = Quad(0, 100, 400, 100, kNeutral, 0, 0, 4, 1);
        gfx::Draw2D(gfx::Primitive::Quads, bottom, binding, gfx::DrawState{});

        // Filtered: the GS looks the CLUT up first, so the middle of red|green is a blend.
        gfx::TextureBinding linear;
        linear.texture = pair;
        linear.palette = palette;
        linear.filter = gfx::Filter::Linear;
        ASSERT_TRUE(gfx::UpdatePalette(palette, entries, 0, 1));
        auto blended = Quad(0, 300, 200, 100, kNeutral, 0, 0, 2, 1);
        gfx::Draw2D(gfx::Primitive::Quads, blended, linear, gfx::DrawState{});
    });

    ASSERT_TRUE(fixture.PixelNear(50, 50, 255, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(150, 50, 0, 255, 0));
    ASSERT_TRUE(fixture.PixelNear(250, 50, 0, 0, 255));
    ASSERT_TRUE(fixture.PixelNear(350, 50, 255, 255, 0));
    ASSERT_TRUE(fixture.PixelNear(50, 150, 255, 255, 255));
    ASSERT_TRUE(fixture.PixelNear(150, 150, 0, 255, 0));
    ASSERT_TRUE(fixture.PixelNear(10, 350, 255, 0, 0, 4));
    ASSERT_TRUE(fixture.PixelNear(100, 350, 128, 128, 0, 4));
    ASSERT_TRUE(fixture.PixelNear(190, 350, 0, 255, 0, 4));
}

TEST(GfxDraw2d, BlendModes) {
    GfxFixture fixture;
    // Destination (100, 150, 200) with alpha 0x40; source (200, 100, 50) with alpha 0x40.
    const std::array<uint8_t, 4> dest = {100, 150, 200, 0x40};
    const std::array<uint8_t, 4> source = {200, 100, 50, 0x40};

    struct Case {
        gfx::GsBlend blend;
        int          r, g, b;
    };

    const Case cases[] = {
        {{0, 1, 0, 1, 0},    150, 125, 125}, // Cs * As + Cd * (1 - As)
        {{0, 2, 0, 1, 0},    200, 200, 225}, // Cd + Cs * As
        {{2, 0, 0, 1, 0},    0,   100, 175}, // Cd - Cs * As
        {{0, 1, 2, 1, 0x20}, 125, 138, 163}, // FIX 0.25
        {{2, 1, 0, 1, 0},    50,  75,  100}, // Cd * (1 - As)
        {{1, 2, 0, 1, 0},    150, 225, 255}, // Cd * (1 + As), saturating
        {{0, 1, 1, 1, 0},    150, 125, 125}, // destination alpha 0x40
        {{0, 2, 0, 2, 0},    100, 50,  25 }, // Cs * As
        {{0, 2, 2, 0, 0x40}, 255, 150, 75 }, // Cs * (1 + FIX)
        {{1, 0, 0, 2, 0},    0,   25,  75 }, // (Cd - Cs) * As
    };
    fixture.Frame(dest, [&] {
        for (size_t i = 0; i < std::size(cases); i++) {
            gfx::DrawState state;
            state.blend = true;
            state.alpha = cases[i].blend;
            auto quad = Quad(static_cast<float>(i) * 60.0f, 0, 50, 50, source);
            gfx::Draw2D(gfx::Primitive::Quads, quad, {}, state);
        }
    });
    for (size_t i = 0; i < std::size(cases); i++) {
        std::fprintf(stderr, "case %zu\n", i);
        ASSERT_TRUE(
            fixture.PixelNear(static_cast<uint32_t>(i) * 60 + 25, 25, cases[i].r, cases[i].g, cases[i].b));
    }
}

TEST(GfxDraw2d, AlphaTestAndTexa) {
    GfxFixture fixture;
    // A 24-bit texture: black texels drop out under TEXA AEM, the rest take TA0.
    uint32_t           texels[2] = {Rgba(0, 0, 0, 0), Rgba(255, 255, 255, 0)};
    gfx::TextureHandle texture = gfx::CreateTexture({2, 1, gfx::TextureFormat::Rgba8, 1, false});
    ASSERT_TRUE(gfx::UpdateTexture(texture, 0, 0, 0, 2, 1, texels));

    fixture.Frame({0, 0, 255, 0x80}, [&] {
        gfx::TextureBinding binding;
        binding.texture = texture;
        binding.filter = gfx::Filter::Nearest;
        gfx::DrawState state;
        state.blend = true;
        state.texa_aem = true;
        state.texa_ta0 = 0x40;
        auto quad = Quad(0, 0, 200, 100, kNeutral, 0, 0, 2, 1);
        gfx::Draw2D(gfx::Primitive::Quads, quad, binding, state);

        // Alpha test GEQUAL 0x41 drops the 0x40 texels, so nothing of this quad lands.
        state.alpha_test = true;
        state.alpha_func = gfx::AlphaFunc::GEqual;
        state.alpha_ref = 0x41;
        auto tested = Quad(0, 200, 200, 100, kNeutral, 0, 0, 2, 1);
        gfx::Draw2D(gfx::Primitive::Quads, tested, binding, state);
        state.alpha_ref = 0x40;
        auto passed = Quad(300, 200, 200, 100, kNeutral, 0, 0, 2, 1);
        gfx::Draw2D(gfx::Primitive::Quads, passed, binding, state);
    });
    ASSERT_TRUE(fixture.PixelNear(50, 50, 0, 0, 255));
    ASSERT_TRUE(fixture.PixelNear(150, 50, 128, 128, 255, 3));
    ASSERT_TRUE(fixture.PixelNear(150, 250, 0, 0, 255));
    ASSERT_TRUE(fixture.PixelNear(450, 250, 128, 128, 255, 3));
    ASSERT_TRUE(fixture.PixelNear(350, 250, 0, 0, 255));
}

TEST(GfxDraw2d, Fog2d) {
    GfxFixture fixture;
    fixture.Frame(kBlack, [&] {
        gfx::DrawState state;
        state.fog = true;
        state.fog_color[0] = 255;
        auto quad = Quad(0, 0, 100, 100, {0, 0, 200, 0x80});
        for (gfx::Vertex2D &vertex : quad) {
            vertex.fog = 0x80;
        }
        gfx::Draw2D(gfx::Primitive::Quads, quad, {}, state);
    });
    // (Cs * F + FOGCOL * (255 - F)) / 255 with F = 0x80.
    ASSERT_TRUE(fixture.PixelNear(50, 50, 127, 0, 100));
}

TEST(GfxDraw2d, Letterbox) {
    GfxFixture fixture(800, 480);
    gfx::SetFrameLayout({gfx::AspectMode::Letterbox});
    gfx::LogicalMapping mapping = gfx::GetLogicalMapping(gfx::kMainTarget);
    ASSERT_TRUE(mapping.pixel_width == 800 && mapping.pixel_height == 480);
    ASSERT_NEAR(mapping.scale_x, 1.0f, 1e-6f);
    ASSERT_NEAR(mapping.offset_x, 80.0f, 1e-6f);
    ASSERT_NEAR(mapping.offset_y, 0.0f, 1e-6f);

    fixture.Frame(kBlack, [&] {
        auto quad = Quad(0, 0, gfx::kLogicalWidth, gfx::kLogicalHeight, {255, 255, 255, 0x80});
        gfx::Draw2D(gfx::Primitive::Quads, quad, {}, gfx::DrawState{});
        // Logical coordinates past the 4:3 area reach into the bars.
        auto bar = Quad(-80, 0, 10, 10, {255, 0, 0, 0x80});
        gfx::Draw2D(gfx::Primitive::Quads, bar, {}, gfx::DrawState{});
        // A logical scissor clips in the same space.
        gfx::DrawState scissored;
        scissored.scissor = true;
        scissored.scissor_rect = {100, 100, 50, 50};
        auto green = Quad(0, 0, 640, 480, {0, 255, 0, 0x80});
        gfx::Draw2D(gfx::Primitive::Quads, green, {}, scissored);
    });
    ASSERT_TRUE(fixture.width == 800 && fixture.height == 480);
    ASSERT_TRUE(fixture.PixelNear(79, 240, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(80, 240, 255, 255, 255));
    ASSERT_TRUE(fixture.PixelNear(719, 240, 255, 255, 255));
    ASSERT_TRUE(fixture.PixelNear(720, 240, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(5, 5, 255, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(80 + 125, 125, 0, 255, 0));
    ASSERT_TRUE(fixture.PixelNear(80 + 99, 125, 255, 255, 255));
    ASSERT_TRUE(fixture.PixelNear(80 + 150, 125, 255, 255, 255));
}

TEST(GfxDraw2d, Resize) {
    GfxFixture fixture(640, 480);
    gfx::SetFrameLayout({gfx::AspectMode::Letterbox});
    fixture.Frame(kBlack, [] {});
    ASSERT_TRUE(fixture.width == 640 && fixture.height == 480);

    SDL_SetWindowSize(WindowHandle(), 960, 600);
    SDL_SyncWindow(WindowHandle());
    WindowPollEvents();
    gfx::RendererResize();
    fixture.Frame(kBlack, [&] {
        auto quad = Quad(0, 0, gfx::kLogicalWidth, gfx::kLogicalHeight, {255, 255, 255, 0x80});
        gfx::Draw2D(gfx::Primitive::Quads, quad, {}, gfx::DrawState{});
    });
    ASSERT_TRUE(fixture.width == 960 && fixture.height == 600);
    gfx::LogicalMapping mapping = gfx::GetLogicalMapping(gfx::kMainTarget);
    ASSERT_NEAR(mapping.scale_x, 1.25f, 1e-6f);
    ASSERT_NEAR(mapping.offset_x, 80.0f, 1e-6f);
    ASSERT_TRUE(fixture.PixelNear(79, 300, 0, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(80, 300, 255, 255, 255));
    ASSERT_TRUE(fixture.PixelNear(879, 599, 255, 255, 255));
    ASSERT_TRUE(fixture.PixelNear(880, 300, 0, 0, 0));
}
