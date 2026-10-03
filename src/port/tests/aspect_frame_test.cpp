#include <array>
#include <cstdint>
#include <cstring>
#include <vector>

#include "../platform/config.hpp"
#include "gfx_fixture.hpp"
#include "test.hpp"

// 2D at window aspects other than 4:3: the HUD anchored in the logical 640x480 frame centred in the
// window, ui_scale about the window's centre, full-frame 2D (fades, previous-frame feedback, frame
// grabs drawn back) reaching the window's edges, and aspect = 4:3 drawing what the letterboxed
// renderer drew.

using dc::test::GfxFixture;
using dc::test::Quad;

namespace {

constexpr std::array<uint8_t, 4> kSky = {0x20, 0x40, 0xC8, 0x80};
constexpr std::array<uint8_t, 4> kHud = {0x00, 0xFF, 0x00, 0x80};
constexpr std::array<uint8_t, 4> kRed = {0xFF, 0x00, 0x00, 0x80};

bool Near(const GfxFixture &fixture, int x, int y, std::array<uint8_t, 4> colour, int tolerance = 2) {
    std::array<uint8_t, 4> p = fixture.Pixel(static_cast<uint32_t>(x), static_cast<uint32_t>(y));
    for (int c = 0; c < 3; c++) {
        if (std::abs(p[c] - colour[c]) > tolerance) {
            std::fprintf(stderr, "pixel %d,%d is %d,%d,%d, expected %d,%d,%d\n", x, y, p[0], p[1], p[2], colour[0],
                         colour[1], colour[2]);
            return false;
        }
    }
    return true;
}

// The game's frame clear (MGClearScreen's rect is the logical frame) and a HUD box at logical
// (40, 40) to (104, 72): depthless, untextured, clear of the frame's edges.
void HudScene() {
    gfx::LogicalRect frame = {0.0f, 0.0f, gfx::kLogicalWidth, gfx::kLogicalHeight};
    gfx::Clear(true, kSky.data(), true, 0.0f, &frame);
    auto box = Quad(40.0f, 40.0f, 64.0f, 32.0f, kHud);
    gfx::Draw2D(gfx::Primitive::Quads, box, {}, gfx::DrawState{});
}

struct Placed {
    int left;
    int top;
    int right;
    int bottom;
};

// Where the HUD box lands, found in the readback.
Placed FindHud(const GfxFixture &fixture) {
    Placed placed = {1 << 30, 1 << 30, -1, -1};
    for (uint32_t y = 0; y < fixture.height; y++) {
        for (uint32_t x = 0; x < fixture.width; x++) {
            std::array<uint8_t, 4> p = fixture.Pixel(x, y);
            if (p[0] < 8 && p[1] > 0xF0 && p[2] < 8) {
                placed.left = std::min(placed.left, static_cast<int>(x));
                placed.top = std::min(placed.top, static_cast<int>(y));
                placed.right = std::max(placed.right, static_cast<int>(x));
                placed.bottom = std::max(placed.bottom, static_cast<int>(y));
            }
        }
    }
    return placed;
}

} // namespace

// At one height the HUD keeps its pixels relative to the window's centre at 4:3, 16:9 and 21:9: the
// frame is centred and its scale is the height's. The clear of the frame reaches every window edge.
// Portrait windows take the scale of their width and centre the frame vertically.
DC_TEST(aspect_hud_pixels_fixed_across_aspects) {
    struct Size {
        int width;
        int height;
    };
    const Size sizes[] = {
        {640,  480},
        {854,  480},
        {1120, 480},
    };
    for (const Size &size : sizes) {
        GfxFixture fixture(size.width, size.height);
        fixture.Frame({0, 0, 0, 0x80}, HudScene);
        Placed placed = FindHud(fixture);
        int    centre = size.width / 2;
        int    offset = (size.width - 640) / 2;
        DC_CHECK(placed.left == offset + 40 && placed.right == offset + 103);
        DC_CHECK(placed.top == 40 && placed.bottom == 71);
        DC_CHECK(placed.left - centre == -280 && placed.right - centre == -217);
        DC_CHECK(Near(fixture, 0, 0, kSky));
        DC_CHECK(Near(fixture, size.width - 1, size.height - 1, kSky));
    }
    {
        GfxFixture fixture(480, 854);
        fixture.Frame({0, 0, 0, 0x80}, HudScene);
        Placed placed = FindHud(fixture);
        // 0.75 pixels a logical unit, the frame at y 247.
        DC_CHECK(placed.left == 30 && placed.right == 77);
        DC_CHECK(placed.top == 247 + 30 && placed.bottom == 247 + 53);
        DC_CHECK(Near(fixture, 0, 0, kSky));
        DC_CHECK(Near(fixture, 479, 853, kSky));
    }
}

// ui_scale scales depthless 2D about the window's centre; 2D that tests depth (a 3D sprite) stays
// where the logical mapping puts it, among the meshes.
DC_TEST(aspect_ui_scale_about_the_centre) {
    GfxFixture fixture(854, 480);
    gfx::SetFrameLayout({gfx::AspectMode::Fill, 0.5f});
    DC_CHECK(gfx::CurrentFrameLayout().ui_scale == 0.5f);
    gfx::LogicalMapping ui = gfx::GetUiMapping(gfx::kMainTarget);
    DC_CHECK(ui.scale_x == 0.5f && ui.offset_x == 107.0f + 160.0f && ui.offset_y == 120.0f);

    fixture.Frame({0, 0, 0, 0x80}, HudScene);
    Placed placed = FindHud(fixture);
    // Logical 40 is 280 left of the centre: 140 pixels at half scale, from the window's centre 427.
    DC_CHECK(placed.left == 427 - 140 && placed.right == 427 - 140 + 31);
    DC_CHECK(placed.top == 240 - 100 && placed.bottom == 240 - 100 + 15);
    // The frame clear still covers the window.
    DC_CHECK(Near(fixture, 0, 0, kSky));
    DC_CHECK(Near(fixture, 853, 479, kSky));

    gfx::SetFrameLayout({gfx::AspectMode::Fill, 2.0f});
    fixture.Frame({0, 0, 0, 0x80}, [] {
        auto box = Quad(310.0f, 230.0f, 20.0f, 20.0f, kHud);
        gfx::Draw2D(gfx::Primitive::Quads, box, {}, gfx::DrawState{});
        gfx::DrawState sprite;
        sprite.depth_test = gfx::DepthTest::GEqual;
        auto marker = Quad(40.0f, 40.0f, 10.0f, 10.0f, kRed, 0, 0, 0, 0, 0.5f);
        gfx::Draw2D(gfx::Primitive::Quads, marker, {}, sprite);
    });
    placed = FindHud(fixture);
    DC_CHECK(placed.left == 427 - 20 && placed.right == 427 + 19);
    DC_CHECK(placed.top == 220 && placed.bottom == 259);
    DC_CHECK(Near(fixture, 107 + 45, 45, kRed));
}

// A fade over the logical frame, whole or tiled, covers a 16:9 window edge to edge; a box that
// stops short of the frame's edge does not grow.
DC_TEST(aspect_full_frame_fade_covers_16_9) {
    GfxFixture fixture(1280, 720);
    gfx::DrawState fade;
    fade.blend = true;
    fade.alpha = {0, 1, 0, 1, 0x80};
    constexpr std::array<uint8_t, 4> kHalfWhite = {0xFF, 0xFF, 0xFF, 0x40};
    fixture.Frame({0, 0, 0, 0x80}, [&] {
        auto whole = Quad(0.0f, 0.0f, gfx::kLogicalWidth, gfx::kLogicalHeight, kHalfWhite);
        gfx::Draw2D(gfx::Primitive::Quads, whole, {}, fade);
    });
    for (auto [x, y] : {std::array<int, 2>{0, 0}, {1279, 0}, {0, 719}, {1279, 719}, {640, 360}, {80, 360}}) {
        DC_CHECK(Near(fixture, x, y, {0x80, 0x80, 0x80, 0}, 3));
    }

    fixture.Frame({0, 0, 0, 0x80}, [&] {
        std::vector<gfx::Vertex2D> tiles;
        for (int row = 0; row < 2; row++) {
            for (int column = 0; column < 2; column++) {
                auto tile = Quad(320.0f * column, 240.0f * row, 320.0f, 240.0f, kHalfWhite);
                tiles.insert(tiles.end(), tile.begin(), tile.end());
            }
        }
        gfx::Draw2D(gfx::Primitive::Quads, tiles, {}, fade);
        auto inset = Quad(4.0f, 300.0f, 100.0f, 20.0f, kHud);
        gfx::Draw2D(gfx::Primitive::Quads, inset, {}, gfx::DrawState{});
    });
    for (auto [x, y] : {std::array<int, 2>{0, 0}, {1279, 0}, {0, 719}, {1279, 719}, {150, 100}}) {
        DC_CHECK(Near(fixture, x, y, {0x80, 0x80, 0x80, 0}, 3));
    }
    DC_CHECK(Near(fixture, 160 + 10, 460, kHud));
    DC_CHECK(Near(fixture, 150, 460, {0x80, 0x80, 0x80, 0}, 3));
}

// Previous-frame feedback and a frame grab drawn back carry the window's sides: the sides of the
// frame they sample, not black. Letterboxed, the sides stay black as before.
DC_TEST(aspect_previous_frame_and_frame_grab_cover_the_sides) {
    for (gfx::AspectMode mode : {gfx::AspectMode::Fill, gfx::AspectMode::Letterbox}) {
        GfxFixture fixture(1280, 720);
        gfx::SetFrameLayout({mode});
        bool fill = mode == gfx::AspectMode::Fill;
        gfx::TextureHandle grab = gfx::CreateRenderTarget(640, 480, true, false, true);
        DC_CHECK(gfx::GetTextureInfo(grab)->pixel_width == (fill ? 1280u : 640u));

        gfx::BeginRecording();
        gfx::LogicalRect frame = {0.0f, 0.0f, gfx::kLogicalWidth, gfx::kLogicalHeight};
        gfx::Clear(true, kRed.data(), true, 0.0f, &frame);
        // In the left side past the frame only.
        auto side = Quad(-100.0f, 100.0f, 80.0f, 100.0f, kHud);
        gfx::Draw2D(gfx::Primitive::Quads, side, {}, gfx::DrawState{});
        gfx::BlitTexture(gfx::kMainTarget, {0, 0, 640, 480}, grab, {0, 0, 640, 480}, gfx::Filter::Nearest);
        gfx::DisplayListRef first = gfx::EndRecording();
        DC_CHECK(gfx::RenderList(*first, 1.0f, {.canonical = true}));

        gfx::BeginRecording();
        gfx::Clear(true, kSky.data(), true, 0.0f);
        gfx::TextureBinding previous;
        previous.texture = gfx::kPreviousFrame;
        previous.filter = gfx::Filter::Nearest;
        auto top = Quad(0.0f, 0.0f, 640.0f, 240.0f, {0x80, 0x80, 0x80, 0x80}, 0.0f, 0.0f, 640.0f, 240.0f);
        gfx::Draw2D(gfx::Primitive::Quads, top, previous, gfx::DrawState{});
        gfx::TextureBinding grabbed;
        grabbed.texture = grab;
        grabbed.filter = gfx::Filter::Nearest;
        auto bottom =
            Quad(0.0f, 240.0f, 640.0f, 240.0f, {0x80, 0x80, 0x80, 0x80}, 0.0f, 0.0f, 640.0f, 240.0f);
        gfx::Draw2D(gfx::Primitive::Quads, bottom, grabbed, gfx::DrawState{});
        gfx::DisplayListRef second = gfx::EndRecording();
        DC_CHECK(gfx::RenderList(*second, 1.0f, {.canonical = true}));
        DC_CHECK(gfx::PresentCanonical());
        DC_CHECK(gfx::ReadbackFrame(fixture.pixels, fixture.width, fixture.height));

        // Logical (-60, 150): pixel (70, 225) from the previous frame, and 360 rows lower from the
        // grab, whose rows 0..240 are drawn over logical 240..480.
        // Letterboxed, nothing is drawn past the frame and the second list's clear shows there.
        std::array<uint8_t, 4> sides = fill ? kHud : kSky;
        DC_CHECK(Near(fixture, 70, 225, sides));
        DC_CHECK(Near(fixture, 70, 225 + 360, sides));
        DC_CHECK(Near(fixture, 640, 100, kRed));
        DC_CHECK(Near(fixture, 640, 600, kRed));
        std::array<uint8_t, 4> beside = fill ? kRed : kSky;
        DC_CHECK(Near(fixture, 1270, 100, beside));
        gfx::DestroyTexture(grab);
    }
}

namespace {

// Everything the frame layout touches: a frame clear, a mesh-free 3D sprite, a HUD box, an edge
// band, a fade, a scissored fill, a frame grab and the previous frame drawn back.
std::vector<uint8_t> LayoutScene(int width, int height, gfx::AspectMode mode, uint32_t &out_width) {
    GfxFixture fixture(width, height);
    gfx::SetFrameLayout({mode});
    gfx::TextureHandle grab = gfx::CreateRenderTarget(640, 480, true, false, true);
    auto record = [&](bool second) {
        gfx::BeginRecording();
        constexpr std::array<uint8_t, 4> kBlack = {0, 0, 0, 0x80};
        gfx::Clear(true, kBlack.data(), true, 0.0f);
        gfx::LogicalRect frame = {0.0f, 0.0f, gfx::kLogicalWidth, gfx::kLogicalHeight};
        gfx::Clear(true, kSky.data(), true, 0.0f, &frame);
        if (second) {
            gfx::TextureBinding previous;
            previous.texture = gfx::kPreviousFrame;
            auto back = Quad(0.0f, 0.0f, 640.0f, 480.0f, {0x80, 0x80, 0x80, 0x40}, 0.0f, 0.0f, 640.0f, 480.0f);
            gfx::DrawState blended;
            blended.blend = true;
            gfx::Draw2D(gfx::Primitive::Quads, back, previous, blended);
            gfx::TextureBinding grabbed;
            grabbed.texture = grab;
            auto strip = Quad(0.0f, 400.0f, 640.0f, 80.0f, {0x80, 0x80, 0x80, 0x80}, 0.0f, 0.0f, 640.0f, 80.0f);
            gfx::Draw2D(gfx::Primitive::Quads, strip, grabbed, gfx::DrawState{});
        }
        gfx::DrawState sprite;
        sprite.depth_test = gfx::DepthTest::GEqual;
        sprite.depth_write = true;
        auto marker = Quad(500.0f, 300.0f, 30.0f, 30.0f, kRed, 0, 0, 0, 0, 0.5f);
        gfx::Draw2D(gfx::Primitive::Quads, marker, {}, sprite);
        auto hud = Quad(40.0f, 40.0f, 64.0f, 32.0f, kHud);
        gfx::Draw2D(gfx::Primitive::Quads, hud, {}, gfx::DrawState{});
        auto band = Quad(0.0f, 200.0f, 640.0f, 16.0f, {0x80, 0x10, 0x60, 0x80});
        gfx::Draw2D(gfx::Primitive::Quads, band, {}, gfx::DrawState{});
        gfx::DrawState scissored;
        scissored.scissor = true;
        scissored.scissor_rect = {0.0f, 0.0f, 640.0f, 120.0f};
        auto fill = Quad(-50.0f, 100.0f, 740.0f, 50.0f, {0x10, 0x80, 0x80, 0x80});
        gfx::Draw2D(gfx::Primitive::Quads, fill, {}, scissored);
        gfx::DrawState fade;
        fade.blend = true;
        auto dim = Quad(0.0f, 0.0f, 640.0f, 480.0f, {0, 0, 0, 0x20});
        gfx::Draw2D(gfx::Primitive::Quads, dim, {}, fade);
        if (!second) {
            gfx::BlitTexture(gfx::kMainTarget, {0, 0, 640, 480}, grab, {0, 0, 640, 480}, gfx::Filter::Nearest);
        }
        return gfx::EndRecording();
    };
    gfx::DisplayListRef first = record(false);
    DC_CHECK(gfx::RenderList(*first, 1.0f, {.canonical = true}));
    gfx::DisplayListRef second = record(true);
    DC_CHECK(gfx::RenderList(*second, 1.0f, {.canonical = true}));
    DC_CHECK(gfx::PresentCanonical());
    std::vector<uint8_t> pixels;
    uint32_t             h = 0;
    DC_CHECK(gfx::ReadbackFrame(pixels, out_width, h));
    gfx::DestroyTexture(grab);
    return pixels;
}

} // namespace

// aspect = 4:3 is the letterboxed renderer: at 854x480 its frame holds, byte for byte, what a
// 640x480 window shows, and the bars are black. At a 4:3 window both layouts draw the same bytes, so
// every existing 4:3 screenshot is unchanged.
DC_TEST(aspect_four_three_matches_the_letterboxed_output) {
    uint32_t             narrow_width = 0;
    uint32_t             wide_width = 0;
    uint32_t             fill_width = 0;
    std::vector<uint8_t> narrow = LayoutScene(640, 480, gfx::AspectMode::Letterbox, narrow_width);
    std::vector<uint8_t> wide = LayoutScene(854, 480, gfx::AspectMode::Letterbox, wide_width);
    std::vector<uint8_t> fill = LayoutScene(640, 480, gfx::AspectMode::Fill, fill_width);
    DC_CHECK(narrow_width == 640 && wide_width == 854 && fill_width == 640);
    DC_CHECK(narrow == fill);
    bool inside = true;
    bool bars = true;
    for (uint32_t y = 0; y < 480; y++) {
        const uint8_t *row = &wide[y * 854 * 4];
        inside = inside && std::memcmp(row + 107 * 4, &narrow[y * 640 * 4], 640 * 4) == 0;
        for (uint32_t x = 0; x < 854; x++) {
            if (x >= 107 && x < 747) {
                continue;
            }
            bars = bars && row[x * 4] == 0 && row[x * 4 + 1] == 0 && row[x * 4 + 2] == 0;
        }
    }
    DC_CHECK(inside);
    DC_CHECK(bars);
}

DC_TEST(aspect_config_keys) {
    Config config = ConfigParse("");
    DC_CHECK(config.aspect == ConfigAspect::Auto && config.ui_scale == 1.0f);
    config = ConfigParse("[video]\naspect = 4:3\nui_scale = 1.25\n");
    DC_CHECK(config.aspect == ConfigAspect::FourThree && config.ui_scale == 1.25f);
    config = ConfigParse("[video]\naspect = AUTO\nui_scale = 9\n");
    DC_CHECK(config.aspect == ConfigAspect::Auto && config.ui_scale == 1.0f);
    config = ConfigParse("[video]\naspect = 16:9\nui_scale = 0.1\n");
    DC_CHECK(config.aspect == ConfigAspect::Auto && config.ui_scale == 1.0f);
}
