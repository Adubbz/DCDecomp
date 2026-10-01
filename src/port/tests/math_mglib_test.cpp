#include <libvu0.h>

#include <bit>
#include <cmath>
#include <cstdint>

#include "mglib.hpp"
#include "renderinfo.hpp"
#include "test.hpp"

namespace {

// Projection scale 800, near 10, far 65535 (what main.cpp sets), and an identity camera. PAL's
// view_scaled halves y, so a camera-space point (x, y, z) lands at x * 800 / z + 2048 and
// y * 400 / z + 2048.
void SetUpCamera() {
    MGSetRenderInfo(800.0f, 10.0f, 65535.0f);
    sceVu0FMATRIX view;
    sceVu0UnitMatrix(view);
    sceVu0FVECTOR eye = {0.0f, 0.0f, 0.0f, 0.0f};
    MGSetViewMatrix(view, eye);
}

int ExpectedDepth(float z) {
    double depth = ((double) mgRenderInfo.offset[2] * z + mgRenderInfo.scale[2]) / z;
    return (int) depth;
}

} // namespace

// GS 12.4 corners: the centre (2128, 2128) -/+ the half size (10, 5) * 800 / 100. z is the integer
// depth and w, without fog, the clip w's float bits.
DC_TEST(math_mglib_sprite_corners) {
    SetUpCamera();
    int   top_left[4];
    int   bottom_right[4];
    float position[4] = {10.0f, 20.0f, 100.0f, 1.0f};

    DC_CHECK(MGRotTransPers3DSprite(top_left, bottom_right, position, 20.0f, 10.0f, 0) == 1);
    DC_CHECK(top_left[0] == 2048 * 16 && top_left[1] == 2088 * 16);
    DC_CHECK(bottom_right[0] == 2208 * 16 && bottom_right[1] == 2168 * 16);
    DC_CHECK(std::abs(top_left[2] - ExpectedDepth(100.0f)) <= 2);
    DC_CHECK(top_left[2] == bottom_right[2]);
    DC_CHECK(top_left[3] == std::bit_cast<std::int32_t>(100.0f));
    DC_CHECK(bottom_right[3] == std::bit_cast<std::int32_t>(100.0f));
}

// Visible only with both corners strictly inside 0..4096 on x and y and w > 0: a corner exactly
// on 0 or 4096 sets the sticky zero flag and hides the sprite.
DC_TEST(math_mglib_sprite_visibility) {
    SetUpCamera();
    int top_left[4];
    int bottom_right[4];

    float left_edge[4] = {-246.0f, 0.0f, 100.0f, 1.0f};
    DC_CHECK(MGRotTransPers3DSprite(top_left, bottom_right, left_edge, 20.0f, 10.0f, 0) == 0);
    DC_CHECK(top_left[0] == 0 && bottom_right[0] == 160 * 16);

    float inside_left[4] = {-245.0f, 0.0f, 100.0f, 1.0f};
    DC_CHECK(MGRotTransPers3DSprite(top_left, bottom_right, inside_left, 20.0f, 10.0f, 0) == 1);
    DC_CHECK(top_left[0] == 8 * 16);

    float right_edge[4] = {246.0f, 0.0f, 100.0f, 1.0f};
    DC_CHECK(MGRotTransPers3DSprite(top_left, bottom_right, right_edge, 20.0f, 10.0f, 0) == 0);
    DC_CHECK(bottom_right[0] == 4096 * 16);

    float behind[4] = {0.0f, 0.0f, -100.0f, 1.0f};
    DC_CHECK(MGRotTransPers3DSprite(top_left, bottom_right, behind, 20.0f, 10.0f, 0) == 0);

    float off_bottom[4] = {0.0f, 600.0f, 100.0f, 1.0f};
    DC_CHECK(MGRotTransPers3DSprite(top_left, bottom_right, off_bottom, 20.0f, 10.0f, 0) == 0);
}

// With fog, both corners' w is max(min(fog_a + fog_b / w, fog_near), fog_far) truncated. With
// near 100 -> 255 and far 1000 -> 0, depth 550 gives -28.33 + 28333.33 / 550 = 23.18.
DC_TEST(math_mglib_sprite_fog) {
    SetUpCamera();
    MGSetFogParm(100.0f, 1000.0f, 0, 0, 0, 0.0f, 255.0f);
    int top_left[4];
    int bottom_right[4];

    float middle[4] = {0.0f, 0.0f, 550.0f, 1.0f};
    DC_CHECK(MGRotTransPers3DSprite(top_left, bottom_right, middle, 20.0f, 10.0f, 1) == 1);
    DC_CHECK(top_left[3] == 23 && bottom_right[3] == 23);
    DC_CHECK(top_left[0] == (2048 * 16 - (int) (8000.0f / 550.0f * 16.0f)) ||
             top_left[0] == (2048 * 16 - (int) (8000.0f / 550.0f * 16.0f)) - 1);

    float close[4] = {0.0f, 0.0f, 50.0f, 1.0f};
    MGRotTransPers3DSprite(top_left, bottom_right, close, 20.0f, 10.0f, 1);
    DC_CHECK(top_left[3] == 255);

    // Retail clamps to near first and far second; MGRotTransPers2D does it the other way round.
    mgRenderInfo.fog_near = 10.0f;
    mgRenderInfo.fog_far = 20.0f;
    MGRotTransPers3DSprite(top_left, bottom_right, middle, 20.0f, 10.0f, 1);
    DC_CHECK(top_left[3] == 20);
}

// Three lights through sceVu0NormalLightMatrix, which leaves each light's reversed direction in a
// column. For n = (0.6, 0.8, 0) the intensities are 0.8, 0.6 and -0.8 clamped to 0, so the colour
// is ambient + 0.8 * c0 + 0.6 * c1. MGSetPLight zeroes the colours' w lanes.
DC_TEST(math_mglib_calc_color) {
    sceVu0FVECTOR l0 = {0.0f, -1.0f, 0.0f, 0.0f};
    sceVu0FVECTOR l1 = {-1.0f, 0.0f, 0.0f, 0.0f};
    sceVu0FVECTOR l2 = {0.0f, 1.0f, 0.0f, 0.0f};
    sceVu0FMATRIX direction;
    sceVu0NormalLightMatrix(direction, l0, l1, l2);
    sceVu0FMATRIX colour = {
        {100.0f,  50.0f,   25.0f,   9.0f   },
        {10.0f,   20.0f,   30.0f,   40.0f  },
        {1000.0f, 1000.0f, 1000.0f, 1000.0f},
        {7.0f,    7.0f,    7.0f,    7.0f   },
    };
    MGSetPLight(direction, colour);
    sceVu0FVECTOR ambient = {20.0f, 30.0f, 40.0f, 50.0f};
    MGSetAmbient(ambient);

    float normal[4] = {0.6f, 0.8f, 0.0f, 0.0f};
    float out[4] = {-1.0f, -1.0f, -1.0f, -1.0f};
    MGCalcColor(out, normal);
    DC_CHECK_NEAR(out[0], 106.0f, 1e-4f);
    DC_CHECK_NEAR(out[1], 82.0f, 1e-4f);
    DC_CHECK_NEAR(out[2], 78.0f, 1e-4f);
    DC_CHECK(out[3] == 50.0f);

    // Facing the third light: every colour lane clamps at 255, and so does w.
    float         up[4] = {0.0f, -1.0f, 0.0f, 0.0f};
    sceVu0FVECTOR bright = {20.0f, 30.0f, 40.0f, 300.0f};
    MGSetAmbient(bright);
    MGCalcColor(out, up);
    DC_CHECK(out[0] == 255.0f && out[1] == 255.0f && out[2] == 255.0f && out[3] == 255.0f);

    // A normal facing no light leaves the ambient.
    float side[4] = {0.0f, 0.0f, 1.0f, 0.0f};
    MGSetAmbient(ambient);
    MGCalcColor(out, side);
    DC_CHECK(out[0] == 20.0f && out[1] == 30.0f && out[2] == 40.0f && out[3] == 50.0f);
}
