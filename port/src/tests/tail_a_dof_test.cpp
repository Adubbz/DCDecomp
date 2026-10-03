#include <gtest/gtest.h>

#include "effectmacro.hpp"
#include "tail_a_fixture.hpp"

using namespace dc::test;

namespace {

// Stripes red and blue over the frame, the bottom half nearer than either focus plane.
void StripedScene() {
    Stripes(0.0f, 0.0f, 640.0f, 480.0f, Rgba(200, 0, 0), Rgba(0, 0, 200));
    uint8_t          unused[4] = {};
    gfx::LogicalRect near = {0.0f, 240.0f, 640.0f, 240.0f};
    gfx::Clear(false, unused, true, 1.0f, &near);
}

} // namespace

// Behind the focus planes the bands lay the shrunk copy over the frame, which averages each red
// and blue pair; in front of them the depth test keeps the frame as it was.
TEST(TailADof, DepthOfFieldBlursBeyondFocus) {
    TailAFixture fixture;
    fixture.Placeholders({"#frame_image#640#480#4"});
    float focus[4] = {200.0f, 500.0f, 0.0f, 0.0f};

    fixture.Frame([&] {
        StripedScene();
        DepthOfField(focus, 3, 0x80, 0);
    });
    for (uint32_t x : {100u, 101u, 320u, 321u}) {
        ASSERT_TRUE(fixture.PixelNear(x, 60, 100, 0, 100, 12));
        ASSERT_TRUE(fixture.PixelNear(x, 200, 100, 0, 100, 12));
    }
    ASSERT_TRUE(fixture.PixelNear(100, 300, 200, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(101, 300, 0, 0, 200));
    ASSERT_TRUE(fixture.PixelNear(320, 470, 200, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(321, 470, 0, 0, 200));
    ASSERT_TRUE(MGPortCurrent().test.value == mgPixelTest.value);
    ASSERT_TRUE(MGPortCurrent().zbuf.ZMSK == mgZBuffer.ZMSK);
}

// Level 1 draws only the half-width pass, at the caller's alpha: half the blurred copy over half
// the frame.
TEST(TailADof, DepthOfFieldFirstPassAlpha) {
    TailAFixture fixture;
    fixture.Placeholders({"#frame_image#640#480#4"});
    float focus[4] = {200.0f, 500.0f, 0.0f, 0.0f};

    fixture.Frame([&] {
        StripedScene();
        DepthOfField(focus, 1, 0x40, 0);
    });
    ASSERT_TRUE(fixture.PixelNear(100, 100, 150, 0, 50, 12));
    ASSERT_TRUE(fixture.PixelNear(101, 100, 50, 0, 150, 12));
    ASSERT_TRUE(fixture.PixelNear(100, 300, 200, 0, 0));
}

// A focus plane beyond everything drawn leaves the whole frame sharp.
TEST(TailADof, DepthOfFieldFarFocusLeavesFrame) {
    TailAFixture fixture;
    fixture.Placeholders({"#frame_image#640#480#4"});
    float focus[4] = {200.0f, 500.0f, 0.0f, 0.0f};

    fixture.Frame([&] {
        Stripes(0.0f, 0.0f, 640.0f, 480.0f, Rgba(200, 0, 0), Rgba(0, 0, 200));
        uint8_t unused[4] = {};
        gfx::Clear(false, unused, true, 1.0f);
        DepthOfField(focus, 3, 0x80, 4);
    });
    ASSERT_TRUE(fixture.PixelNear(100, 100, 200, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(101, 100, 0, 0, 200));
}
