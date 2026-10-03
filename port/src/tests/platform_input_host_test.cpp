#include <SDL3/SDL.h>
#include <gtest/gtest.h>

#include <string_view>

#include "../platform/input.hpp"
#include "../platform/input_script.hpp"
#include "../platform/window.hpp"

// The host action (the FPS toggle): held and press queries through the window's event
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

constexpr InputHostAction kFps = InputHostAction::FpsToggle;

} // namespace

TEST(PlatformInputHost, KeyNames) {
    ASSERT_TRUE(InputScancodeFromName("Grave") == SDL_SCANCODE_GRAVE);
    ASSERT_TRUE(InputScancodeFromName("backquote") == SDL_SCANCODE_GRAVE);
    ASSERT_TRUE(InputScancodeFromName("BACKTICK") == SDL_SCANCODE_GRAVE);
    ASSERT_TRUE(InputScancodeFromName("`") == SDL_SCANCODE_GRAVE);
    ASSERT_TRUE(InputScancodeFromName("F3") == SDL_SCANCODE_F3);
}

TEST(PlatformInputHost, FpsToggleDefaultsToF3) {
    InputResetBindings();
    ASSERT_TRUE(!InputHostHeld(kFps) && !InputHostPressed(kFps));

    Key(SDL_SCANCODE_F3, true);
    ASSERT_TRUE(InputHostHeld(kFps));
    // Auto-repeat is not a press.
    Key(SDL_SCANCODE_F3, true, true);
    ASSERT_TRUE(InputHostPressed(kFps));
    ASSERT_TRUE(!InputHostPressed(kFps));
    Key(SDL_SCANCODE_F3, false);
    ASSERT_TRUE(!InputHostHeld(kFps));

    // A tap between two polls still counts, once per press.
    Key(SDL_SCANCODE_F3, true);
    Key(SDL_SCANCODE_F3, false);
    Key(SDL_SCANCODE_F3, true);
    Key(SDL_SCANCODE_F3, false);
    ASSERT_TRUE(!InputHostHeld(kFps));
    ASSERT_TRUE(InputHostPressed(kFps) && InputHostPressed(kFps) && !InputHostPressed(kFps));

    // The toggle leaves the pad alone, and the key left of 1 is bound to nothing.
    Key(SDL_SCANCODE_GRAVE, true);
    Key(SDL_SCANCODE_GRAVE, false);
    ASSERT_TRUE(!InputHostPressed(kFps));
    InputKeyboardMouse held;
    held.keys = {SDL_SCANCODE_GRAVE, SDL_SCANCODE_F3};
    InputPadState base;
    InputPadState pad = InputApplyKeyboardMouse(base, held);
    ASSERT_TRUE(pad.buttons == 0 && pad.left_x == kInputAxisCentre && pad.stick_dpad == 0);
}

TEST(PlatformInputHost, FpsToggleRebinds) {
    InputResetBindings();
    ASSERT_TRUE(Bind("fps_toggle", {"F12", "Gamepad:guide", "Mouse4"}));
    ASSERT_TRUE(!Bind("fps_toggle", {"Gamepad:nonsense"}));
    ASSERT_TRUE(!Bind("fps_toggle", {"MouseX"}));
    ASSERT_TRUE(!Bind("debug_toggle", {"F12"}));
    // Pad actions take their gamepad buttons from the gamepad itself.
    ASSERT_TRUE(!Bind("cross", {"Gamepad:a"}));

    Key(SDL_SCANCODE_F3, true);
    ASSERT_TRUE(!InputHostHeld(kFps) && !InputHostPressed(kFps));
    Key(SDL_SCANCODE_F3, false);
    Key(SDL_SCANCODE_F12, true);
    ASSERT_TRUE(InputHostHeld(kFps) && InputHostPressed(kFps));
    Key(SDL_SCANCODE_F12, false);
    ASSERT_TRUE(!InputHostPressed(kFps));
}

// SDL_PushEvent on the offscreen driver reaches the toggle through the window's event hook.
TEST(PlatformInputHost, ToggleThroughWindowEvents) {
    WindowInit(WindowConfig{320, 240, true});
    InputInit();
    SDL_Event event{};
    event.type = SDL_EVENT_KEY_DOWN;
    event.key.scancode = SDL_SCANCODE_F3;
    event.key.down = true;
    event.key.windowID = SDL_GetWindowID(WindowHandle());
    ASSERT_TRUE(SDL_PushEvent(&event));
    ASSERT_TRUE(WindowPollEvents());
    InputPoll();
    ASSERT_TRUE(InputHostHeld(kFps));
    ASSERT_TRUE(InputHostPressed(kFps) && !InputHostPressed(kFps));
    event.type = SDL_EVENT_KEY_UP;
    event.key.down = false;
    ASSERT_TRUE(SDL_PushEvent(&event));
    ASSERT_TRUE(WindowPollEvents());
    ASSERT_TRUE(!InputHostHeld(kFps));
    InputShutdown();
    WindowShutdown();
}

// key:F3 in a script holds the toggle from its frame; the frame it becomes held is one press.
TEST(PlatformInputHost, ToggleFromTheScript) {
    InputScript script;
    std::string error;
    ASSERT_TRUE(InputScriptParse("0 key:F3\n5\n10 key:F3 cross\n12\n", script, error));
    InputScriptInstall(std::move(script));
    ASSERT_TRUE(InputHostHeld(kFps));
    ASSERT_TRUE(InputHostPressed(kFps) && !InputHostPressed(kFps));
    InputScriptApply(3);
    ASSERT_TRUE(InputHostHeld(kFps) && !InputHostPressed(kFps));
    InputScriptApply(5);
    ASSERT_TRUE(!InputHostHeld(kFps));
    InputScriptApply(10);
    ASSERT_TRUE(InputHostHeld(kFps) && InputHostPressed(kFps));
    ASSERT_TRUE((InputGetPad(0).buttons & kInputCross) != 0);
    InputScriptApply(11);
    ASSERT_TRUE(!InputHostPressed(kFps));
    InputScriptInstall(InputScript{});
}
