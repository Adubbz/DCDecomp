// SDL's headers name parameters A and B, which libgraph.h defines as macros: SDL goes first.
#include <SDL3/SDL.h>

#include <algorithm>
#include <optional>

#include "collision.hpp"
#include "draw3d_fixture.hpp"
#include "framevu1.hpp"
#include "gameloop.hpp"
#include "rect.hpp"
#include "visual.hpp"

// The game's 3D at window aspects other than 4:3: retail's vertical field of view (scale 800 over
// 240 rows), the horizontal one following the window, the screen-bound cull and MGClipVertex
// testing what the window shows, and the game's CPU projections still landing 2D on the meshes.

using namespace dc::test;

namespace {

constexpr std::array<float, 4> kOrange = {1.0f, 0.5f, 0.25f, 1.0f};

// A model whose screen cull is on, with its bound the quad's own box.
struct CulledModel {
    CulledModel(float x0, float y0, float x1, float y1, float z) {
        MdtBuilder builder;
        builder.Quad(x0, y0, x1, y1, z, builder.Material(kOrange));
        image = builder.Build();
        visual.CreateVUdataFromMDT(block, image.data(), 0, 0);
        visual.vu_data_buffer[0] = visual.vu_data;
        visual.vu_data_buffer[1] = visual.vu_data;
        visual.SetMDTDataAddress(image.data());
        frame.SetVisual(&visual);
        frame.attr.cull_enable = true;
        for (int i = 0; i < 8; i++) {
            frame.corner[i][0] = i & 1 ? x1 : x0;
            frame.corner[i][1] = i & 2 ? y1 : y0;
            frame.corner[i][2] = z + (i & 4 ? 1.0f : -1.0f);
            frame.corner[i][3] = 1.0f;
        }
    }

    std::vector<u_int> image;
    alignas(64) unsigned int block[64] = {};
    CVisualMDTVu1 visual;
    CFrameVu1     frame;
};

struct PixelBox {
    int left = 1 << 30;
    int top = 1 << 30;
    int right = -1;
    int bottom = -1;

    bool Empty() const { return right < left; }
};

PixelBox BoxOf(const Draw3DFixture &fixture, std::array<int, 3> colour) {
    PixelBox box;
    for (uint32_t y = 0; y < fixture.height; y++) {
        for (uint32_t x = 0; x < fixture.width; x++) {
            std::array<uint8_t, 4> p = fixture.Pixel(x, y);
            bool match = std::abs(p[0] - colour[0]) <= 2 && std::abs(p[1] - colour[1]) <= 2 &&
                         std::abs(p[2] - colour[2]) <= 2;
            if (match) {
                box.left = std::min(box.left, static_cast<int>(x));
                box.top = std::min(box.top, static_cast<int>(y));
                box.right = std::max(box.right, static_cast<int>(x));
                box.bottom = std::max(box.bottom, static_cast<int>(y));
            }
        }
    }
    return box;
}

uint64_t LastTickDraws() {
    return GamePresentStatistics().last_draws;
}

} // namespace

// A quad from x 41 to 49 at depth 100 lies at logical x 648 to 712, past the 4:3 frame's right
// edge (640). At 854x480 the frame is centred 107 pixels in and the window shows logical x up to
// 747, so the frame's cull keeps it and it lands at pixels 755 to 819; at 640x480 retail's cull
// drops it before it is drawn.
DC_TEST(aspect_edge_mesh_visible_at_16_9) {
    Draw3DFixture       fixture(854, 480);
    CulledModel         model(41.0f, -5.0f, 49.0f, 5.0f, 100.0f);
    gfx::LogicalMapping mapping = gfx::GetLogicalMapping(gfx::kMainTarget);
    DC_CHECK(mapping.scale_x == 1.0f && mapping.offset_x == 107.0f);

    fixture.Frame([&] { MGDraw(&model.frame); });
    DC_CHECK(LastTickDraws() == 1);
    DC_CHECK(fixture.PixelNear(107 + 680, 240, 128, 64, 32));
    DC_CHECK(fixture.PixelNear(107 + 652, 202, 128, 64, 32));
    DC_CHECK(fixture.PixelNear(107 + 708, 278, 128, 64, 32));
    DC_CHECK(fixture.PixelNear(107 + 644, 240, 0, 0, 0));
    DC_CHECK(fixture.PixelNear(107 + 716, 240, 0, 0, 0));

    sceVu0FVECTOR inside = {45.0f, 0.0f, 100.0f, 1.0f};
    DC_CHECK(MGClipVertex(inside) == 0);
    CBoxVu0 box = {};
    box.min[0] = 41.0f;
    box.min[1] = -5.0f;
    box.min[2] = 99.0f;
    box.max[0] = 49.0f;
    box.max[1] = 5.0f;
    box.max[2] = 101.0f;
    box.min[3] = box.max[3] = 1.0f;
    DC_CHECK(MGClipBox(&box) == 0);
    // Past what the window shows it is culled at 16:9 too.
    sceVu0FVECTOR beyond = {60.0f, 0.0f, 100.0f, 1.0f};
    DC_CHECK(MGClipVertex(beyond) == 0x1);
}

DC_TEST(aspect_edge_mesh_culled_at_4_3) {
    Draw3DFixture fixture(640, 480);
    CulledModel   model(41.0f, -5.0f, 49.0f, 5.0f, 100.0f);
    fixture.Frame([&] { MGDraw(&model.frame); });
    DC_CHECK(LastTickDraws() == 0);
    DC_CHECK(fixture.PixelNear(639, 240, 0, 0, 0));

    sceVu0FVECTOR inside = {45.0f, 0.0f, 100.0f, 1.0f};
    DC_CHECK(MGClipVertex(inside) == 0x1);
    CBoxVu0 box = {};
    box.min[0] = 41.0f;
    box.min[1] = -5.0f;
    box.min[2] = 99.0f;
    box.max[0] = 49.0f;
    box.max[1] = 5.0f;
    box.max[2] = 101.0f;
    box.min[3] = box.max[3] = 1.0f;
    DC_CHECK(MGClipBox(&box) == 1);

    // A model inside the frame is drawn at both, the same rows on the same scale.
    CulledModel centre(-10.0f, -5.0f, 10.0f, 5.0f, 100.0f);
    fixture.Frame([&] { MGDraw(&centre.frame); });
    DC_CHECK(LastTickDraws() == 1);
    DC_CHECK(fixture.PixelNear(320, 240, 128, 64, 32));
}

// aspect = 4:3 keeps retail's cull at any window: the same model is dropped at 854x480 too.
DC_TEST(aspect_edge_mesh_culled_when_letterboxed) {
    Draw3DFixture fixture(854, 480);
    gfx::SetFrameLayout({gfx::AspectMode::Letterbox});
    CulledModel model(41.0f, -5.0f, 49.0f, 5.0f, 100.0f);
    fixture.Frame([&] { MGDraw(&model.frame); });
    DC_CHECK(LastTickDraws() == 0);
    DC_CHECK(fixture.PixelNear(107 + 680, 240, 0, 0, 0));
}

// Retail's vertical field of view at any width: a quad 5 units above and below the axis at depth
// 100 spans logical rows 200 to 280 whatever the aspect, so at 1280x720 (1.5 pixels a row, the
// frame centred at x 160) it covers pixel rows 300 to 420 and grows nothing vertically. A narrower
// window keeps the frame's width and shows more above and below instead.
DC_TEST(aspect_projection_keeps_the_vertical_field_of_view) {
    {
        Draw3DFixture fixture(1280, 720);
        CulledModel   model(-10.0f, -5.0f, 10.0f, 5.0f, 100.0f);
        fixture.Frame([&] { MGDraw(&model.frame); });
        PixelBox box = BoxOf(fixture, {128, 64, 32});
        DC_CHECK(!box.Empty());
        DC_CHECK(box.top == 300 && box.bottom == 419);
        DC_CHECK(box.left == 160 + 360 && box.right == 160 + 599);
    }
    {
        // Portrait: 480x854 maps 640 logical columns onto 480 pixels (0.75) and centres the frame
        // vertically at (854 - 360) / 2 = 247.
        Draw3DFixture       fixture(480, 854);
        CulledModel         model(-10.0f, -5.0f, 10.0f, 5.0f, 100.0f);
        gfx::LogicalMapping mapping = gfx::GetLogicalMapping(gfx::kMainTarget);
        DC_CHECK(mapping.scale_y == 0.75f && mapping.offset_x == 0.0f && mapping.offset_y == 247.0f);
        fixture.Frame([&] { MGDraw(&model.frame); });
        PixelBox box = BoxOf(fixture, {128, 64, 32});
        DC_CHECK(box.top == 247 + 150 && box.bottom == 247 + 209);
        DC_CHECK(box.left == 180 && box.right == 299);
        // Above the frame the window shows past retail's top; the cull lets a model there through.
        CulledModel high(-10.0f, -40.0f, 10.0f, -32.0f, 100.0f);
        fixture.Frame([&] { MGDraw(&high.frame); });
        DC_CHECK(LastTickDraws() == 1);
        DC_CHECK(fixture.PixelNear(240, 247 + static_cast<int>(0.75f * (240.0f - 288.0f)), 128, 64, 32));
    }
}

// The cursors are 2D the game places from its CPU projections (the dungeon's lock-on corners from
// MGRotTransPers3DSprite, the town's from MGRotTransPers2D, the edit box's lines from
// MGRotTransPers), all in the logical frame. At 1280x720 a mesh past the 4:3 frame's right edge
// and a 2D box at the projected corners of the same quad cover the same pixels.
DC_TEST(aspect_cursor_lands_on_its_mesh_at_16_9) {
    Draw3DFixture fixture(1280, 720);
    const float   x0 = 44.0f, x1 = 52.0f, y0 = 6.0f, y1 = 12.0f, z = 100.0f;
    CulledModel   model(x0, y0, x1, y1, z);

    fixture.Frame([&] { MGDraw(&model.frame); });
    PixelBox mesh = BoxOf(fixture, {128, 64, 32});
    DC_CHECK(!mesh.Empty());
    // Logical 672..736 by 288..336: wholly right of the logical frame.
    DC_CHECK(mesh.left > 160 + 960);

    // MGRotTransPers: GS 12.4, x about 2048 and y on the field; MGFillBox takes the same window
    // offsets the 2D units do.
    int           top_left[4];
    int           bottom_right[4];
    sceVu0FVECTOR a = {x0, y0, z, 1.0f};
    sceVu0FVECTOR b = {x1, y1, z, 1.0f};
    DC_CHECK(MGRotTransPers(top_left, a, 0) == 1);
    DC_CHECK(MGRotTransPers(bottom_right, b, 0) == 1);
    CRect_i_ rect(top_left[0] - 0x6C00, top_left[1] - GS_Y_OFFSET, bottom_right[0] - top_left[0],
                  bottom_right[1] - top_left[1]);
    fixture.Frame([&] { MGFillBox(rect, 0, 0, 0x80, 0x80); });
    PixelBox fill = BoxOf(fixture, {0, 0, 128});
    DC_CHECK(std::abs(fill.left - mesh.left) <= 1 && std::abs(fill.right - mesh.right) <= 1);
    DC_CHECK(std::abs(fill.top - mesh.top) <= 1 && std::abs(fill.bottom - mesh.bottom) <= 1);

    // The town's cursor point (MGRotTransPers2D, logical pixels) is the mesh's centre.
    int           screen[4];
    sceVu0FVECTOR centre = {(x0 + x1) * 0.5f, (y0 + y1) * 0.5f, z, 1.0f};
    DC_CHECK(MGRotTransPers2D(screen, centre, 0) == 1);
    gfx::LogicalMapping mapping = gfx::GetLogicalMapping(gfx::kMainTarget);
    float               px = static_cast<float>(screen[0]) * mapping.scale_x + mapping.offset_x;
    float               py = static_cast<float>(screen[1]) * mapping.scale_y + mapping.offset_y;
    DC_CHECK(std::abs(px - 0.5f * static_cast<float>(mesh.left + mesh.right + 1)) <= 1.0f);
    DC_CHECK(std::abs(py - 0.5f * static_cast<float>(mesh.top + mesh.bottom + 1)) <= 1.0f);
    // Game logic sees retail's numbers: logical 320 + 800 * 48 / 100.
    DC_CHECK(screen[0] == 704 && screen[1] == 312);

    // The dungeon's lock-on corners: MGRotTransPers3DSprite's 12.4 corners less 0x6C08 and the
    // field offset, as DrawtargetCursor takes them, frame the same point.
    int corner_a[4];
    int corner_b[4];
    DC_CHECK(MGRotTransPers3DSprite(corner_a, corner_b, centre, 2.0f, 2.0f, 0) == 1);
    int cx = ((corner_a[0] + corner_b[0]) / 2 - 0x6C08) >> 4;
    int cy = ((corner_a[1] + corner_b[1]) / 2 - (GS_Y_OFFSET + 8)) >> 3;
    DC_CHECK(std::abs(cx - 704) <= 1 && std::abs(cy - 312) <= 2);
}

// The game's full-frame MGFillBox (the dungeon's screen filter, 640 by PAL's 448 rows) reaches the
// window's sides and top at 16:9; rows retail left uncovered at the bottom stay uncovered.
DC_TEST(aspect_full_frame_fill_box_covers_the_window) {
    Draw3DFixture fixture(1280, 720);
    fixture.Frame([&] { MGFillBox(CRect_i_(0, 0, 0x2800, 0xE00), 0x80, 0, 0, 0x80); });
    DC_CHECK(fixture.PixelNear(0, 0, 128, 0, 0));
    DC_CHECK(fixture.PixelNear(1279, 0, 128, 0, 0));
    DC_CHECK(fixture.PixelNear(0, 600, 128, 0, 0));
    DC_CHECK(fixture.PixelNear(1279, 600, 128, 0, 0));
    DC_CHECK(fixture.PixelNear(640, 360, 128, 0, 0));
    DC_CHECK(fixture.PixelNear(0, 719, 0, 0, 0));

    gfx::SetFrameLayout({gfx::AspectMode::Letterbox});
    fixture.Frame([&] { MGFillBox(CRect_i_(0, 0, 0x2800, 0xE00), 0x80, 0, 0, 0x80); });
    DC_CHECK(fixture.PixelNear(0, 0, 0, 0, 0));
    DC_CHECK(fixture.PixelNear(159, 360, 0, 0, 0));
    DC_CHECK(fixture.PixelNear(161, 360, 128, 0, 0));
}
