#include <gtest/gtest.h>

#include <cstring>

#include "debugfont.hpp"
#include "dun/gameloop.hpp"
#include "fader.hpp"
#include "langset.hpp"
#include "mainselect.hpp"
#include "rect.hpp"
#include "shot_freefuncs.hpp"
#include "tail_a_fixture.hpp"

extern CDebugFont CDbgMsg;

using namespace dc::test;

namespace {

// 16 texels wide, four 16-row bands: red, green, blue, white.
texfix::Bytes CursorTim2() {
    const uint32_t bands[4] = {texfix::Gs(255, 0, 0), texfix::Gs(0, 255, 0), texfix::Gs(0, 0, 255),
                               texfix::Gs(255, 255, 255)};
    texfix::Bytes  texels;
    for (int y = 0; y < 64; y++) {
        for (int x = 0; x < 16; x++) {
            for (int shift = 0; shift < 32; shift += 8) {
                texels.push_back(static_cast<uint8_t>(bands[y / 16] >> shift));
            }
        }
    }
    return texfix::Tim2({TIM2_RGB32, 16, 64, {texels}, {}, 0});
}

texfix::Bytes IndexTim2(uint8_t index) {
    return texfix::Tim2({TIM2_IDTEX8, 64, 64, {texfix::Bytes(64 * 64, index)}, texfix::Clut256({}), 256});
}

} // namespace

// The lock-on cursor's four corners land where retail puts them: MGRotTransPers3DSprite's 12.4
// field corners, less the window offset, in logical pixels. A 10x10 cursor at depth 100 spans
// logical (279, 159) to (359, 319); each corner takes its band of d01e04.
TEST(TailADungeon, TargetCursorCorners) {
    TailAFixture fixture;
    fixture.Images(texfix::Img({
        {"d01e04", CursorTim2()}
    }));
    float world[4] = {0.0f, 0.0f, 100.0f, 1.0f};

    fixture.Frame([&] { DrawtargetCursor(world, 10.0f, 10.0f, 8.0f); });
    ASSERT_TRUE(fixture.PixelNear(287, 167, 0, 0, 255));
    ASSERT_TRUE(fixture.PixelNear(367, 167, 255, 0, 0));
    ASSERT_TRUE(fixture.PixelNear(287, 327, 255, 255, 255));
    ASSERT_TRUE(fixture.PixelNear(367, 327, 0, 255, 0));
    ASSERT_TRUE(fixture.PixelNear(320, 240, 0, 0, 0));
}

// MainDraw's two frame grabs: the field into "water" before the water draws, the whole frame into
// "frame_image" at the end for the menus.
TEST(TailADungeon, MainDrawFrameGrabs) {
    TailAFixture fixture;
    fixture.Placeholders({"#water#640#256#4", "#frame_image#640#480#4"});

    fixture.Frame([&] {
        MGFillBox(CRect_i_(0, 0, 640 * 16, 60 * 16), 200, 0, 0, 0x80);
        MGFillBox(CRect_i_(0, 60 * 16, 640 * 16, 180 * 16), 0, 0, 200, 0x80);
        sceGsTex0 frame_tex;
        MGGetFBuffTex(&frame_tex);
        sceGsTex0 water_tex = *(sceGsTex0 *) &TailAFixture::Named("water")->tex0;
        MGMoveImage(&frame_tex, CRect_i_(0, 0, 0x280, SCREEN_HALF_HEIGHT), &water_tex, 0, 0, 0);
        MGMoveFrameBuffImage((sceGsTex0 *) &TailAFixture::Named("frame_image")->tex0, 0, 0, 0);
    });

    TailAFixture::Pixels water = TailAFixture::Read(TailAFixture::Handle("water"));
    ASSERT_TRUE(water.Near(10, 50, 200, 0, 0));
    ASSERT_TRUE(water.Near(10, 70, 0, 0, 200));
    TailAFixture::Pixels image = TailAFixture::Read(TailAFixture::Handle("frame_image"));
    ASSERT_TRUE(image.Near(10, 110, 200, 0, 0));
    ASSERT_TRUE(image.Near(10, 130, 0, 0, 200));
}

// The reserved-slot copy moves 32x32 index texels from the page to the item.
TEST(TailADungeon, ItemToReservedCopiesIndices) {
    TailAFixture fixture;
    fixture.Images(texfix::Img({
        {"page", IndexTim2(7)},
        {"item", IndexTim2(3)}
    }));
    char page[] = "page";
    char item[] = "item";

    fixture.Frame([&] { setItemToReserved(page, 0, 0, item, 16, 8); });
    TailAFixture::Pixels pixels;
    ASSERT_TRUE(gfx::ReadbackTexture(TailAFixture::Handle("item"), pixels.rgba, pixels.width, pixels.height));
    ASSERT_TRUE(pixels.width == 64);
    ASSERT_TRUE(pixels.rgba[8 * 64 + 16] == 7);
    ASSERT_TRUE(pixels.rgba[39 * 64 + 47] == 7);
    ASSERT_TRUE(pixels.rgba[7 * 64 + 16] == 3);
    ASSERT_TRUE(pixels.rgba[8 * 64 + 48] == 3);
}

// The language screen runs headless: fades in, and picks the language on the way out.
TEST(TailADungeon, LangsetLoopSteps) {
    TailAFixture fixture;
    Proc = LANGSET_FADE_IN;
    Fade.value = 0;
    int result = -1;
    fixture.Frame([&] { result = LangsetLoop(); });
    ASSERT_TRUE(result == 0);
    ASSERT_TRUE(Fade.value > 0);

    Proc = LANGSET_FADE_OUT;
    Fade.value = 0;
    Cursor = 1;
    fixture.Frame([&] { result = LangsetLoop(); });
    ASSERT_TRUE(result == 1);
    ASSERT_TRUE(LanguageCode == 3);
}

TEST(TailADungeon, LoaderLoopListsMaps) {
    TailAFixture fixture;
    CDbgMsg.length = 0;
    CDbgMsg.text[0] = 0;
    char name[] = "dbgwork";
    CDbgMsg.texture_name = name;
    int result = -1;
    fixture.Frame([&] { result = LoaderLoop(); });
    ASSERT_TRUE(result == 0);
    ASSERT_TRUE(std::strncmp(CDbgMsg.text, "- MapInfomationFile Loader -\n", 29) == 0);
    ASSERT_TRUE(std::strstr(CDbgMsg.text, ">>[ 1]") != nullptr);
}
