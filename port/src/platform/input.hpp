#pragma once

#include <cstdint>
#include <span>
#include <string_view>
#include <vector>

union SDL_Event;

// Host input shaped like two DualShock 2 controllers. The first gamepad, the keyboard and the mouse
// drive pad 0, the second gamepad pad 1.

constexpr int kInputPadCount = 2;

// libpad's button word with its bytes in the order the game reads them
// (`((data[2] << 8) | data[3]) ^ 0xFFFF`), active-high: the game's PadButton.
enum InputButton : std::uint16_t {
    kInputL2 = 0x0001,
    kInputR2 = 0x0002,
    kInputL1 = 0x0004,
    kInputR1 = 0x0008,
    kInputTriangle = 0x0010,
    kInputCircle = 0x0020,
    kInputCross = 0x0040,
    kInputSquare = 0x0080,
    kInputSelect = 0x0100,
    kInputL3 = 0x0200,
    kInputR3 = 0x0400,
    kInputStart = 0x0800,
    kInputUp = 0x1000,
    kInputRight = 0x2000,
    kInputDown = 0x4000,
    kInputLeft = 0x8000,
};

constexpr std::uint8_t kInputAxisCentre = 128;

struct InputPadState {
    bool          connected = false;
    std::uint16_t buttons = 0;
    std::uint8_t  left_x = kInputAxisCentre;
    std::uint8_t  left_y = kInputAxisCentre;
    std::uint8_t  right_x = kInputAxisCentre;
    std::uint8_t  right_y = kInputAxisCentre;
    // D-pad bits the left-stick keys add only while the game is not reading the left stick: the
    // screens that read the d-pad alone (the developer menu, the dungeon loader).
    std::uint16_t stick_dpad = 0;
};

// What the keyboard and the mouse hold: SDL scancodes, mouse buttons (bit n-1 for Mouse n) and the
// mouse motion over one tick in pixels, y growing downward.
struct InputKeyboardMouse {
    std::vector<int> keys;
    std::uint32_t    mouse_buttons = 0;
    float            mouse_dx = 0.0f;
    float            mouse_dy = 0.0f;
};

struct InputMouseSettings {
    // Stick deflection (1 is full) per pixel of motion in one tick.
    float            sensitivity = 0.1f;
    bool             invert_y = false;
    bool             capture = true;
    std::vector<int> release_scancodes;
};

struct InputRumble {
    bool         small_motor = false;
    std::uint8_t large_motor = 0;
};

// Opens SDL's gamepad subsystem, applies config.json's input section and watches the window's events.
// Input works without a gamepad subsystem or a window (nothing but overrides then).
void InputInit();

void InputShutdown();

// Samples the gamepads, opening newly connected ones, and folds in the keyboard and mouse.
void InputPoll();

// The window event hook InputInit installs: keys, mouse buttons and motion, focus.
void InputHandleEvent(const SDL_Event &event);

// The game is about to read pad: the mouse motion since the previous read becomes the stick
// deflection for this read, and whether the game read the left stick since then decides whether
// stick_dpad applies to it.
void InputLatchPad(int pad);

// The game read pad 0's left stick (CGamePad::GetLX/GetLY, port/src/gamepad.cpp).
void InputNoteLeftStickRead();

// Whether the game read the left stick between the last two latches of pad 0.
bool InputLeftStickLive();

// The pad as the game reads it: the device state or the override, stick_dpad applied.
const InputPadState &InputGetPad(int pad);

void InputSetRumble(int pad, InputRumble rumble);

InputRumble InputGetRumble(int pad);

// Replaces what InputPoll reads for one pad, for tests and replays; nullptr
// hands the pad back to the devices.
void InputSetOverride(int pad, const InputPadState *state);

// base with the keyboard and mouse folded in through the bindings: buttons add, and an axis takes
// the keyboard and mouse deflection unless base deflects it past the game's dead zone.
InputPadState InputApplyKeyboardMouse(InputPadState base, const InputKeyboardMouse &held);

// The stick byte the game's AxisCalibration reads as deflection * 128, deflection in [-1, 1]: the
// dead zone is stepped over, so any motion moves the game.
std::uint8_t InputStickByte(float deflection);

// Rebinds one action ("cross", "up", "lx-", "rx", ...) to the names given: SDL key names, Mouse1 to
// Mouse5 (left, right, middle, X1, X2), and for the whole-axis actions lx ly rx ry MouseX or MouseY
// with an optional sign and scale (-MouseY, MouseX*0.5). Returns false if the action or a name is
// unknown or does not fit the action.
bool InputBindKeys(std::string_view action, std::span<const std::string_view> keys);

// Restores the default bindings and mouse settings.
void InputResetBindings();

void InputSetMouseSettings(const InputMouseSettings &settings);

const InputMouseSettings &InputGetMouseSettings();

// SDL scancode for a key name, any case; `_` stands for a space ("left_shift"), and Grave, Backquote
// and Backtick name the key left of 1. -1 if unknown.
int InputScancodeFromName(std::string_view name);

// Keys that drive the port rather than a pad, bound like the pad's actions ("fps_toggle"), which
// also take Gamepad:<SDL gamepad button name> (Gamepad:guide).
enum class InputHostAction {
    FpsToggle,
};

// Whether a key, mouse button or gamepad button bound to the action is held, live or scripted.
bool InputHostHeld(InputHostAction action);

// Consumes one press of the action since the last call that returned true. Every key-down (not a
// repeat) counts, so a press released before the next poll is not lost.
bool InputHostPressed(InputHostAction action);

// The keyboard and mouse the input script holds now; host actions read them beside the live devices,
// and a key that becomes held counts as a press.
void InputSetScriptedDevices(const InputKeyboardMouse &held);
