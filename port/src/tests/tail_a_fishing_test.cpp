#include <gtest/gtest.h>

#include "fishing.hpp"
#include "tail_a_fixture.hpp"

using namespace dc::test;

namespace {

// Two points 20 either side of the axis at depth 100 (logical x 160 and 480 on row 240); the rest
// of the line behind the eye, so no other segment is kicked.
void TwoPointLine() {
    for (int i = 0; i < 24; i++) {
        point[i][0] = 0.0f;
        point[i][1] = 0.0f;
        point[i][2] = -10.0f;
        point[i][3] = 1.0f;
    }
    point[0][0] = -20.0f;
    point[0][2] = 100.0f;
    point[1][0] = 20.0f;
    point[1][2] = 100.0f;
    WaterLevel = -1000.0f;
    draw_under_water = 1;
    UkiFrame = nullptr;
    HookFrame = nullptr;
    EsaFrame = nullptr;
}

bool LineAt(const Draw3DFixture &fixture, uint32_t x) {
    for (uint32_t y = 238; y <= 242; y++) {
        std::array<uint8_t, 4> p = fixture.Pixel(x, y);
        if (std::abs(p[0] - 0x80) <= 2 && std::abs(p[1] - 0x80) <= 2 && std::abs(p[2] - 0x80) <= 2) {
            return true;
        }
    }
    return false;
}

} // namespace

TEST(TailAFishing, FishLineJoinsProjectedPoints) {
    Draw3DFixture fixture;
    TwoPointLine();

    fixture.Frame([] { FishLineDraw(1); });
    ASSERT_TRUE(LineAt(fixture, 170));
    ASSERT_TRUE(LineAt(fixture, 320));
    ASSERT_TRUE(LineAt(fixture, 470));
    ASSERT_TRUE(!LineAt(fixture, 150));
    ASSERT_TRUE(!LineAt(fixture, 490));
    ASSERT_TRUE(fixture.PixelNear(320, 200, 0, 0, 0));
    ASSERT_TRUE(MGPortCurrent().test.value == mgPixelTest.value);
}

// Drawing the underwater part: every point is above the water, so nothing is kicked.
TEST(TailAFishing, FishLineUnderwaterPassSkipsPointsAbove) {
    Draw3DFixture fixture;
    TwoPointLine();

    fixture.Frame([] { FishLineDraw(0); });
    ASSERT_TRUE(!LineAt(fixture, 320));
}
