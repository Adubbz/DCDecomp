#include <gtest/gtest.h>

#include <string>

#include "../platform/input_script.hpp"

TEST(PlatformInputScript, HoldsButtonsUntilTheNextLine) {
    InputScript script;
    std::string error;
    const char *text = "# boot\n0\n70 cross start   # both\n75\n\n90 Up 0 255 128 128\n";
    ASSERT_TRUE(InputScriptParse(text, script, error));
    ASSERT_TRUE(script.steps.size() == 4);

    InputPadState before = InputScriptStateAt(script, 0, 69);
    ASSERT_TRUE(before.connected && before.buttons == 0 && before.left_x == kInputAxisCentre);
    ASSERT_TRUE(InputScriptStateAt(script, 0, 70).buttons == (kInputCross | kInputStart));
    ASSERT_TRUE(InputScriptStateAt(script, 0, 74).buttons == (kInputCross | kInputStart));
    ASSERT_TRUE(InputScriptStateAt(script, 0, 75).buttons == 0);

    InputPadState stick = InputScriptStateAt(script, 0, 1000);
    ASSERT_TRUE(stick.buttons == kInputUp && stick.left_x == 0 && stick.left_y == 255 && stick.right_x == 128);
    ASSERT_TRUE(InputScriptDrivesPad(script, 0) && !InputScriptDrivesPad(script, 1));
}

TEST(PlatformInputScript, DrivesPadTwoOnItsOwnTimeline) {
    InputScript script;
    std::string error;
    ASSERT_TRUE(InputScriptParse("0 pad2 l1 r1 l2 r2\n1 pad2\n10 down\n12\n", script, error));
    ASSERT_TRUE(InputScriptDrivesPad(script, 1));
    ASSERT_TRUE(InputScriptStateAt(script, 1, 0).buttons == (kInputL1 | kInputR1 | kInputL2 | kInputR2));
    ASSERT_TRUE(InputScriptStateAt(script, 1, 11).buttons == 0);
    ASSERT_TRUE(InputScriptStateAt(script, 0, 0).buttons == 0);
    ASSERT_TRUE(InputScriptStateAt(script, 0, 10).buttons == kInputDown);

    InputScriptInstall(script);
    InputScriptApply(10);
    ASSERT_TRUE(InputGetPad(0).buttons == kInputDown);
    InputScriptApply(0);
    ASSERT_TRUE(InputGetPad(1).buttons == (kInputL1 | kInputR1 | kInputL2 | kInputR2));
    InputScriptInstall({});
    ASSERT_TRUE(!InputScriptActive());
}

TEST(PlatformInputScript, RejectsBadLines) {
    InputScript script;
    std::string error;
    ASSERT_TRUE(!InputScriptParse("10 jump\n", script, error));
    ASSERT_TRUE(error == "line 1: unknown button \"jump\"");
    ASSERT_TRUE(!InputScriptParse("10 cross\n5 circle\n", script, error));
    ASSERT_TRUE(error == "line 2: frames must not decrease");
    ASSERT_TRUE(!InputScriptParse("10 cross 1 2\n", script, error));
    ASSERT_TRUE(!InputScriptParse("10 0 0 0 300\n", script, error));
    ASSERT_TRUE(!InputScriptParse("-1 cross\n", script, error));
    ASSERT_TRUE(InputScriptParse("10 cross\n5 pad2 circle\n", script, error));
}

TEST(PlatformInputScript, TakesKeysAndTheMouse) {
    InputResetBindings();
    InputScript script;
    std::string error;
    const char *text = "0 key:w key:D mouse1 mouse:5,-5\n10 key:Return key:left_shift\n12 mouse2 cross\n";
    ASSERT_TRUE(InputScriptParse(text, script, error));
    InputPadState walk = InputScriptStateAt(script, 0, 0);
    ASSERT_TRUE(walk.buttons == kInputCross);
    ASSERT_TRUE(walk.stick_dpad == (kInputUp | kInputRight));
    ASSERT_TRUE(walk.left_x > 128 + 49 && walk.left_y < 128 - 50 && walk.left_x != 255);
    ASSERT_TRUE(walk.right_x > 128 + 49 && walk.right_y > 128 + 49);
    InputPadState start = InputScriptStateAt(script, 0, 10);
    ASSERT_TRUE(start.buttons == kInputStart && start.left_x == 128 && start.right_x == 128);
    ASSERT_TRUE(InputScriptStateAt(script, 0, 12).buttons == (kInputR1 | kInputCross));

    ASSERT_TRUE(!InputScriptParse("0 pad2 key:w\n", script, error));
    ASSERT_TRUE(error == "line 1: keys and the mouse drive pad 1 only");
    ASSERT_TRUE(!InputScriptParse("0 key:nosuchkey\n", script, error));
    ASSERT_TRUE(error == "line 1: unknown key \"nosuchkey\"");
    ASSERT_TRUE(!InputScriptParse("0 mouse:5\n", script, error));
    ASSERT_TRUE(!InputScriptParse("0 mouse9\n", script, error));
}
