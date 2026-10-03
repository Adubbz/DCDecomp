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

DC_TEST(tail_a_fish_line_joins_projected_points) {
    Draw3DFixture fixture;
    TwoPointLine();

    fixture.Frame([] { FishLineDraw(1); });
    DC_CHECK(LineAt(fixture, 170));
    DC_CHECK(LineAt(fixture, 320));
    DC_CHECK(LineAt(fixture, 470));
    DC_CHECK(!LineAt(fixture, 150));
    DC_CHECK(!LineAt(fixture, 490));
    DC_CHECK(fixture.PixelNear(320, 200, 0, 0, 0));
    DC_CHECK(MGPortCurrent().test.value == mgPixelTest.value);
}

// Drawing the underwater part: every point is above the water, so nothing is kicked.
DC_TEST(tail_a_fish_line_underwater_pass_skips_points_above) {
    Draw3DFixture fixture;
    TwoPointLine();

    fixture.Frame([] { FishLineDraw(0); });
    DC_CHECK(!LineAt(fixture, 320));
}
