#include <gtest/gtest.h>
#include <libpad.h>

#include "../platform/input.hpp"
#include "gamepad.hpp"

// CGamePad::Init waits on sceGsSyncV, which lives in the libgraph stub, so
// these tests do what Init does to the library themselves (scePadInit and
// both scePadPortOpen calls) and rely on GamePad's zero-initialised storage
// already holding what Init writes: phase QUERY, no key lock, no repeat.

namespace {

unsigned char g_dma_buffer[2][1024];

void OpenPads() {
    ASSERT_TRUE(scePadInit(0) == 1);
    ASSERT_TRUE(scePadPortOpen(0, 0, g_dma_buffer[0]) == 1);
    ASSERT_TRUE(scePadPortOpen(1, 0, g_dma_buffer[1]) == 1);
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

TEST(PlatformPad, ButtonOrderMatchesGame) {
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
        ASSERT_TRUE(pair[0] == pair[1]);
    }
}

TEST(PlatformPad, ReadFillsDualshockLayout) {
    OpenPads();
    SetPad(0, kInputCross | kInputUp | kInputL2, 255, 0, 10, 200);
    unsigned char data[32];
    ASSERT_TRUE(scePadRead(0, 0, data) == 8);
    ASSERT_TRUE(data[0] == 0);
    ASSERT_TRUE(data[1] == 0x73);
    ASSERT_TRUE((((data[2] << 8) | data[3]) ^ 0xFFFF) == (PAD_CROSS | PAD_UP | PAD_L2));
    ASSERT_TRUE(data[4] == 10 && data[5] == 200 && data[6] == 255 && data[7] == 0);

    PAD_STATUS status{};
    ASSERT_TRUE(pad_button_read(&status, 0, 0) == PAD_TERMINAL_DUALSHOCK);
    ASSERT_TRUE(status.button == (PAD_CROSS | PAD_UP | PAD_L2));
    ASSERT_TRUE(status.left_x == 255 && status.left_y == 0 && status.right_x == 10 && status.right_y == 200);
}

TEST(PlatformPad, SetupReachesReady) {
    OpenPads();
    SetPad(0, PAD_START, 200);
    PAD_STATUS status{};
    read_pad(&status, 0, 0);
    ASSERT_TRUE(status.phase == PAD_PHASE_ACTUATOR_CHECK);
    ASSERT_TRUE(status.button == 0 && status.left_x == 128);
    read_pad(&status, 0, 0);
    ASSERT_TRUE(status.phase == PAD_PHASE_ACTUATOR_WAIT);
    ASSERT_TRUE(status.actuator[0] == 0 && status.actuator[1] == 1 && status.actuator[2] == 255);
    read_pad(&status, 0, 0);
    ASSERT_TRUE(status.phase == PAD_PHASE_READY);
    read_pad(&status, 0, 0);
    ASSERT_TRUE(status.phase == PAD_PHASE_READY);
    ASSERT_TRUE(status.pad_mode == PAD_TERMINAL_DUALSHOCK);
    ASSERT_TRUE(status.button == PAD_START);
    ASSERT_TRUE(status.left_x == 200);

    Unplug(0);
    read_pad(&status, 0, 0);
    ASSERT_TRUE(status.state == scePadStateDiscon);
    ASSERT_TRUE(status.phase == PAD_PHASE_QUERY);
    ASSERT_TRUE(status.button == 0 && status.left_x == 128 && status.right_y == 128);
}

TEST(PlatformPad, UnopenedPortReadsNothing) {
    ASSERT_TRUE(scePadInit(0) == 1);
    SetPad(1, PAD_CROSS);
    unsigned char data[32];
    ASSERT_TRUE(scePadGetState(1, 0) == scePadStateDiscon);
    ASSERT_TRUE(scePadRead(1, 0, data) == 0);
    ASSERT_TRUE(scePadPortOpen(1, 0, g_dma_buffer[1]) == 1);
    ASSERT_TRUE(scePadGetState(1, 0) == scePadStateStable);
    ASSERT_TRUE(scePadInfoMode(1, 0, InfoModeCurID, 0) == PAD_TERMINAL_DUALSHOCK);
    ASSERT_TRUE(scePadInfoMode(1, 0, InfoModeCurExID, 0) == 0);
    ASSERT_TRUE(scePadInfoAct(1, 0, -1, 0) == 2);
}

TEST(PlatformPad, GamepadUpdatesThroughLibpad) {
    OpenPads();
    SetPad(0, 0);
    Unplug(1);
    for (int i = 0; i < 3; ++i) {
        GamePad.UpDate();
    }
    GamePad.UpDate();
    ASSERT_TRUE(GamePad.GetPadOn() == 0);

    SetPad(0, PAD_CROSS);
    GamePad.UpDate();
    ASSERT_TRUE(GamePad.On(PAD_CROSS) == 1);
    ASSERT_TRUE(GamePad.Down(PAD_CROSS) == 1);
    ASSERT_TRUE(GamePad.Down(PAD_CIRCLE) == 0);
    GamePad.UpDate();
    ASSERT_TRUE(GamePad.On(PAD_CROSS) == 1);
    ASSERT_TRUE(GamePad.Down(PAD_CROSS) == 0);
    SetPad(0, 0);
    GamePad.UpDate();
    ASSERT_TRUE(GamePad.On(PAD_CROSS) == 0);
    ASSERT_TRUE(GamePad.GetPadUp() == PAD_CROSS);

    SetPad(0, PAD_UP | PAD_DOWN);
    GamePad.UpDate();
    ASSERT_TRUE(GamePad.GetPadOn() == 0);

    ASSERT_TRUE(GamePad.On2(PAD_CROSS) == 0);
    ASSERT_TRUE(GamePad.GetLX2() == 0);
}

TEST(PlatformPad, AxesGoThroughCalibration) {
    OpenPads();
    Unplug(1);
    SetPad(0, 0);
    for (int i = 0; i < 4; ++i) {
        GamePad.UpDate();
    }

    SetPad(0, 0, 255, 0, 128 + 49, 128 - 50);
    GamePad.UpDate();
    ASSERT_TRUE(GamePad.GetLX() == 128);
    ASSERT_TRUE(GamePad.GetLXf() == 1.0f);
    ASSERT_TRUE(GamePad.GetLY() == -128);
    ASSERT_TRUE(GamePad.GetLYf() == -1.0f);
    ASSERT_TRUE(GamePad.GetRX() == 0);
    ASSERT_TRUE(GamePad.GetRY() == AxisCalibration(78));
    ASSERT_TRUE(GamePad.GetRY() == 0);

    SetPad(0, 0, 128 + 50, 128, 128, 128 - 51);
    GamePad.UpDate();
    ASSERT_TRUE(GamePad.GetLX() == 1);
    ASSERT_TRUE(GamePad.GetRY() == -1);
    ASSERT_NEAR(GamePad.GetLXf(), 1.0f / 128.0f, 1e-6f);

    SetPad(0, 0);
    GamePad.UpDate();
    ASSERT_TRUE(GamePad.GetLX() == 0 && GamePad.GetLY() == 0 && GamePad.GetRX() == 0 && GamePad.GetRY() == 0);
}

TEST(PlatformPad, VibrationDrivesRumble) {
    OpenPads();
    GamePad.VibrationEnable(1);
    GamePad.SetVibration(0, 5, 2);
    GamePad.SetVibration(1, 200, 2);
    GamePad.Step();
    InputRumble rumble = InputGetRumble(0);
    ASSERT_TRUE(rumble.small_motor);
    ASSERT_TRUE(rumble.large_motor == 200);
    GamePad.Step();
    GamePad.Step();
    rumble = InputGetRumble(0);
    ASSERT_TRUE(!rumble.small_motor);
    ASSERT_TRUE(rumble.large_motor == 0);
}

TEST(PlatformPad, InputBindings) {
    std::string_view keys[] = {"Space", "Z"};
    ASSERT_TRUE(InputBindKeys("cross", keys));
    std::string_view unknown[] = {"NoSuchKey"};
    ASSERT_TRUE(!InputBindKeys("cross", unknown));
    ASSERT_TRUE(!InputBindKeys("jump", keys));
    InputResetBindings();
    InputPoll();
    ASSERT_TRUE(InputGetPad(0).connected);
    ASSERT_TRUE(InputGetPad(0).buttons == 0);
    ASSERT_TRUE(InputGetPad(0).left_x == 128);
    ASSERT_TRUE(!InputGetPad(1).connected);
}

TEST(PlatformPad, InputWithoutVideo) {
    InputInit();
    InputPoll();
    ASSERT_TRUE(InputGetPad(0).connected);
    ASSERT_TRUE(InputGetPad(0).buttons == 0);
    InputSetRumble(0, {true, 255});
    InputShutdown();
}
