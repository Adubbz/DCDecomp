// SDL's headers name parameters A and B, which libgraph.h defines as macros: SDL goes first.
#include <SDL3/SDL.h>

#include "cloth.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "draw3d_fixture.hpp"
#include "rect.hpp"
#include "texture_port.hpp"
#include "water.hpp"

using namespace dc::test;

// The water samples the frame copy where each vertex lands on the screen: a copy that is red on
// its left half and blue on its right shows the split at the screen's centre column, whatever
// the surface's own extent. The surface lies at y = 5 over depths 60..160, rows 265 to 307.
DC_TEST(draw3d_water_samples_frame_copy_in_screen_space) {
    Draw3DFixture fixture;
    SetDataBuffer(&WaterData, 4096);
    unsigned  key = PortRegisterNamedTarget("water", 640, SCREEN_HALF_HEIGHT, true, PortTextureOwner::Other);
    u_long    water_bits = SCE_GS_SET_TEX0(key, 10, SCE_GS_PSMCT32, 10, 8, 1, 0, 0, 0, 0, 0, 0);
    sceGsTex0 water_tex0;
    std::memcpy(&water_tex0, &water_bits, sizeof(water_bits));

    static CWater water;
    water.SetSize(8, 8, &WaterData);
    sceVu0FVECTOR corners[4] = {
        {-40.0f, 0.0f, 60.0f,  1.0f},
        {-40.0f, 0.0f, 160.0f, 1.0f},
        {40.0f,  0.0f, 60.0f,  1.0f},
        {40.0f,  0.0f, 160.0f, 1.0f},
    };
    // Retail lifts each vertex by the height of the cell before it, so the corners' own y only
    // reaches the first column; the surface's height is the frame's.
    water.SetVertex(corners[0], corners[1], corners[2], corners[3]);
    water.frame.SetPosition(0.0f, 5.0f, 0.0f);

    fixture.Frame([&] {
        // As the dungeon does: grab the frame's field into "water", then draw over the frame.
        MGFillBox(CRect_i_(0, 0, 320 * 16, SCREEN_HALF_HEIGHT * 16), 200, 0, 0, 0x80);
        MGFillBox(CRect_i_(320 * 16, 0, 320 * 16, SCREEN_HALF_HEIGHT * 16), 0, 0, 200, 0x80);
        sceGsTex0 frame;
        MGGetFBuffTex(&frame);
        MGMoveImage(&frame, CRect_i_(0, 0, 640, SCREEN_HALF_HEIGHT), &water_tex0, 0, 0, 0);
        MGClearScreen(0, 0, 0, 0x80);
        DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1(&water, &mgRenderInfo, GetVif1Packet(), nullptr);
    });
    DC_CHECK(fixture.PixelNear(300, 285, 200, 0, 0, 4));
    DC_CHECK(fixture.PixelNear(340, 285, 0, 0, 200, 4));
    DC_CHECK(fixture.PixelNear(320, 250, 0, 0, 0));
    DC_CHECK(mgRenderInfo.fog_enabled == 0);
    PortReleaseKey(key);
}

// The cloth is rebuilt from its grid every draw and lit with its fixed material: ambient 0.3 of
// the scene's full ambient, 0x26 in GS bytes, with no directional light.
DC_TEST(draw3d_cloth_rebuilt_per_draw) {
    Draw3DFixture fixture;
    SetDataBuffer(&VisualData, 4096);
    static CCloth cloth(16, 16, 1.0f);
    cloth.Initialize(&VisualData);
    for (int i = 0; i < 16; i++) {
        for (int j = 0; j < 16; j++) {
            cloth.point[i][j][0] = static_cast<float>(j) - 7.5f;
            cloth.point[i][j][1] = static_cast<float>(i) - 7.5f;
            cloth.point[i][j][2] = 100.0f;
            cloth.point[i][j][3] = 1.0f;
            cloth.normal_grid[i][j][2] = -1.0f;
        }
    }

    fixture.Frame([&] { cloth.Draw(); });
    DC_CHECK(fixture.PixelNear(320, 240, 38, 38, 38));
    DC_CHECK(fixture.PixelNear(265, 185, 38, 38, 38));
    DC_CHECK(fixture.PixelNear(250, 240, 0, 0, 0));

    // Moved: the next draw follows the grid.
    for (int i = 0; i < 16; i++) {
        for (int j = 0; j < 16; j++) {
            cloth.point[i][j][0] += 20.0f;
        }
    }
    fixture.Frame([&] { cloth.Draw(); });
    DC_CHECK(fixture.PixelNear(320, 240, 0, 0, 0));
    DC_CHECK(fixture.PixelNear(480, 240, 38, 38, 38));
}
