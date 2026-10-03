#include <SDL3/SDL.h>

#include <string_view>

#include "../platform/input.hpp"
#include "../platform/input_script.hpp"
#include "../platform/window.hpp"
#include "test.hpp"

// The host actions (the debug and FPS toggles): held and press queries through the window's event
// hook, the bindings and the input script.

namespace {

void Key(SDL_Scancode scancode, bool down, bool repeat = false) {
    SDL_Event event{};
    event.type = down ? SDL_EVENT_KEY_DOWN : SDL_EVENT_KEY_UP;
    event.key.scancode = scancode;
    event.key.down = down;
    event.key.repeat = repeat;
    InputHandleEvent(event);
}

bool Bind(std::string_view action, std::initializer_list<std::string_view> keys) {
    return InputBindKeys(action, std::span<const std::string_view>(keys.begin(), keys.size()));
}

constexpr InputHostAction kDebug = InputHostAction::DebugToggle;
constexpr InputHostAction kFps = InputHostAction::FpsToggle;

} // namespace

DC_TEST(platform_input_host_key_names) {
    DC_CHECK(InputScancodeFromName("Grave") == SDL_SCANCODE_GRAVE);
    DC_CHECK(InputScancodeFromName("backquote") == SDL_SCANCODE_GRAVE);
    DC_CHECK(InputScancodeFromName("BACKTICK") == SDL_SCANCODE_GRAVE);
    DC_CHECK(InputScancodeFromName("`") == SDL_SCANCODE_GRAVE);
    DC_CHECK(InputScancodeFromName("F3") == SDL_SCANCODE_F3);
}

DC_TEST(platform_input_host_toggles_default_to_grave_and_f3) {
    InputResetBindings();
    DC_CHECK(!InputHostHeld(kDebug) && !InputHostPressed(kDebug));

    Key(SDL_SCANCODE_GRAVE, true);
    DC_CHECK(InputHostHeld(kDebug) && !InputHostHeld(kFps));
    // Auto-repeat is not a press.
    Key(SDL_SCANCODE_GRAVE, true, true);
    DC_CHECK(InputHostPressed(kDebug));
    DC_CHECK(!InputHostPressed(kDebug));
    Key(SDL_SCANCODE_GRAVE, false);
    DC_CHECK(!InputHostHeld(kDebug));

    // A tap between two polls still counts, once per press.
    Key(SDL_SCANCODE_F3, true);
    Key(SDL_SCANCODE_F3, false);
    Key(SDL_SCANCODE_F3, true);
    Key(SDL_SCANCODE_F3, false);
    DC_CHECK(!InputHostHeld(kFps) && !InputHostPressed(kDebug));
    DC_CHECK(InputHostPressed(kFps) && InputHostPressed(kFps) && !InputHostPressed(kFps));

    // The toggles leave the pad alone.
    InputKeyboardMouse held;
    held.keys = {SDL_SCANCODE_GRAVE, SDL_SCANCODE_F3};
    InputPadState base;
    InputPadState pad = InputApplyKeyboardMouse(base, held);
    DC_CHECK(pad.buttons == 0 && pad.left_x == kInputAxisCentre && pad.stick_dpad == 0);
}

DC_TEST(platform_input_host_toggles_rebind) {
    InputResetBindings();
    DC_CHECK(Bind("debug_toggle", {"F12", "Gamepad:guide", "Mouse4"}));
    DC_CHECK(Bind("fps_toggle", {"grave"}));
    DC_CHECK(!Bind("debug_toggle", {"Gamepad:nonsense"}));
    DC_CHECK(!Bind("debug_toggle", {"MouseX"}));
    // Pad actions take their gamepad buttons from the gamepad itself.
    DC_CHECK(!Bind("cross", {"Gamepad:a"}));

    Key(SDL_SCANCODE_GRAVE, true);
    DC_CHECK(InputHostHeld(kFps) && !InputHostHeld(kDebug));
    Key(SDL_SCANCODE_GRAVE, false);
    Key(SDL_SCANCODE_F12, true);
    DC_CHECK(InputHostHeld(kDebug) && InputHostPressed(kDebug));
    Key(SDL_SCANCODE_F12, false);
    DC_CHECK(InputHostPressed(kFps) && !InputHostPressed(kFps));
}

// SDL_PushEvent on the offscreen driver reaches the toggles through the window's event hook.
DC_TEST(platform_input_host_toggle_through_window_events) {
    WindowInit(WindowConfig{320, 240, true});
    InputInit();
    SDL_Event event{};
    event.type = SDL_EVENT_KEY_DOWN;
    event.key.scancode = SDL_SCANCODE_GRAVE;
    event.key.down = true;
    event.key.windowID = SDL_GetWindowID(WindowHandle());
    DC_CHECK(SDL_PushEvent(&event));
    DC_CHECK(WindowPollEvents());
    InputPoll();
    DC_CHECK(InputHostHeld(kDebug));
    DC_CHECK(InputHostPressed(kDebug) && !InputHostPressed(kDebug));
    event.type = SDL_EVENT_KEY_UP;
    event.key.down = false;
    DC_CHECK(SDL_PushEvent(&event));
    DC_CHECK(WindowPollEvents());
    DC_CHECK(!InputHostHeld(kDebug));
    InputShutdown();
    WindowShutdown();
}

// key:grave in a script holds the toggle from its frame; the frame it becomes held is one press.
DC_TEST(platform_input_host_toggle_from_the_script) {
    InputScript script;
    std::string error;
    DC_CHECK(InputScriptParse("0 key:grave\n5\n10 key:F3 cross\n12\n", script, error));
    InputScriptInstall(std::move(script));
    DC_CHECK(InputHostHeld(kDebug));
    DC_CHECK(InputHostPressed(kDebug) && !InputHostPressed(kDebug));
    InputScriptApply(3);
    DC_CHECK(InputHostHeld(kDebug) && !InputHostPressed(kDebug));
    InputScriptApply(5);
    DC_CHECK(!InputHostHeld(kDebug));
    InputScriptApply(10);
    DC_CHECK(InputHostHeld(kFps) && InputHostPressed(kFps));
    DC_CHECK((InputGetPad(0).buttons & kInputCross) != 0);
    InputScriptApply(11);
    DC_CHECK(!InputHostPressed(kFps));
    InputScriptInstall(InputScript{});
}
