#include <string>

#include "../platform/input_script.hpp"
#include "test.hpp"

DC_TEST(platform_input_script_holds_buttons_until_the_next_line) {
    InputScript script;
    std::string error;
    const char *text = "# boot\n0\n70 cross start   # both\n75\n\n90 Up 0 255 128 128\n";
    DC_CHECK(InputScriptParse(text, script, error));
    DC_CHECK(script.steps.size() == 4);

    InputPadState before = InputScriptStateAt(script, 0, 69);
    DC_CHECK(before.connected && before.buttons == 0 && before.left_x == kInputAxisCentre);
    DC_CHECK(InputScriptStateAt(script, 0, 70).buttons == (kInputCross | kInputStart));
    DC_CHECK(InputScriptStateAt(script, 0, 74).buttons == (kInputCross | kInputStart));
    DC_CHECK(InputScriptStateAt(script, 0, 75).buttons == 0);

    InputPadState stick = InputScriptStateAt(script, 0, 1000);
    DC_CHECK(stick.buttons == kInputUp && stick.left_x == 0 && stick.left_y == 255 && stick.right_x == 128);
    DC_CHECK(InputScriptDrivesPad(script, 0) && !InputScriptDrivesPad(script, 1));
}

DC_TEST(platform_input_script_drives_pad_two_on_its_own_timeline) {
    InputScript script;
    std::string error;
    DC_CHECK(InputScriptParse("0 pad2 l1 r1 l2 r2\n1 pad2\n10 down\n12\n", script, error));
    DC_CHECK(InputScriptDrivesPad(script, 1));
    DC_CHECK(InputScriptStateAt(script, 1, 0).buttons == (kInputL1 | kInputR1 | kInputL2 | kInputR2));
    DC_CHECK(InputScriptStateAt(script, 1, 11).buttons == 0);
    DC_CHECK(InputScriptStateAt(script, 0, 0).buttons == 0);
    DC_CHECK(InputScriptStateAt(script, 0, 10).buttons == kInputDown);

    InputScriptInstall(script);
    InputScriptApply(10);
    DC_CHECK(InputGetPad(0).buttons == kInputDown);
    InputScriptApply(0);
    DC_CHECK(InputGetPad(1).buttons == (kInputL1 | kInputR1 | kInputL2 | kInputR2));
    InputScriptInstall({});
    DC_CHECK(!InputScriptActive());
}

DC_TEST(platform_input_script_rejects_bad_lines) {
    InputScript script;
    std::string error;
    DC_CHECK(!InputScriptParse("10 jump\n", script, error));
    DC_CHECK(error == "line 1: unknown button \"jump\"");
    DC_CHECK(!InputScriptParse("10 cross\n5 circle\n", script, error));
    DC_CHECK(error == "line 2: frames must not decrease");
    DC_CHECK(!InputScriptParse("10 cross 1 2\n", script, error));
    DC_CHECK(!InputScriptParse("10 0 0 0 300\n", script, error));
    DC_CHECK(!InputScriptParse("-1 cross\n", script, error));
    DC_CHECK(InputScriptParse("10 cross\n5 pad2 circle\n", script, error));
}

DC_TEST(platform_input_script_takes_keys_and_the_mouse) {
    InputResetBindings();
    InputScript script;
    std::string error;
    const char *text = "0 key:w key:D mouse1 mouse:5,-5\n10 key:Return key:left_shift\n12 mouse2 cross\n";
    DC_CHECK(InputScriptParse(text, script, error));
    InputPadState walk = InputScriptStateAt(script, 0, 0);
    DC_CHECK(walk.buttons == kInputCross);
    DC_CHECK(walk.stick_dpad == (kInputUp | kInputRight));
    DC_CHECK(walk.left_x > 128 + 49 && walk.left_y < 128 - 50 && walk.left_x != 255);
    DC_CHECK(walk.right_x > 128 + 49 && walk.right_y > 128 + 49);
    InputPadState start = InputScriptStateAt(script, 0, 10);
    DC_CHECK(start.buttons == kInputStart && start.left_x == 128 && start.right_x == 128);
    DC_CHECK(InputScriptStateAt(script, 0, 12).buttons == (kInputR1 | kInputCross));

    DC_CHECK(!InputScriptParse("0 pad2 key:w\n", script, error));
    DC_CHECK(error == "line 1: keys and the mouse drive pad 1 only");
    DC_CHECK(!InputScriptParse("0 key:nosuchkey\n", script, error));
    DC_CHECK(error == "line 1: unknown key \"nosuchkey\"");
    DC_CHECK(!InputScriptParse("0 mouse:5\n", script, error));
    DC_CHECK(!InputScriptParse("0 mouse9\n", script, error));
}
