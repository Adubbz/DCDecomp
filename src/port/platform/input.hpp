#pragma once

#include <cstdint>
#include <span>
#include <string_view>

// Host input shaped like two DualShock 2 controllers. The first gamepad and
// the keyboard drive pad 0, the second gamepad pad 1.

constexpr int kInputPadCount = 2;

// libpad's button word with its bytes in the order the game reads them
// (`((data[2] << 8) | data[3]) ^ 0xFFFF`), active-high: the game's PadButton.
enum InputButton : std::uint16_t {
    kInputL2       = 0x0001,
    kInputR2       = 0x0002,
    kInputL1       = 0x0004,
    kInputR1       = 0x0008,
    kInputTriangle = 0x0010,
    kInputCircle   = 0x0020,
    kInputCross    = 0x0040,
    kInputSquare   = 0x0080,
    kInputSelect   = 0x0100,
    kInputL3       = 0x0200,
    kInputR3       = 0x0400,
    kInputStart    = 0x0800,
    kInputUp       = 0x1000,
    kInputRight    = 0x2000,
    kInputDown     = 0x4000,
    kInputLeft     = 0x8000,
};

constexpr std::uint8_t kInputAxisCentre = 128;

struct InputPadState {
    bool          connected = false;
    std::uint16_t buttons   = 0;
    std::uint8_t  left_x    = kInputAxisCentre;
    std::uint8_t  left_y    = kInputAxisCentre;
    std::uint8_t  right_x   = kInputAxisCentre;
    std::uint8_t  right_y   = kInputAxisCentre;
};

struct InputRumble {
    bool         small_motor = false;
    std::uint8_t large_motor = 0;
};

// Opens SDL's gamepad subsystem. Input works without it (keyboard only, or
// nothing when no video subsystem pumps keyboard events either).
void InputInit();

void InputShutdown();

// Samples the keyboard and the gamepads, opening newly connected ones.
void InputPoll();

const InputPadState &InputGetPad(int pad);

void InputSetRumble(int pad, InputRumble rumble);

InputRumble InputGetRumble(int pad);

// Replaces what InputPoll reads for one pad, for tests and replays; nullptr
// hands the pad back to the devices.
void InputSetOverride(int pad, const InputPadState *state);

// Rebinds one action ("cross", "up", "lx-", ...) of the keyboard map to the
// SDL key names given. Returns false if the action or a name is unknown.
bool InputBindKeys(std::string_view action, std::span<const std::string_view> keys);

// Restores the default keyboard map.
void InputResetBindings();
