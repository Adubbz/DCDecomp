#include "input.hpp"

#include <SDL3/SDL.h>

#include <array>
#include <cstdio>
#include <optional>
#include <string>
#include <vector>

#include "config.hpp"

namespace {

enum class ActionKind {
    Button,
    Axis,
};

enum Axis {
    kAxisLeftX,
    kAxisLeftY,
    kAxisRightX,
    kAxisRightY,
};

struct Action {
    std::string_view                         name;
    ActionKind                               kind;
    std::uint16_t                            button;
    Axis                                     axis;
    int                                      direction;
    SDL_Scancode                             default_key;
};

// clang-format off
const Action kActions[] = {
    {"up",       ActionKind::Button, kInputUp,       kAxisLeftX,  0,  SDL_SCANCODE_UP},
    {"down",     ActionKind::Button, kInputDown,     kAxisLeftX,  0,  SDL_SCANCODE_DOWN},
    {"left",     ActionKind::Button, kInputLeft,     kAxisLeftX,  0,  SDL_SCANCODE_LEFT},
    {"right",    ActionKind::Button, kInputRight,    kAxisLeftX,  0,  SDL_SCANCODE_RIGHT},
    {"cross",    ActionKind::Button, kInputCross,    kAxisLeftX,  0,  SDL_SCANCODE_Z},
    {"circle",   ActionKind::Button, kInputCircle,   kAxisLeftX,  0,  SDL_SCANCODE_X},
    {"square",   ActionKind::Button, kInputSquare,   kAxisLeftX,  0,  SDL_SCANCODE_C},
    {"triangle", ActionKind::Button, kInputTriangle, kAxisLeftX,  0,  SDL_SCANCODE_V},
    {"l1",       ActionKind::Button, kInputL1,       kAxisLeftX,  0,  SDL_SCANCODE_Q},
    {"r1",       ActionKind::Button, kInputR1,       kAxisLeftX,  0,  SDL_SCANCODE_E},
    {"l2",       ActionKind::Button, kInputL2,       kAxisLeftX,  0,  SDL_SCANCODE_1},
    {"r2",       ActionKind::Button, kInputR2,       kAxisLeftX,  0,  SDL_SCANCODE_3},
    {"l3",       ActionKind::Button, kInputL3,       kAxisLeftX,  0,  SDL_SCANCODE_F},
    {"r3",       ActionKind::Button, kInputR3,       kAxisLeftX,  0,  SDL_SCANCODE_H},
    {"start",    ActionKind::Button, kInputStart,    kAxisLeftX,  0,  SDL_SCANCODE_RETURN},
    {"select",   ActionKind::Button, kInputSelect,   kAxisLeftX,  0,  SDL_SCANCODE_BACKSPACE},
    {"lx-",      ActionKind::Axis,   0,              kAxisLeftX,  -1, SDL_SCANCODE_A},
    {"lx+",      ActionKind::Axis,   0,              kAxisLeftX,  1,  SDL_SCANCODE_D},
    {"ly-",      ActionKind::Axis,   0,              kAxisLeftY,  -1, SDL_SCANCODE_W},
    {"ly+",      ActionKind::Axis,   0,              kAxisLeftY,  1,  SDL_SCANCODE_S},
    {"rx-",      ActionKind::Axis,   0,              kAxisRightX, -1, SDL_SCANCODE_J},
    {"rx+",      ActionKind::Axis,   0,              kAxisRightX, 1,  SDL_SCANCODE_L},
    {"ry-",      ActionKind::Axis,   0,              kAxisRightY, -1, SDL_SCANCODE_I},
    {"ry+",      ActionKind::Axis,   0,              kAxisRightY, 1,  SDL_SCANCODE_K},
};

struct ButtonMap {
    SDL_GamepadButton button;
    std::uint16_t     pad;
};

const ButtonMap kGamepadButtons[] = {
    {SDL_GAMEPAD_BUTTON_SOUTH,          kInputCross},
    {SDL_GAMEPAD_BUTTON_EAST,           kInputCircle},
    {SDL_GAMEPAD_BUTTON_WEST,           kInputSquare},
    {SDL_GAMEPAD_BUTTON_NORTH,          kInputTriangle},
    {SDL_GAMEPAD_BUTTON_BACK,           kInputSelect},
    {SDL_GAMEPAD_BUTTON_START,          kInputStart},
    {SDL_GAMEPAD_BUTTON_LEFT_STICK,     kInputL3},
    {SDL_GAMEPAD_BUTTON_RIGHT_STICK,    kInputR3},
    {SDL_GAMEPAD_BUTTON_LEFT_SHOULDER,  kInputL1},
    {SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER, kInputR1},
    {SDL_GAMEPAD_BUTTON_DPAD_UP,        kInputUp},
    {SDL_GAMEPAD_BUTTON_DPAD_DOWN,      kInputDown},
    {SDL_GAMEPAD_BUTTON_DPAD_LEFT,      kInputLeft},
    {SDL_GAMEPAD_BUTTON_DPAD_RIGHT,     kInputRight},
};
// clang-format on

constexpr std::size_t kActionCount = std::size(kActions);

// The DualShock 2's L2 and R2 are digital in the mode the game uses.
constexpr Sint16 kTriggerThreshold = SDL_JOYSTICK_AXIS_MAX / 4;

// SDL rumble needs a duration; the game restates its motors every frame
// through scePadSetActDirect, so a short one is refreshed and a hung game
// stops shaking the pad on its own.
constexpr Uint32 kRumbleMilliseconds = 500;

struct PadSlot {
    SDL_Gamepad *gamepad = nullptr;
    InputRumble  rumble;
    bool         rumble_sent = false;
    Uint64       rumble_time = 0;
};

std::array<std::vector<SDL_Scancode>, kActionCount>       g_bindings;
bool                                                     g_bindings_ready = false;
std::array<PadSlot, kInputPadCount>                      g_slots;
std::array<InputPadState, kInputPadCount>                g_state;
std::array<std::optional<InputPadState>, kInputPadCount> g_override;
bool                                                     g_gamepad_subsystem = false;

void EnsureBindings() {
    if (g_bindings_ready) {
        return;
    }
    for (std::size_t i = 0; i < kActionCount; ++i) {
        g_bindings[i] = {kActions[i].default_key};
    }
    g_bindings_ready = true;
}

std::uint8_t StickToByte(Sint16 value) {
    return static_cast<std::uint8_t>((static_cast<int>(value) + 32768) >> 8);
}

std::uint8_t &AxisOf(InputPadState &state, Axis axis) {
    switch (axis) {
        case kAxisLeftX:
            return state.left_x;
        case kAxisLeftY:
            return state.left_y;
        case kAxisRightX:
            return state.right_x;
        case kAxisRightY:
            break;
    }
    return state.right_y;
}

void ReadGamepad(SDL_Gamepad *gamepad, InputPadState &state) {
    for (const ButtonMap &map : kGamepadButtons) {
        if (SDL_GetGamepadButton(gamepad, map.button)) {
            state.buttons |= map.pad;
        }
    }
    if (SDL_GetGamepadAxis(gamepad, SDL_GAMEPAD_AXIS_LEFT_TRIGGER) > kTriggerThreshold) {
        state.buttons |= kInputL2;
    }
    if (SDL_GetGamepadAxis(gamepad, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER) > kTriggerThreshold) {
        state.buttons |= kInputR2;
    }
    state.left_x  = StickToByte(SDL_GetGamepadAxis(gamepad, SDL_GAMEPAD_AXIS_LEFTX));
    state.left_y  = StickToByte(SDL_GetGamepadAxis(gamepad, SDL_GAMEPAD_AXIS_LEFTY));
    state.right_x = StickToByte(SDL_GetGamepadAxis(gamepad, SDL_GAMEPAD_AXIS_RIGHTX));
    state.right_y = StickToByte(SDL_GetGamepadAxis(gamepad, SDL_GAMEPAD_AXIS_RIGHTY));
}

void ReadKeyboard(InputPadState &state) {
    int         key_count = 0;
    const bool *keys      = SDL_GetKeyboardState(&key_count);
    if (keys == nullptr) {
        return;
    }
    std::array<int, 4> push{};
    for (std::size_t i = 0; i < kActionCount; ++i) {
        bool down = false;
        for (SDL_Scancode scancode : g_bindings[i]) {
            down |= scancode < key_count && keys[scancode];
        }
        if (!down) {
            continue;
        }
        if (kActions[i].kind == ActionKind::Button) {
            state.buttons |= kActions[i].button;
        } else {
            push[kActions[i].axis] += kActions[i].direction;
        }
    }
    for (int axis = 0; axis < 4; ++axis) {
        if (push[axis] < 0) {
            AxisOf(state, static_cast<Axis>(axis)) = 0;
        } else if (push[axis] > 0) {
            AxisOf(state, static_cast<Axis>(axis)) = 255;
        }
    }
}

void SyncGamepads() {
    SDL_UpdateGamepads();
    for (PadSlot &slot : g_slots) {
        if (slot.gamepad != nullptr && !SDL_GamepadConnected(slot.gamepad)) {
            SDL_CloseGamepad(slot.gamepad);
            slot = PadSlot{};
        }
    }
    int             count = 0;
    SDL_JoystickID *ids   = SDL_GetGamepads(&count);
    if (ids == nullptr) {
        return;
    }
    for (int i = 0; i < count; ++i) {
        bool open = false;
        for (const PadSlot &slot : g_slots) {
            open |= slot.gamepad != nullptr && SDL_GetGamepadID(slot.gamepad) == ids[i];
        }
        if (open) {
            continue;
        }
        for (PadSlot &slot : g_slots) {
            if (slot.gamepad == nullptr) {
                slot.gamepad = SDL_OpenGamepad(ids[i]);
                if (slot.gamepad == nullptr) {
                    std::fprintf(stderr, "input: SDL_OpenGamepad: %s\n", SDL_GetError());
                }
                break;
            }
        }
    }
    SDL_free(ids);
}

void SendRumble(int pad) {
    PadSlot &slot = g_slots[pad];
    if (slot.gamepad == nullptr) {
        return;
    }
    Uint16 low  = static_cast<Uint16>(slot.rumble.large_motor * 257);
    Uint16 high = slot.rumble.small_motor ? 0xFFFF : 0;
    SDL_RumbleGamepad(slot.gamepad, low, high, kRumbleMilliseconds);
    slot.rumble_sent = true;
    slot.rumble_time = SDL_GetTicks();
}

} // namespace

void InputInit() {
    EnsureBindings();
    if (SDL_InitSubSystem(SDL_INIT_GAMEPAD)) {
        g_gamepad_subsystem = true;
    } else {
        std::fprintf(stderr, "input: no gamepads: %s\n", SDL_GetError());
    }
    for (const ConfigKeyBinding &binding : ConfigGet().key_bindings) {
        std::vector<std::string_view> names(binding.keys.begin(), binding.keys.end());
        if (!InputBindKeys(binding.action, names)) {
            std::fprintf(stderr, "input: cannot bind %s\n", binding.action.c_str());
        }
    }
}

void InputShutdown() {
    for (PadSlot &slot : g_slots) {
        if (slot.gamepad != nullptr) {
            SDL_CloseGamepad(slot.gamepad);
        }
        slot = PadSlot{};
    }
    if (g_gamepad_subsystem) {
        SDL_QuitSubSystem(SDL_INIT_GAMEPAD);
        g_gamepad_subsystem = false;
    }
}

void InputPoll() {
    EnsureBindings();
    if (g_gamepad_subsystem) {
        SyncGamepads();
    }
    for (int pad = 0; pad < kInputPadCount; ++pad) {
        InputPadState state;
        state.connected = pad == 0 || g_slots[pad].gamepad != nullptr;
        if (g_slots[pad].gamepad != nullptr) {
            ReadGamepad(g_slots[pad].gamepad, state);
        }
        // Keyboard state only moves while the video subsystem pumps events.
        if (pad == 0 && SDL_WasInit(SDL_INIT_VIDEO) != 0) {
            ReadKeyboard(state);
        }
        g_state[pad] = state;
    }
}

const InputPadState &InputGetPad(int pad) {
    static const InputPadState kAbsent;
    if (pad < 0 || pad >= kInputPadCount) {
        return kAbsent;
    }
    if (g_override[pad]) {
        return *g_override[pad];
    }
    return g_state[pad];
}

void InputSetRumble(int pad, InputRumble rumble) {
    if (pad < 0 || pad >= kInputPadCount) {
        return;
    }
    PadSlot &slot    = g_slots[pad];
    bool     changed = slot.rumble.small_motor != rumble.small_motor || slot.rumble.large_motor != rumble.large_motor;
    bool     active  = rumble.small_motor || rumble.large_motor != 0;
    slot.rumble      = rumble;
    if (changed || (active && SDL_GetTicks() - slot.rumble_time >= kRumbleMilliseconds / 2)) {
        SendRumble(pad);
    }
}

InputRumble InputGetRumble(int pad) {
    if (pad < 0 || pad >= kInputPadCount) {
        return {};
    }
    return g_slots[pad].rumble;
}

void InputSetOverride(int pad, const InputPadState *state) {
    if (pad < 0 || pad >= kInputPadCount) {
        return;
    }
    if (state != nullptr) {
        g_override[pad] = *state;
    } else {
        g_override[pad].reset();
    }
}

bool InputBindKeys(std::string_view action, std::span<const std::string_view> keys) {
    EnsureBindings();
    for (std::size_t i = 0; i < kActionCount; ++i) {
        if (kActions[i].name != action) {
            continue;
        }
        std::vector<SDL_Scancode> scancodes;
        for (std::string_view key : keys) {
            SDL_Scancode scancode = SDL_GetScancodeFromName(std::string(key).c_str());
            if (scancode == SDL_SCANCODE_UNKNOWN) {
                return false;
            }
            scancodes.push_back(scancode);
        }
        g_bindings[i] = std::move(scancodes);
        return true;
    }
    return false;
}

void InputResetBindings() {
    g_bindings_ready = false;
    EnsureBindings();
}
