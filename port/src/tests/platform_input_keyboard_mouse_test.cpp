#include <SDL3/SDL.h>
#include <libpad.h>

#include <cmath>
#include <string_view>

#include "../platform/clock.hpp"
#include "../platform/input.hpp"
#include "../platform/mouse.hpp"
#include "../platform/window.hpp"
#include "gamepad.hpp"
#include "test.hpp"

// The keyboard and mouse, fed through InputHandleEvent (the window's event hook) and read the way
// the game reads them: libpad, CGamePad, AxisCalibration.

namespace {

unsigned char g_dma_buffer[2][1024];

void Key(SDL_Scancode scancode, bool down) {
    SDL_Event event{};
    event.type = down ? SDL_EVENT_KEY_DOWN : SDL_EVENT_KEY_UP;
    event.key.scancode = scancode;
    event.key.down = down;
    InputHandleEvent(event);
}

void Button(Uint8 button, bool down) {
    SDL_Event event{};
    event.type = down ? SDL_EVENT_MOUSE_BUTTON_DOWN : SDL_EVENT_MOUSE_BUTTON_UP;
    event.button.button = button;
    event.button.down = down;
    InputHandleEvent(event);
}

void Motion(float dx, float dy) {
    SDL_Event event{};
    event.type = SDL_EVENT_MOUSE_MOTION;
    event.motion.xrel = dx;
    event.motion.yrel = dy;
    InputHandleEvent(event);
}

void Focus(bool gained) {
    SDL_Event event{};
    event.type = gained ? SDL_EVENT_WINDOW_FOCUS_GAINED : SDL_EVENT_WINDOW_FOCUS_LOST;
    InputHandleEvent(event);
}

void Uncaptured() {
    InputResetBindings();
    InputMouseSettings settings = InputGetMouseSettings();
    settings.capture = false;
    InputSetMouseSettings(settings);
}

InputPadState Apply(std::initializer_list<SDL_Scancode> keys, std::uint32_t buttons = 0, float dx = 0.0f,
                    float dy = 0.0f) {
    InputKeyboardMouse held;
    for (SDL_Scancode key : keys) {
        held.keys.push_back(key);
    }
    held.mouse_buttons = buttons;
    held.mouse_dx = dx;
    held.mouse_dy = dy;
    InputPadState base;
    base.connected = true;
    return InputApplyKeyboardMouse(base, held);
}

void OpenPads() {
    DC_CHECK(scePadInit(0) == 1);
    DC_CHECK(scePadPortOpen(0, 0, g_dma_buffer[0]) == 1);
    DC_CHECK(scePadPortOpen(1, 0, g_dma_buffer[1]) == 1);
    InputPadState absent;
    InputSetOverride(1, &absent);
}

// The four read_pad calls setup takes before it reads buttons.
void Settle() {
    for (int i = 0; i < 4; ++i) {
        GamePad.UpDate();
    }
}

} // namespace

DC_TEST(platform_input_stick_byte_inverts_axis_calibration) {
    for (int i = -256; i <= 256; ++i) {
        float deflection = static_cast<float>(i) / 256.0f;
        int   target = static_cast<int>(std::lround(deflection * 128.0f));
        int   game = AxisCalibration(InputStickByte(deflection));
        DC_CHECK(game >= target - 1 && game <= target + 1);
        DC_CHECK((game > 0) == (target > 0) && (game < 0) == (target < 0));
    }
    DC_CHECK(InputStickByte(1.0f) == 255 && InputStickByte(-1.0f) == 0);
    DC_CHECK(InputStickByte(2.0f) == 255 && InputStickByte(-7.0f) == 0);
    DC_CHECK(InputStickByte(0.0f) == 128 && InputStickByte(NAN) == 128);
    DC_CHECK(AxisCalibration(InputStickByte(0.01f)) == 1);
}

DC_TEST(platform_input_wasd_drives_the_left_stick) {
    InputResetBindings();
    InputPadState up = Apply({SDL_SCANCODE_W});
    DC_CHECK(AxisCalibration(up.left_y) == -128 && up.left_x == 128);
    DC_CHECK(up.stick_dpad == kInputUp && up.buttons == 0);
    InputPadState right = Apply({SDL_SCANCODE_D});
    DC_CHECK(AxisCalibration(right.left_x) == 128 && right.stick_dpad == kInputRight);
    InputPadState both = Apply({SDL_SCANCODE_A, SDL_SCANCODE_D});
    DC_CHECK(both.left_x == 128 && both.stick_dpad == 0);

    const std::pair<SDL_Scancode, SDL_Scancode> diagonals[] = {
        {SDL_SCANCODE_W, SDL_SCANCODE_D},
        {SDL_SCANCODE_W, SDL_SCANCODE_A},
        {SDL_SCANCODE_S, SDL_SCANCODE_D},
        {SDL_SCANCODE_S, SDL_SCANCODE_A},
    };
    for (auto [vertical, horizontal] : diagonals) {
        InputPadState state = Apply({vertical, horizontal});
        float         x = AxisCalibration(state.left_x) / 128.0f;
        float         y = AxisCalibration(state.left_y) / 128.0f;
        DC_CHECK_NEAR(std::hypot(x, y), 1.0f, 0.02f);
        DC_CHECK_NEAR(std::fabs(x), std::fabs(y), 1e-6f);
        DC_CHECK((y < 0) == (vertical == SDL_SCANCODE_W) && (x > 0) == (horizontal == SDL_SCANCODE_D));
    }
}

DC_TEST(platform_input_gamepad_wins_a_deflected_axis) {
    InputResetBindings();
    InputKeyboardMouse held;
    held.keys = {SDL_SCANCODE_A, SDL_SCANCODE_W};
    InputPadState pad;
    pad.connected = true;
    pad.left_x = 250;
    pad.left_y = 128 + 20;
    pad.buttons = kInputCross;
    InputPadState state = InputApplyKeyboardMouse(pad, held);
    DC_CHECK(state.left_x == 250);
    DC_CHECK(AxisCalibration(state.left_y) < -88);
    DC_CHECK(state.buttons == kInputCross);
}

DC_TEST(platform_input_default_buttons) {
    InputResetBindings();
    const std::pair<SDL_Scancode, std::uint16_t> keys[] = {
        {SDL_SCANCODE_SPACE,     kInputCross   },
        {SDL_SCANCODE_F,         kInputCircle  },
        {SDL_SCANCODE_E,         kInputSquare  },
        {SDL_SCANCODE_TAB,       kInputTriangle},
        {SDL_SCANCODE_Z,         kInputL1      },
        {SDL_SCANCODE_X,         kInputR1      },
        {SDL_SCANCODE_Q,         kInputL2      },
        {SDL_SCANCODE_R,         kInputR2      },
        {SDL_SCANCODE_V,         kInputL3      },
        {SDL_SCANCODE_B,         kInputR3      },
        {SDL_SCANCODE_RETURN,    kInputStart   },
        {SDL_SCANCODE_BACKSPACE, kInputSelect  },
        {SDL_SCANCODE_C,         kInputSelect  },
        {SDL_SCANCODE_UP,        kInputUp      },
        {SDL_SCANCODE_DOWN,      kInputDown    },
        {SDL_SCANCODE_LEFT,      kInputLeft    },
        {SDL_SCANCODE_RIGHT,     kInputRight   },
    };
    for (auto [key, bit] : keys) {
        InputPadState state = Apply({key});
        DC_CHECK(state.buttons == bit);
        DC_CHECK(state.left_x == 128 && state.left_y == 128 && state.stick_dpad == 0);
    }
    DC_CHECK(Apply({}, 1u << 0).buttons == kInputCross);
    DC_CHECK(Apply({}, 1u << 1).buttons == kInputR1);
    DC_CHECK(Apply({}, 1u << 2).buttons == kInputR3);
    InputPadState camera = Apply({SDL_SCANCODE_L, SDL_SCANCODE_I});
    DC_CHECK(AxisCalibration(camera.right_x) > 0 && AxisCalibration(camera.right_y) < 0);
}

DC_TEST(platform_input_events_reach_pad_one) {
    Uncaptured();
    Key(SDL_SCANCODE_TAB, true);
    Key(SDL_SCANCODE_E, true);
    Button(SDL_BUTTON_LEFT, true);
    Button(SDL_BUTTON_RIGHT, true);
    InputPoll();
    DC_CHECK(InputGetPad(0).buttons == (kInputTriangle | kInputSquare | kInputCross | kInputR1));
    Key(SDL_SCANCODE_TAB, false);
    Button(SDL_BUTTON_LEFT, false);
    InputPoll();
    DC_CHECK(InputGetPad(0).buttons == (kInputSquare | kInputR1));
    Focus(false);
    InputPoll();
    DC_CHECK(InputGetPad(0).buttons == 0);
}

DC_TEST(platform_input_rebinds_mouse_buttons_and_axes) {
    Uncaptured();
    std::string_view guard[] = {"Mouse1", "Left_Shift"};
    DC_CHECK(InputBindKeys("r1", guard));
    std::string_view yaw[] = {"MouseX*2"};
    DC_CHECK(InputBindKeys("rx", yaw));
    std::string_view pitch[] = {"- MouseY * 0.5"};
    DC_CHECK(InputBindKeys("ry", pitch));
    std::string_view axis_on_button[] = {"MouseX"};
    DC_CHECK(!InputBindKeys("cross", axis_on_button));
    std::string_view key_on_axis[] = {"Space"};
    DC_CHECK(!InputBindKeys("rx", key_on_axis));
    std::string_view bad_scale[] = {"MouseX*fast"};
    DC_CHECK(!InputBindKeys("rx", bad_scale));
    std::string_view no_button[] = {"Mouse9"};
    DC_CHECK(!InputBindKeys("cross", no_button));

    DC_CHECK(Apply({}, 1u << 0).buttons == (kInputR1 | kInputCross));
    DC_CHECK(Apply({SDL_SCANCODE_LSHIFT}).buttons == kInputR1);
    DC_CHECK(Apply({SDL_SCANCODE_SPACE}).buttons == kInputCross);
    InputPadState moved = Apply({}, 0, 2.5f, -10.0f);
    DC_CHECK(AxisCalibration(moved.right_x) == 64);
    DC_CHECK(AxisCalibration(moved.right_y) == 64);
}

DC_TEST(platform_input_mouse_drives_the_right_stick_and_decays) {
    Uncaptured();
    ClockSetUnbounded(true);
    InputLatchPad(0);

    Motion(3.0f, 0.0f);
    Motion(2.0f, 0.0f);
    ClockPump();
    InputLatchPad(0);
    DC_CHECK(AxisCalibration(InputGetPad(0).right_x) == 64);
    DC_CHECK(InputGetPad(0).right_y == 128);

    // Stopped: centred at the next read.
    ClockPump();
    InputLatchPad(0);
    DC_CHECK(InputGetPad(0).right_x == 128);

    // Mouse up looks up: a positive ry, which lowers the follow camera.
    Motion(0.0f, -5.0f);
    ClockPump();
    InputLatchPad(0);
    DC_CHECK(AxisCalibration(InputGetPad(0).right_y) == 64);

    InputMouseSettings settings = InputGetMouseSettings();
    settings.invert_y = true;
    InputSetMouseSettings(settings);
    Motion(0.0f, -5.0f);
    ClockPump();
    InputLatchPad(0);
    DC_CHECK(AxisCalibration(InputGetPad(0).right_y) == -64);

    // Motion over two ticks between reads counts per tick.
    Motion(-20.0f, 0.0f);
    ClockPump();
    ClockPump();
    InputLatchPad(0);
    DC_CHECK(AxisCalibration(InputGetPad(0).right_x) == -128);
    Motion(-10.0f, 0.0f);
    ClockPump();
    ClockPump();
    InputLatchPad(0);
    DC_CHECK(AxisCalibration(InputGetPad(0).right_x) == -64);

    // Beyond full deflection clamps.
    Motion(1000.0f, 0.0f);
    ClockPump();
    InputLatchPad(0);
    DC_CHECK(InputGetPad(0).right_x == 255);
}

DC_TEST(platform_input_mouse_capture) {
    InputResetBindings();
    DC_CHECK(InputGetMouseSettings().capture && !MouseCaptured());

    // Released: the click captures and is spent on it, and motion is the cursor's.
    Motion(50.0f, 0.0f);
    Button(SDL_BUTTON_LEFT, true);
    DC_CHECK(MouseCaptured());
    InputPoll();
    InputLatchPad(0);
    DC_CHECK(InputGetPad(0).buttons == 0 && InputGetPad(0).right_x == 128);
    Button(SDL_BUTTON_LEFT, false);

    Button(SDL_BUTTON_LEFT, true);
    Motion(5.0f, 0.0f);
    InputPoll();
    InputLatchPad(0);
    DC_CHECK(InputGetPad(0).buttons == kInputCross && AxisCalibration(InputGetPad(0).right_x) > 0);

    // The release key hands the cursor back in a window and reaches nothing else.
    Key(SDL_SCANCODE_ESCAPE, true);
    DC_CHECK(!MouseCaptured());
    InputPoll();
    DC_CHECK(InputGetPad(0).buttons == 0);

    Button(SDL_BUTTON_RIGHT, true);
    DC_CHECK(MouseCaptured());
    Focus(false);
    DC_CHECK(!MouseCaptured());
}

// The d-pad from the movement keys reaches the game only while it does not read the left stick.
DC_TEST(platform_input_movement_keys_press_the_dpad_where_the_stick_is_unread) {
    OpenPads();
    InputResetBindings();
    InputPadState down = Apply({SDL_SCANCODE_S});
    InputSetOverride(0, &down);
    Settle();
    GamePad.UpDate();
    DC_CHECK(!InputLeftStickLive());
    DC_CHECK(GamePad.On(PAD_DOWN) == 1);

    // A screen that reads the stick (walking) sees the stick alone from its next read.
    GamePad.GetLYf();
    GamePad.UpDate();
    DC_CHECK(InputLeftStickLive());
    DC_CHECK(GamePad.On(PAD_DOWN) == 0);
    DC_CHECK(GamePad.GetLY() == 128);
    GamePad.UpDate();
    DC_CHECK(GamePad.On(PAD_DOWN) == 0);

    // A menu with MenuModeOn reads the stick through UpDate and turns it into the d-pad itself.
    GamePad.MenuModeOn(120);
    GamePad.UpDate();
    DC_CHECK(GamePad.On(PAD_DOWN) == 1);
    InputPadState diagonal = Apply({SDL_SCANCODE_S, SDL_SCANCODE_D});
    InputSetOverride(0, &diagonal);
    GamePad.UpDate();
    DC_CHECK(GamePad.On(PAD_DPAD) == 0);
    GamePad.MenuModeOff();

    // Nothing reads the stick again: the d-pad comes back on the read after.
    GamePad.UpDate();
    GamePad.UpDate();
    DC_CHECK(!InputLeftStickLive());
    DC_CHECK(GamePad.On(PAD_DOWN) == 1 && GamePad.On(PAD_RIGHT) == 1);
}

// SDL_PushEvent on the offscreen driver reaches the input through the window's event hook.
DC_TEST(platform_input_window_events_reach_the_pad) {
    WindowInit(WindowConfig{320, 240, true});
    InputInit();
    SDL_Event event{};
    event.type = SDL_EVENT_KEY_DOWN;
    event.key.scancode = SDL_SCANCODE_D;
    event.key.down = true;
    event.key.windowID = SDL_GetWindowID(WindowHandle());
    DC_CHECK(SDL_PushEvent(&event));
    DC_CHECK(WindowPollEvents());
    InputPoll();
    DC_CHECK(AxisCalibration(InputGetPad(0).left_x) == 128);
    InputShutdown();
    WindowShutdown();
}
