#include <libvu0.h>

#include <bit>
#include <cfloat>
#include <cstring>

#include "mathutil.hpp"
#include "stubs/collisionmdt.hpp"
#include "stubs/frame.hpp"
#include "stubs/water.hpp"
#include "test.hpp"

namespace {

bool Same(const float *a, const float *b, int n) {
    return std::memcmp(a, b, sizeof(float) * n) == 0;
}

} // namespace

DC_TEST(math_frame_mul_matches_mul_matrix) {
    sceVu0FMATRIX left = {
        {0.0f,  1.0f, 0.0f, 0.0f},
        {-1.0f, 0.0f, 0.0f, 0.0f},
        {0.0f,  0.0f, 1.0f, 0.0f},
        {5.0f,  6.0f, 7.0f, 1.0f},
    };
    sceVu0FMATRIX right = {
        {2.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 2.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 2.0f, 0.0f},
        {1.0f, 0.0f, 0.0f, 1.0f},
    };
    const float expected[4][4] = {
        {0.0f,  2.0f, 0.0f, 0.0f},
        {-2.0f, 0.0f, 0.0f, 0.0f},
        {0.0f,  0.0f, 2.0f, 0.0f},
        {5.0f,  7.0f, 7.0f, 1.0f},
    };
    sceVu0FMATRIX out;
    MulFrameMatrix(out, left, right);
    DC_CHECK(Same(&out[0][0], &expected[0][0], 16));

    sceVu0FMATRIX reference;
    MulMatrix(reference, left, right);
    DC_CHECK(Same(&out[0][0], &reference[0][0], 16));
}

// Rows 0-2 take scale x, y, z on all four lanes, w included; row 3 is untouched.
DC_TEST(math_frame_scale_copy_zero) {
    sceVu0FMATRIX m = {
        {1.0f,  2.0f,  3.0f,  4.0f },
        {5.0f,  6.0f,  7.0f,  8.0f },
        {9.0f,  10.0f, 11.0f, 12.0f},
        {13.0f, 14.0f, 15.0f, 16.0f},
    };
    sceVu0FVECTOR scale = {2.0f, -1.0f, 0.5f, 100.0f};
    const float   expected[4][4] = {
        {2.0f,  4.0f,  6.0f,  8.0f },
        {-5.0f, -6.0f, -7.0f, -8.0f},
        {4.5f,  5.0f,  5.5f,  6.0f },
        {13.0f, 14.0f, 15.0f, 16.0f},
    };
    sceVu0FMATRIX out;
    ScaleMatrix(out, m, scale);
    DC_CHECK(Same(&out[0][0], &expected[0][0], 16));

    sceVu0FMATRIX copy;
    CopyMatrix(copy, out);
    DC_CHECK(Same(&copy[0][0], &expected[0][0], 16));

    ZeroMatrix(copy);
    const float zero[16] = {};
    DC_CHECK(Same(&copy[0][0], zero, 16));
}

// x and y are divided by |z|, so a corner behind the eye folds onto its own side; z and w enter
// the extremes undivided.
DC_TEST(math_frame_screen_bound) {
    sceVu0FVECTOR screen[8] = {
        {10.0f,  20.0f,  2.0f,   1.0f },
        {-10.0f, 4.0f,   4.0f,   2.0f },
        {6.0f,   -6.0f,  -3.0f,  3.0f },
        {0.0f,   0.0f,   1.0f,   4.0f },
        {1.0f,   1.0f,   1.0f,   -5.0f},
        {2.0f,   2.0f,   8.0f,   6.0f },
        {-30.0f, 9.0f,   -10.0f, 7.0f },
        {4.0f,   -40.0f, 5.0f,   0.5f },
    };
    sceVu0FVECTOR max;
    sceVu0FVECTOR min;
    ScreenBound(screen, max, min);
    DC_CHECK(max[0] == 5.0f && max[1] == 10.0f && max[2] == 8.0f && max[3] == 7.0f);
    DC_CHECK(min[0] == -3.0f && min[1] == -8.0f && min[2] == -10.0f && min[3] == -5.0f);
    DC_CHECK(screen[0][0] == 10.0f);
}

// A corner at z = 0 is scaled by the unit's saturated 1/0 instead of an infinity.
DC_TEST(math_frame_screen_bound_zero_depth) {
    sceVu0FVECTOR screen[8];
    for (auto &corner : screen) {
        corner[0] = 1.0f;
        corner[1] = 0.0f;
        corner[2] = 1.0f;
        corner[3] = 1.0f;
    }
    screen[3][0] = 2.0f;
    screen[3][2] = 0.0f;
    sceVu0FVECTOR max;
    sceVu0FVECTOR min;
    ScreenBound(screen, max, min);
    DC_CHECK(max[0] == FLT_MAX);
    DC_CHECK(max[1] == 0.0f && min[1] == 0.0f);
    DC_CHECK(min[0] == 1.0f);
}

// The three corners are read from p0 onwards, as the caller's contiguous triangle lays them out,
// and written back through p0, p1 and p2. The plane is (b - a) x (c - a); w is zeroed where retail
// leaves an unwritten register lane.
DC_TEST(math_frame_trance_normal) {
    sceVu0FMATRIX m = {
        {0.0f,  1.0f, 0.0f, 0.0f},
        {-1.0f, 0.0f, 0.0f, 0.0f},
        {0.0f,  0.0f, 1.0f, 0.0f},
        {10.0f, 0.0f, 0.0f, 1.0f},
    };
    pre_trance_normal(m);
    std::memset(m, 0, sizeof(m));

    sceVu0FVECTOR tri[3] = {
        {0.0f, 0.0f, 0.0f, 1.0f},
        {1.0f, 0.0f, 0.0f, 1.0f},
        {0.0f, 1.0f, 0.0f, 1.0f},
    };
    sceVu0FVECTOR plane = {5.0f, 5.0f, 5.0f, 5.0f};
    trance_normal(tri[0], tri[1], tri[2], plane);

    const float expected[3][4] = {
        {10.0f, 0.0f, 0.0f, 1.0f},
        {10.0f, 1.0f, 0.0f, 1.0f},
        {9.0f,  0.0f, 0.0f, 1.0f},
    };
    DC_CHECK(Same(&tri[0][0], &expected[0][0], 12));
    DC_CHECK(plane[0] == 0.0f && plane[1] == 0.0f && plane[2] == 1.0f && plane[3] == 0.0f);

    // A second triangle reuses the matrix held by pre_trance_normal.
    sceVu0FVECTOR again[3] = {
        {0.0f, 0.0f, 1.0f, 1.0f},
        {0.0f, 0.0f, 2.0f, 1.0f},
        {0.0f, 0.0f, 3.0f, 1.0f},
    };
    trance_normal(again[0], again[1], again[2], plane);
    DC_CHECK(again[2][0] == 10.0f && again[2][2] == 3.0f);
}

DC_TEST(math_collision_maxmin3_normal) {
    float a[4] = {0.0f, 5.0f, -1.0f, 1.0f};
    float b[4] = {2.0f, -3.0f, 4.0f, 0.0f};
    float c[4] = {-1.0f, 1.0f, 6.0f, 2.0f};
    float hi[4];
    float lo[4];
    vu_maxmin3(hi, lo, a, b, c);
    DC_CHECK(hi[0] == 2.0f && hi[1] == 5.0f && hi[2] == 6.0f && hi[3] == 2.0f);
    DC_CHECK(lo[0] == -1.0f && lo[1] == -3.0f && lo[2] == -1.0f && lo[3] == 0.0f);

    float p0[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    float p1[4] = {0.0f, 0.0f, 2.0f, 1.0f};
    float p2[4] = {3.0f, 0.0f, 0.0f, 1.0f};
    float n[4] = {1.0f, 1.0f, 1.0f, 1.0f};
    vu_normal(n, p0, p1, p2);
    DC_CHECK(n[0] == 0.0f && n[1] == 6.0f && n[2] == 0.0f && n[3] == 0.0f);
}

// held max - min and max - held min on xyz: positive everywhere is a hit (0); a lane at exactly
// zero (touching) sets the sticky zero bit 0x40, a negative lane the sticky sign bit 0x80. w never
// takes part.
DC_TEST(math_collision_box_missed) {
    float held_max[4] = {10.0f, 10.0f, 10.0f, -100.0f};
    float held_min[4] = {0.0f, 0.0f, 0.0f, 100.0f};
    vu_hold_box(held_max, held_min);
    held_max[0] = -1000.0f;

    float inside_max[4] = {5.0f, 5.0f, 5.0f, -1.0f};
    float inside_min[4] = {1.0f, 1.0f, 1.0f, 1.0f};
    DC_CHECK(vu_box_missed(inside_max, inside_min) == 0);

    float overlap_max[4] = {20.0f, 20.0f, 20.0f, 0.0f};
    float overlap_min[4] = {9.0f, -5.0f, 9.5f, 0.0f};
    DC_CHECK(vu_box_missed(overlap_max, overlap_min) == 0);

    float touch_max[4] = {20.0f, 5.0f, 5.0f, 0.0f};
    float touch_min[4] = {10.0f, 1.0f, 1.0f, 0.0f};
    DC_CHECK(vu_box_missed(touch_max, touch_min) == 0x40);

    float touch_low_max[4] = {5.0f, 0.0f, 5.0f, 0.0f};
    float touch_low_min[4] = {1.0f, -3.0f, 1.0f, 0.0f};
    DC_CHECK(vu_box_missed(touch_low_max, touch_low_min) == 0x40);

    float beyond_max[4] = {5.0f, 5.0f, 30.0f, 0.0f};
    float beyond_min[4] = {1.0f, 1.0f, 11.0f, 0.0f};
    DC_CHECK(vu_box_missed(beyond_max, beyond_min) == 0x80);

    float below_max[4] = {-1.0f, 5.0f, 5.0f, 0.0f};
    float below_min[4] = {-4.0f, 1.0f, 1.0f, 0.0f};
    DC_CHECK(vu_box_missed(below_max, below_min) == 0x80);

    float both_max[4] = {0.0f, 5.0f, 50.0f, 0.0f};
    float both_min[4] = {-4.0f, 1.0f, 20.0f, 0.0f};
    DC_CHECK(vu_box_missed(both_max, both_min) == 0xC0);

    float held2_max[4] = {1.0f, 1.0f, 1.0f, 0.0f};
    float held2_min[4] = {-1.0f, -1.0f, -1.0f, 0.0f};
    vu_hold_box(held2_max, held2_min);
    DC_CHECK(vu_box_missed(inside_max, inside_min) == 0x40);
    DC_CHECK(vu_box_missed(held2_max, held2_min) == 0);
}

// The cell goes out through the held matrix on all four lanes, and the source advances by the
// held step on x and z only.
DC_TEST(math_water_trans_add_cell) {
    float matrix[4][4] = {
        {2.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 3.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 4.0f, 1.0f},
        {1.0f, 1.0f, 1.0f, 0.0f},
    };
    float step[4] = {0.5f, 99.0f, -2.0f, 99.0f};
    pretest(matrix, step);
    step[0] = 1000.0f;
    matrix[3][0] = 1000.0f;

    float position[4] = {1.0f, 2.0f, 3.0f, 1.0f};
    float out[4];
    Trans_AddCell(out, position);
    DC_CHECK(out[0] == 3.0f && out[1] == 7.0f && out[2] == 13.0f && out[3] == 3.0f);
    DC_CHECK(position[0] == 1.5f && position[1] == 2.0f && position[2] == 1.0f && position[3] == 1.0f);

    Trans_AddCell(out, position);
    DC_CHECK(out[0] == 4.0f && out[2] == 5.0f);
    DC_CHECK(position[0] == 2.0f && position[2] == -1.0f);
}
