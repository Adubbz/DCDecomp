#include <libpad.h>

#include "../platform/input.hpp"
#include "gamepad.hpp"
#include "test.hpp"

// CGamePad::Init waits on sceGsSyncV, which lives in the libgraph stub, so
// these tests do what Init does to the library themselves (scePadInit and
// both scePadPortOpen calls) and rely on GamePad's zero-initialised storage
// already holding what Init writes: phase QUERY, no key lock, no repeat.

namespace {

unsigned char g_dma_buffer[2][1024];

void OpenPads() {
    DC_CHECK(scePadInit(0) == 1);
    DC_CHECK(scePadPortOpen(0, 0, g_dma_buffer[0]) == 1);
    DC_CHECK(scePadPortOpen(1, 0, g_dma_buffer[1]) == 1);
}

void SetPad(int pad, std::uint16_t buttons, int lx = 128, int ly = 128, int rx = 128, int ry = 128) {
    InputPadState state;
    state.connected = true;
    state.buttons = buttons;
    state.left_x = static_cast<std::uint8_t>(lx);
    state.left_y = static_cast<std::uint8_t>(ly);
    state.right_x = static_cast<std::uint8_t>(rx);
    state.right_y = static_cast<std::uint8_t>(ry);
    InputSetOverride(pad, &state);
}

void Unplug(int pad) {
    InputPadState state;
    InputSetOverride(pad, &state);
}

} // namespace

DC_TEST(platform_pad_button_order_matches_game) {
    const int pairs[][2] = {
        {kInputL2,       PAD_L2      },
        {kInputR2,       PAD_R2      },
        {kInputL1,       PAD_L1      },
        {kInputR1,       PAD_R1      },
        {kInputTriangle, PAD_TRIANGLE},
        {kInputCircle,   PAD_CIRCLE  },
        {kInputCross,    PAD_CROSS   },
        {kInputSquare,   PAD_SQUARE  },
        {kInputSelect,   PAD_SELECT  },
        {kInputL3,       PAD_L3      },
        {kInputR3,       PAD_R3      },
        {kInputStart,    PAD_START   },
        {kInputUp,       PAD_UP      },
        {kInputRight,    PAD_RIGHT   },
        {kInputDown,     PAD_DOWN    },
        {kInputLeft,     PAD_LEFT    },
    };
    for (const auto &pair : pairs) {
        DC_CHECK(pair[0] == pair[1]);
    }
}

DC_TEST(platform_pad_read_fills_dualshock_layout) {
    OpenPads();
    SetPad(0, kInputCross | kInputUp | kInputL2, 255, 0, 10, 200);
    unsigned char data[32];
    DC_CHECK(scePadRead(0, 0, data) == 8);
    DC_CHECK(data[0] == 0);
    DC_CHECK(data[1] == 0x73);
    DC_CHECK((((data[2] << 8) | data[3]) ^ 0xFFFF) == (PAD_CROSS | PAD_UP | PAD_L2));
    DC_CHECK(data[4] == 10 && data[5] == 200 && data[6] == 255 && data[7] == 0);

    PAD_STATUS status{};
    DC_CHECK(pad_button_read(&status, 0, 0) == PAD_TERMINAL_DUALSHOCK);
    DC_CHECK(status.button == (PAD_CROSS | PAD_UP | PAD_L2));
    DC_CHECK(status.left_x == 255 && status.left_y == 0 && status.right_x == 10 && status.right_y == 200);
}

DC_TEST(platform_pad_setup_reaches_ready) {
    OpenPads();
    SetPad(0, PAD_START, 200);
    PAD_STATUS status{};
    read_pad(&status, 0, 0);
    DC_CHECK(status.phase == PAD_PHASE_ACTUATOR_CHECK);
    DC_CHECK(status.button == 0 && status.left_x == 128);
    read_pad(&status, 0, 0);
    DC_CHECK(status.phase == PAD_PHASE_ACTUATOR_WAIT);
    DC_CHECK(status.actuator[0] == 0 && status.actuator[1] == 1 && status.actuator[2] == 255);
    read_pad(&status, 0, 0);
    DC_CHECK(status.phase == PAD_PHASE_READY);
    read_pad(&status, 0, 0);
    DC_CHECK(status.phase == PAD_PHASE_READY);
    DC_CHECK(status.pad_mode == PAD_TERMINAL_DUALSHOCK);
    DC_CHECK(status.button == PAD_START);
    DC_CHECK(status.left_x == 200);

    Unplug(0);
    read_pad(&status, 0, 0);
    DC_CHECK(status.state == scePadStateDiscon);
    DC_CHECK(status.phase == PAD_PHASE_QUERY);
    DC_CHECK(status.button == 0 && status.left_x == 128 && status.right_y == 128);
}

DC_TEST(platform_pad_unopened_port_reads_nothing) {
    DC_CHECK(scePadInit(0) == 1);
    SetPad(1, PAD_CROSS);
    unsigned char data[32];
    DC_CHECK(scePadGetState(1, 0) == scePadStateDiscon);
    DC_CHECK(scePadRead(1, 0, data) == 0);
    DC_CHECK(scePadPortOpen(1, 0, g_dma_buffer[1]) == 1);
    DC_CHECK(scePadGetState(1, 0) == scePadStateStable);
    DC_CHECK(scePadInfoMode(1, 0, InfoModeCurID, 0) == PAD_TERMINAL_DUALSHOCK);
    DC_CHECK(scePadInfoMode(1, 0, InfoModeCurExID, 0) == 0);
    DC_CHECK(scePadInfoAct(1, 0, -1, 0) == 2);
}

DC_TEST(platform_pad_gamepad_updates_through_libpad) {
    OpenPads();
    SetPad(0, 0);
    Unplug(1);
    for (int i = 0; i < 3; ++i) {
        GamePad.UpDate();
    }
    GamePad.UpDate();
    DC_CHECK(GamePad.GetPadOn() == 0);

    SetPad(0, PAD_CROSS);
    GamePad.UpDate();
    DC_CHECK(GamePad.On(PAD_CROSS) == 1);
    DC_CHECK(GamePad.Down(PAD_CROSS) == 1);
    DC_CHECK(GamePad.Down(PAD_CIRCLE) == 0);
    GamePad.UpDate();
    DC_CHECK(GamePad.On(PAD_CROSS) == 1);
    DC_CHECK(GamePad.Down(PAD_CROSS) == 0);
    SetPad(0, 0);
    GamePad.UpDate();
    DC_CHECK(GamePad.On(PAD_CROSS) == 0);
    DC_CHECK(GamePad.GetPadUp() == PAD_CROSS);

    SetPad(0, PAD_UP | PAD_DOWN);
    GamePad.UpDate();
    DC_CHECK(GamePad.GetPadOn() == 0);

    DC_CHECK(GamePad.On2(PAD_CROSS) == 0);
    DC_CHECK(GamePad.GetLX2() == 0);
}

DC_TEST(platform_pad_axes_go_through_calibration) {
    OpenPads();
    Unplug(1);
    SetPad(0, 0);
    for (int i = 0; i < 4; ++i) {
        GamePad.UpDate();
    }

    SetPad(0, 0, 255, 0, 128 + 49, 128 - 50);
    GamePad.UpDate();
    DC_CHECK(GamePad.GetLX() == 128);
    DC_CHECK(GamePad.GetLXf() == 1.0f);
    DC_CHECK(GamePad.GetLY() == -128);
    DC_CHECK(GamePad.GetLYf() == -1.0f);
    DC_CHECK(GamePad.GetRX() == 0);
    DC_CHECK(GamePad.GetRY() == AxisCalibration(78));
    DC_CHECK(GamePad.GetRY() == 0);

    SetPad(0, 0, 128 + 50, 128, 128, 128 - 51);
    GamePad.UpDate();
    DC_CHECK(GamePad.GetLX() == 1);
    DC_CHECK(GamePad.GetRY() == -1);
    DC_CHECK_NEAR(GamePad.GetLXf(), 1.0f / 128.0f, 1e-6f);

    SetPad(0, 0);
    GamePad.UpDate();
    DC_CHECK(GamePad.GetLX() == 0 && GamePad.GetLY() == 0 && GamePad.GetRX() == 0 && GamePad.GetRY() == 0);
}

DC_TEST(platform_pad_vibration_drives_rumble) {
    OpenPads();
    GamePad.VibrationEnable(1);
    GamePad.SetVibration(0, 5, 2);
    GamePad.SetVibration(1, 200, 2);
    GamePad.Step();
    InputRumble rumble = InputGetRumble(0);
    DC_CHECK(rumble.small_motor);
    DC_CHECK(rumble.large_motor == 200);
    GamePad.Step();
    GamePad.Step();
    rumble = InputGetRumble(0);
    DC_CHECK(!rumble.small_motor);
    DC_CHECK(rumble.large_motor == 0);
}

DC_TEST(platform_input_bindings) {
    std::string_view keys[] = {"Space", "Z"};
    DC_CHECK(InputBindKeys("cross", keys));
    std::string_view unknown[] = {"NoSuchKey"};
    DC_CHECK(!InputBindKeys("cross", unknown));
    DC_CHECK(!InputBindKeys("jump", keys));
    InputResetBindings();
    InputPoll();
    DC_CHECK(InputGetPad(0).connected);
    DC_CHECK(InputGetPad(0).buttons == 0);
    DC_CHECK(InputGetPad(0).left_x == 128);
    DC_CHECK(!InputGetPad(1).connected);
}

DC_TEST(platform_input_without_video) {
    InputInit();
    InputPoll();
    DC_CHECK(InputGetPad(0).connected);
    DC_CHECK(InputGetPad(0).buttons == 0);
    InputSetRumble(0, {true, 255});
    InputShutdown();
}
