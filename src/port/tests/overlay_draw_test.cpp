#include <array>
#include <chrono>
#include <cstdint>
#include <string_view>
#include <vector>

#include "../platform/overlay.hpp"
#include "gfx_fixture.hpp"
#include "test.hpp"

// The FPS counter's text drawn over a display frame (RenderOptions::overlay) and over the canonical
// image presented as a display render of the overlay alone; read back glyph by glyph, and absent from
// the canonical image in both cases.

using dc::test::GfxFixture;

namespace {

constexpr std::array<uint8_t, 4> kSky = {0x20, 0x40, 0xC8, 0x80};

struct Image {
    std::vector<uint8_t> pixels;
    uint32_t             width = 0;
    uint32_t             height = 0;

    std::array<uint8_t, 3> At(int x, int y) const {
        const uint8_t *p = &pixels[(static_cast<size_t>(y) * width + static_cast<size_t>(x)) * 4];
        return {p[0], p[1], p[2]};
    }
};

bool Near(std::array<uint8_t, 3> pixel, std::array<int, 3> expected, int tolerance = 2) {
    for (int c = 0; c < 3; c++) {
        if (std::abs(pixel[c] - expected[c]) > tolerance) {
            return false;
        }
    }
    return true;
}

// A list drawing the scene a tick would: a clear and a grey square in the corner the counter leaves.
gfx::DisplayListRef SceneList() {
    gfx::BeginRecording();
    gfx::Clear(true, kSky.data(), true, 0.0f);
    constexpr float              kSide = kOverlayPadding;
    std::array<gfx::Vertex2D, 4> square = dc::test::Quad(0.0f, 0.0f, kSide, kSide, {0x80, 0x80, 0x80, 0x80});
    gfx::Draw2D(gfx::Primitive::Quads, square, {}, gfx::DrawState{});
    return gfx::EndRecording();
}

// Every font pixel of every character: lit is white, unlit is the backdrop over the sky, with the
// text's top-left corner at (x, y) and each font pixel `pixel` pixels square.
int CheckText(const Image &image, std::string_view text, int x, int y, int pixel) {
    // 0x60 of black over the sky: the sky times (1 - 0x60 / 0x80).
    std::array<int, 3> backdrop = {kSky[0] / 4, kSky[1] / 4, kSky[2] / 4};
    int                wrong = 0;
    for (size_t i = 0; i < text.size(); i++) {
        const uint8_t *rows = OverlayGlyph(text[i]);
        for (int row = 0; row < kOverlayGlyphHeight; row++) {
            for (int column = 0; column < kOverlayAdvance; column++) {
                bool lit = rows != nullptr && column < kOverlayGlyphWidth && (rows[row] & (0x10 >> column)) != 0;
                int  px = x + (static_cast<int>(i) * kOverlayAdvance + column) * pixel;
                int  py = y + row * pixel;
                for (int dy = 0; dy < pixel; dy++) {
                    for (int dx = 0; dx < pixel; dx++) {
                        std::array<uint8_t, 3> got = image.At(px + dx, py + dy);
                        if (!Near(got, lit ? std::array<int, 3>{0xFF, 0xFF, 0xFF} : backdrop)) {
                            if (wrong++ < 5) {
                                std::fprintf(stderr, "'%c' at %d,%d: %d,%d,%d\n", text[i], px + dx, py + dy, got[0],
                                             got[1], got[2]);
                            }
                        }
                    }
                }
            }
        }
    }
    return wrong;
}

void CheckOverlaid(GfxFixture &fixture, std::string_view text, int pixel) {
    Image shown;
    DC_CHECK(gfx::ReadbackFrame(shown.pixels, shown.width, shown.height));
    DC_CHECK(shown.width == fixture.width && shown.height == fixture.height);
    int corner = kOverlayPadding * pixel;
    DC_CHECK(CheckText(shown, text, corner + kOverlayPadding * pixel, corner + kOverlayPadding * pixel, pixel) == 0);
    // The backdrop covers the scene's square at the corner; beyond it, the scene as drawn.
    DC_CHECK(Near(shown.At(corner, corner), {kSky[0] / 4, kSky[1] / 4, kSky[2] / 4}));
    DC_CHECK(Near(shown.At(corner - 1, corner - 1), {0x80, 0x80, 0x80}));
    DC_CHECK(Near(shown.At(static_cast<int>(shown.width) - 1, static_cast<int>(shown.height) - 1),
                  {kSky[0], kSky[1], kSky[2]}));
    int width = (static_cast<int>(text.size()) * kOverlayAdvance - 1 + 2 * kOverlayPadding) * pixel;
    DC_CHECK(Near(shown.At(corner + width, corner + pixel), {kSky[0], kSky[1], kSky[2]}));

    // The canonical image never holds it.
    Image canonical;
    DC_CHECK(gfx::ReadbackTexture(gfx::kPreviousFrame, canonical.pixels, canonical.width, canonical.height));
    for (int y = 0; y < (kOverlayGlyphHeight + 4 * kOverlayPadding) * pixel; y++) {
        for (int x = 0; x < width + corner; x++) {
            bool square = x < corner && y < corner;
            if (!Near(canonical.At(x, y), square ? std::array<int, 3>{0x80, 0x80, 0x80}
                                                 : std::array<int, 3>{kSky[0], kSky[1], kSky[2]})) {
                DC_CHECK(!"the canonical image holds the overlay");
            }
        }
    }
}

void DrawsTheCounter(int window_width, int window_height, int pixel) {
    GfxFixture fixture(window_width, window_height);
    fixture.width = static_cast<uint32_t>(window_width);
    fixture.height = static_cast<uint32_t>(window_height);
    DC_CHECK(OverlayPixelSize(gfx::GetLogicalMapping(gfx::kMainTarget)) == pixel);
    gfx::DisplayListRef scene = SceneList();
    DC_CHECK(gfx::RenderList(*scene, 1.0f, {.canonical = true}));

    constexpr std::string_view kText = "FPS 59.9  TICK 50.0/50  DRAWS 412";
    gfx::DisplayListRef        overlay = OverlayRecord(kText);
    DC_CHECK(overlay != nullptr);

    // A display frame with the counter over it.
    DC_CHECK(gfx::RenderList(*scene, 0.5f, {.present = true, .overlay = overlay.get()}));
    CheckOverlaid(fixture, kText, pixel);

    // The canonical image presented with the counter: a display render of the overlay alone.
    DC_CHECK(gfx::RenderList(*overlay, 1.0f, {.present = true}));
    CheckOverlaid(fixture, kText, pixel);

    // Without the overlay the display frame is the scene alone.
    DC_CHECK(gfx::RenderList(*scene, 0.5f, {.present = true}));
    Image plain;
    DC_CHECK(gfx::ReadbackFrame(plain.pixels, plain.width, plain.height));
    DC_CHECK(Near(plain.At(kOverlayPadding * pixel * 2, kOverlayPadding * pixel * 2), {kSky[0], kSky[1], kSky[2]}));
}

} // namespace

DC_TEST(overlay_draws_the_counter_over_presented_frames) {
    DrawsTheCounter(640, 480, 1);
}

// Twice the logical size: two pixels per font pixel, still on whole pixels.
DC_TEST(overlay_draws_the_counter_at_the_window_scale) {
    DrawsTheCounter(1280, 960, 2);
}

// A wide window pillarboxes logical space; the counter stays at the window's corner, in the bar.
DC_TEST(overlay_sits_in_the_window_corner_when_pillarboxed) {
    GfxFixture          fixture(960, 480);
    gfx::LogicalMapping mapping = gfx::GetLogicalMapping(gfx::kMainTarget);
    DC_CHECK(mapping.offset_x > 0.0f);
    gfx::DisplayListRef scene = SceneList();
    DC_CHECK(gfx::RenderList(*scene, 1.0f, {.canonical = true}));
    gfx::DisplayListRef overlay = OverlayRecord("60");
    DC_CHECK(gfx::RenderList(*overlay, 1.0f, {.present = true}));
    Image shown;
    DC_CHECK(gfx::ReadbackFrame(shown.pixels, shown.width, shown.height));
    // '6' row 0 is 0x06: columns 2 and 3 lit, from pixel (4, 4).
    DC_CHECK(Near(shown.At(4 + 2, 4), {0xFF, 0xFF, 0xFF}));
    DC_CHECK(Near(shown.At(4 + 3, 4), {0xFF, 0xFF, 0xFF}));
    DC_CHECK(!Near(shown.At(4 + 1, 4), {0xFF, 0xFF, 0xFF}));
}

DC_TEST(overlay_font_and_pixel_size) {
    DC_CHECK(OverlayGlyph(' ') == nullptr);
    DC_CHECK(OverlayGlyph('a') == OverlayGlyph('A'));
    DC_CHECK(OverlayGlyph('\x01') == OverlayGlyph('?'));
    for (char c : std::string_view("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ./:-%()")) {
        DC_CHECK(OverlayGlyph(c) != OverlayGlyph('?') || c == '?');
    }
    auto mapping = [](float scale) { return gfx::LogicalMapping{scale, scale, 0.0f, 0.0f, 0, 0}; };
    DC_CHECK(OverlayPixelSize(mapping(0.5f)) == 1);
    DC_CHECK(OverlayPixelSize(mapping(1.0f)) == 1);
    DC_CHECK(OverlayPixelSize(mapping(2.0f)) == 2);
    DC_CHECK(OverlayPixelSize(mapping(2.25f)) == 2);
    DC_CHECK(OverlayPixelSize(mapping(4.5f)) == 5);
}

DC_TEST(overlay_rate_over_half_second_windows) {
    using namespace std::chrono_literals;
    OverlayRate                    rate;
    OverlayRate::Clock::time_point t0;
    bool                           closed = false;
    for (int i = 0; i <= 50; i++) {
        closed = rate.Count(t0 + i * 10ms);
        DC_CHECK(closed == (i == 50));
    }
    DC_CHECK_NEAR(rate.PerSecond(), 100.0, 1e-9);
    // 144 Hz for the next window.
    auto start = t0 + 500ms;
    for (int i = 1; i <= 72; i++) {
        rate.Count(start + std::chrono::duration_cast<OverlayRate::Clock::duration>(i * 1s / 144.0));
    }
    DC_CHECK_NEAR(rate.PerSecond(), 144.0, 1e-6);
}
