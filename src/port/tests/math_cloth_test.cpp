#include <libvu0.h>

#include <cmath>

#include "cloth.hpp"
#include "frame.hpp"
#include "mathutil.hpp"
#include "test.hpp"

namespace {

// No frame, bound or wind, no gravity, no floor: only the springs and the speeds act.
CCloth &FreeCloth(int rows, int columns) {
    static CCloth cloth(16, 16, 1.0f);
    cloth.InitParam();
    cloth.num_i = rows;
    cloth.num_j = columns;
    cloth.gravity[1] = 0.0f;
    cloth.floor_on = 0;
    return cloth;
}

void Place(CCloth &cloth, int i, int j, float x, float y, float z) {
    sceVu0FVECTOR p = {x, y, z, 1.0f};
    sceVu0CopyVector(cloth.home[i][j], p);
    sceVu0CopyVector(cloth.point[i][j], p);
    sceVu0CopyVector(cloth.last[i][j], p);
}

float Distance(float *a, float *b) {
    return DistVector(a, b);
}

} // namespace

// A 3x3 sheet at its rest lengths (1 along a row, 2 between rows two apart) does not move, and
// every rest length is kept exactly.
DC_TEST(math_cloth_rest_is_kept) {
    CCloth &cloth = FreeCloth(3, 3);
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            Place(cloth, i, j, (float) i, -(float) j, 0.0f);
            cloth.rest[i][j][0] = 1.0f;
            cloth.rest[i][j][1] = 1.0f;
        }
    }

    cloth.Step(1);

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            DC_CHECK(cloth.point[i][j][0] == (float) i);
            DC_CHECK(cloth.point[i][j][1] == -(float) j);
            DC_CHECK(cloth.point[i][j][2] == 0.0f);
            DC_CHECK(cloth.speed[i][j][0] == 0.0f && cloth.speed[i][j][1] == 0.0f && cloth.speed[i][j][2] == 0.0f);
            if (j + 1 < 3) {
                DC_CHECK(Distance(cloth.point[i][j], cloth.point[i][j + 1]) == 1.0f);
            }
            if (i >= 2) {
                DC_CHECK(Distance(cloth.point[i][j], cloth.point[i - 2][j]) == 2.0f);
            }
        }
    }
}

// One row of two: the first vertex is pinned to its home each pass, the second hangs 2 below with
// a rest length of 1. stretch_params[0] is (1, 0.3, 0.7), so each of the four passes moves the
// free end by 0.7 of the slack (|d| - 1): -2 -> -1.3 -> -1.09 -> -1.027 -> -1.0081. The speed
// picks up the step's displacement (0.9919 upwards); damping stays at 1 with a zero normal.
DC_TEST(math_cloth_spring_converges) {
    CCloth &cloth = FreeCloth(1, 2);
    Place(cloth, 0, 0, 0.0f, 0.0f, 0.0f);
    Place(cloth, 0, 1, 0.0f, -2.0f, 0.0f);
    cloth.rest[0][0][1] = 1.0f;

    cloth.Step(1);

    DC_CHECK(cloth.point[0][0][0] == 0.0f && cloth.point[0][0][1] == 0.0f && cloth.point[0][0][2] == 0.0f);
    DC_CHECK_NEAR(cloth.point[0][1][1], -1.0081f, 1e-5f);
    DC_CHECK(cloth.point[0][1][0] == 0.0f && cloth.point[0][1][2] == 0.0f);
    DC_CHECK_NEAR(cloth.speed[0][1][1], 0.9919f, 1e-5f);
    DC_CHECK(cloth.speed[0][0][1] == 0.0f);
    DC_CHECK(cloth.rest[0][1][3] == -1.0f);
    DC_CHECK(cloth.last[0][1][1] == cloth.point[0][1][1]);

    // The next step carries the speed into the vertex before the springs pull it back.
    cloth.Step(1);
    DC_CHECK(std::isfinite(cloth.point[0][1][1]));
    DC_CHECK_NEAR(Distance(cloth.point[0][0], cloth.point[0][1]), 1.0f, 0.05f);
}

// With a frame, each vertex springs towards its home carried by the frame:
// force = delta + (world_home - vertex) * stiffness, vertex += speed + force, speed = -force, and
// both w lanes become 1. A frame at the origin with an identity matrix has delta 0. The first
// column is pinned to world_home after every spring pass.
DC_TEST(math_cloth_follow_frame) {
    static CFrame frame;
    sceVu0UnitMatrix(frame.local);
    frame.world_valid = 0;

    CCloth &cloth = FreeCloth(1, 2);
    cloth.frame = &frame;
    Place(cloth, 0, 0, 3.0f, 0.0f, 0.0f);
    Place(cloth, 0, 1, 0.0f, 0.0f, 0.0f);
    cloth.home[0][1][1] = -4.0f;
    cloth.point[0][1][3] = 0.0f;
    cloth.speed[0][1][0] = 0.5f;
    cloth.speed[0][1][3] = 0.0f;
    cloth.position[3] = 1.0f;
    // The free vertex ends (0.5, -0.4, 0) from the follow step and the pinned one (3, 0, 0); a rest
    // length equal to that distance leaves the spring passes with nothing to correct.
    cloth.rest[0][0][1] = std::sqrt(2.5f * 2.5f + 0.4f * 0.4f);

    cloth.Step(1);

    // force = (0, -4, 0) * 0.1 = (0, -0.4, 0); vertex = (0, 0, 0) + (0.5, 0, 0) + force. The stored
    // speed is -force + (work - last) = (0, 0.4, 0) + (0.5, -0.4, 0), damped by at most 1.
    DC_CHECK(cloth.point[0][0][0] == 3.0f && cloth.point[0][0][1] == 0.0f);
    DC_CHECK_NEAR(cloth.point[0][1][0], 0.5f, 1e-5f);
    DC_CHECK_NEAR(cloth.point[0][1][1], -0.4f, 1e-5f);
    DC_CHECK(cloth.point[0][1][3] == 1.0f);
    DC_CHECK(cloth.world_home[0][1][1] == -4.0f && cloth.world_home[0][1][3] == 1.0f);
    DC_CHECK(cloth.speed[0][1][3] == 1.0f);
    DC_CHECK_NEAR(cloth.speed[0][1][0], 0.5f, 1e-5f);
    DC_CHECK_NEAR(cloth.speed[0][1][1], 0.0f, 1e-5f);
}
