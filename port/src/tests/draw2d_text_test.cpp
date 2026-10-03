#include <SDL3/SDL.h>
#include <gtest/gtest.h>

#include <cmath>
#include <cstring>
#include <memory>

#include "clsmes.hpp"
#include "debugfont.hpp"
#include "draw2d_fixture.hpp"

extern float RandTbl[64];

using namespace dc::test;

namespace {

constexpr std::array<uint8_t, 4> kBlue = {0, 0, 200, 0x80};

void SetText(CDebugFont &font, const char *text) {
    std::strcpy(font.text, text);
    font.length = static_cast<int>(std::strlen(text));
}

CDebugFont MakeDebugFont() {
    static char name[] = "dbgwork";
    CDebugFont  font = {};
    font.x = 100;
    font.y = 100;
    font.width = 129;
    font.height = 33;
    font.texture_name = name;
    font.alpha = 0x80;
    return font;
}

// ankfnt24's layout: 16 glyphs of 8x16 per row from '!', black around the strokes. Here 'A' is a
// solid cell and every other glyph is black.
void AddFont(FakeGs &gs) {
    std::vector<uint32_t> texels(128 * 96, Rgba(0, 0, 0));
    const int             index = 'A' - 0x21;
    for (int y = 0; y < 16; y++) {
        for (int x = 0; x < 8; x++) {
            texels[((index >> 4) * 16 + y) * 128 + (index % 16) * 8 + x] = Rgba(255, 255, 255);
        }
    }
    gs.Image("ankfnt24", 0x400, 128, 96, texels.data(), false);
}

} // namespace

TEST(Draw2dText, DebugFontGlyphs) {
    GfxFixture fixture;
    FakeGs     gs;
    AddFont(gs);
    gs.Name("dbgwork", 0x500);
    CDebugFont font = MakeDebugFont();
    SetText(font, "A A\nA");

    fixture.Frame(kBlue, [&] { font.Draw(); });

    // Glyph texels at TA0 times 0x40: half white over the blue.
    ASSERT_TRUE(fixture.PixelNear(103, 107, 127, 127, 227, 3));
    ASSERT_TRUE(fixture.PixelNear(119, 107, 127, 127, 227, 3));
    ASSERT_TRUE(fixture.PixelNear(103, 123, 127, 127, 227, 3));
    // The (1,1,1) backdrop at the same alpha where no glyph was blitted.
    ASSERT_TRUE(fixture.PixelNear(111, 107, 1, 1, 100, 2));
    ASSERT_TRUE(fixture.PixelNear(111, 123, 1, 1, 100, 2));
    ASSERT_TRUE(fixture.PixelNear(220, 107, 1, 1, 100, 2));
    ASSERT_TRUE(fixture.PixelNear(150, 131, 1, 1, 100, 2));
    // Width x height texels land on (width - 1) x (height - 1) pixels.
    ASSERT_TRUE(fixture.PixelNear(228, 107, 0, 0, 200));
    ASSERT_TRUE(fixture.PixelNear(150, 132, 0, 0, 200));
    ASSERT_TRUE(fixture.PixelNear(99, 107, 0, 0, 200));
    ASSERT_TRUE(font.length == 0);
    ASSERT_TRUE(mgTexa.AEM == 1 && mgTexa.TA0 == 0x80);
    ASSERT_TRUE(gs.texa_writes == 1);
}

TEST(Draw2dText, DebugFontWithoutFontTexture) {
    GfxFixture fixture;
    FakeGs     gs;
    gs.Name("ankfnt24", 0x400);
    gs.Name("dbgwork", 0x500);
    CDebugFont font = MakeDebugFont();
    SetText(font, "A A\nA");

    fixture.Frame(kBlue, [&] { font.Draw(); });

    ASSERT_TRUE(fixture.PixelNear(103, 107, 0, 0, 200));
    ASSERT_TRUE(fixture.PixelNear(111, 107, 0, 0, 200));
    ASSERT_TRUE(font.length == 0);
}

namespace {

// MakeFukidashi_sub's shape 0, unmirrored, as the integer points it emits.
std::vector<std::array<int, 2>> BubblePoints(int x, int width, int height) {
    static const float shape[15][2] = {
        {0.5f,  0.5f },
        {0.02f, 0.29f},
        {0.22f, 0.03f},
        {0.51f, 0.06f},
        {0.73f, 0.0f },
        {0.92f, 0.1f },
        {0.98f, 0.36f},
        {0.98f, 0.74f},
        {0.9f,  0.91f},
        {0.7f,  0.99f},
        {0.43f, 0.91f},
        {0.2f,  0.97f},
        {0.03f, 0.8f },
        {0.0f,  0.52f},
        {0.02f, 0.29f},
    };
    std::vector<std::array<int, 2>> points;
    for (const auto &point : shape) {
        points.push_back({static_cast<int>(width * point[0]) + x, static_cast<int>(height * point[1])});
    }
    return points;
}

} // namespace

TEST(Draw2dText, FukidashiMask) {
    GfxFixture         fixture;
    FakeGs             gs;
    gfx::TextureHandle base = gfx::NamedRenderTarget("fukidashibase", 640, 256, true);
    ASSERT_TRUE(base != gfx::kNullTexture);
    gs.textures[0x600] = {base, gfx::kNullTexture, 640, 256};
    gs.Name("fukidashibase", 0x600);
    gs.Solid("fuki256", 0x700, 128, 128, 0xFFFFFFFF);

    auto message = std::make_unique<ClsMes>();
    message->fukidashi_shape = 0;
    message->tail_on = 0;
    message->win_x = 100;
    message->win_y = 40;
    message->win_width = 200;
    message->win_height = 100;
    message->grow_x = 100;
    message->grow_y = 40;
    message->fade = 1.0f;
    message->edge_alpha = 0x40;
    RandTbl[0] = 0.0f;

    fixture.Frame(kBlue, [&] {
        message->MakeFukidashi(nullptr);
        ASSERT_TRUE(gfx::CurrentRenderTarget() == gfx::kMainTarget);
    });

    std::vector<uint8_t> pixels;
    uint32_t             width = 0;
    uint32_t             height = 0;
    ASSERT_TRUE(gfx::ReadbackTexture(base, pixels, width, height));
    ASSERT_TRUE(width == 640 && height == 256);
    auto at = [&](uint32_t x, uint32_t y) { return &pixels[(y * width + x) * 4]; };

    // Inside: half of fuki256's white over the bubble's 0xBF, alpha from the tile (GS 0x40).
    for (auto [x, y] : {
             std::array<uint32_t, 2>{200, 50},
             {150, 30},
             {260, 80}
    }) {
        const uint8_t *p = at(x, y);
        ASSERT_TRUE(std::abs(p[0] - 223) <= 2 && std::abs(p[1] - 223) <= 2 && std::abs(p[2] - 223) <= 2);
        ASSERT_TRUE(std::abs(p[3] - 0x7F) <= 2);
    }
    // Outside the bubble but under the fill: alpha cleared, tiles kept out.
    for (auto [x, y] : {
             std::array<uint32_t, 2>{105, 5  },
             {400, 50 },
             {20,  200},
             {295, 98 }
    }) {
        ASSERT_TRUE(at(x, y)[3] == 0);
    }
    // Below the fill's 240 field rows the target keeps what it had.
    ASSERT_TRUE(at(300, 250)[3] == 0xFF);

    // The mask is the fan: count its pixels against the area of the triangles it is made of.
    std::vector<std::array<int, 2>> points = BubblePoints(100, 200, 100);
    double                          area = 0.0;
    for (size_t i = 1; i + 1 < points.size(); i++) {
        const double ax = points[i][0] - points[0][0];
        const double ay = points[i][1] - points[0][1];
        const double bx = points[i + 1][0] - points[0][0];
        const double by = points[i + 1][1] - points[0][1];
        area += std::fabs(ax * by - ay * bx) * 0.5;
    }
    uint32_t covered = 0;
    for (uint32_t y = 0; y < 240; y++) {
        for (uint32_t x = 0; x < 640; x++) {
            covered += at(x, y)[3] != 0 ? 1 : 0;
        }
    }
    ASSERT_TRUE(std::fabs(covered - area) / area < 0.02);
    ASSERT_TRUE(gs.test_writes == 1 && gs.zbuf_writes == 1 && gs.alpha_writes == 1);
}
