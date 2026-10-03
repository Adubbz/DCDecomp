#include <string>

#include "../platform/input_script.hpp"
#include "test.hpp"

DC_TEST(platform_input_script_holds_buttons_until_the_next_line) {
    InputScript script;
    std::string error;
    DC_CHECK(InputScriptParse("# boot\n0\n70 cross start   # both\n75\n\n90 Up 0 255 128 128\n", script, error));
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
