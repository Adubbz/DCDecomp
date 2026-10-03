#include <SDL3/SDL.h>
#include <gtest/gtest.h>
#include <libpad.h>

#include <unistd.h>

#include <filesystem>
#include <fstream>
#include <string>

#include "../platform/config.hpp"
#include "../platform/input.hpp"
#include "../platform/paths.hpp"
#include "gameloop.hpp"
#include "main.hpp"
#include "gamepad.hpp"
#include "mainselect.hpp"

// RunGame's DebugMode tests after each frame, both on pad 1 and both read past the game's pad lock:
// GameCheckDebugToggle (retail PAL's shoulder buttons and R3, while the config file's debug mode is
// on) and GameDeveloperMenuRequested (Start and Select). The pads are set up as platform_pad_test
// does: CGamePad::Init waits on a stub.

namespace {

unsigned char g_dma_buffer[2][1024];

void OpenPads() {
    ASSERT_TRUE(scePadInit(0) == 1);
    ASSERT_TRUE(scePadPortOpen(0, 0, g_dma_buffer[0]) == 1);
    ASSERT_TRUE(scePadPortOpen(1, 0, g_dma_buffer[1]) == 1);
    for (int i = 0; i < 4; ++i) {
        GamePad.UpDate();
    }
}

void SetPad1(std::uint16_t buttons) {
    InputPadState state;
    state.connected = true;
    state.buttons = buttons;
    InputSetOverride(0, &state);
    GamePad.UpDate();
}

// One frame of RunGame's main loop, as far as DebugMode is concerned.
void Frame(std::uint16_t buttons) {
    SetPad1(buttons);
    GameCheckDebugToggle();
}

void LoadConfig(const char *text) {
    std::filesystem::path root =
        std::filesystem::temp_directory_path() / ("dc_debug_toggle_test_" + std::to_string(getpid()));
    std::filesystem::create_directories(root);
    PathsSetSaveRoot(root);
    std::ofstream(root / "config.json") << text;
    ASSERT_TRUE(ConfigLoad());
    std::filesystem::remove_all(root);
}

constexpr std::uint16_t kShoulders = PAD_L1 | PAD_R1 | PAD_L2 | PAD_R2;

} // namespace

extern s32 mode;

TEST(PlatformInputDebugToggle, StartAndSelectAskForTheDeveloperMenu) {
    InputResetBindings();
    OpenPads();
    DebugMode = 1;
    mode = GAME_MODE_TITLE;
    SetPad1(0);
    ASSERT_TRUE(!GameDeveloperMenuRequested());
    SetPad1(PAD_START);
    ASSERT_TRUE(!GameDeveloperMenuRequested());

    // The press of the chord, not the hold; a locked pad does not hide it.
    GamePad.KeyLock(1);
    SetPad1(PAD_START | PAD_SELECT);
    ASSERT_TRUE(GamePad.On(PAD_SELECT) == 0);
    ASSERT_TRUE(GameDeveloperMenuRequested());
    ASSERT_TRUE(!GameDeveloperMenuRequested());
    GamePad.KeyLock(0);

    SetPad1(PAD_SELECT);
    ASSERT_TRUE(!GameDeveloperMenuRequested());
    mode = GAME_MODE_MENU;
    SetPad1(PAD_START | PAD_SELECT | PAD_CROSS);
    ASSERT_TRUE(!GameDeveloperMenuRequested());

    SetPad1(0);
    ASSERT_TRUE(!GameDeveloperMenuRequested());
    mode = GAME_MODE_DUNGEON;
    DebugMode = 0;
    SetPad1(PAD_START | PAD_SELECT);
    ASSERT_TRUE(!GameDeveloperMenuRequested());
    InputSetOverride(0, nullptr);
}

TEST(PlatformInputDebugToggle, TogglesInGameOnPad1) {
    InputResetBindings();
    OpenPads();
    LoadConfig(R"({"game": {"debug_mode": true}})");
    DebugMode = 1;

    // The four shoulders held, R3's press edge flips it, once per press.
    Frame(kShoulders);
    ASSERT_TRUE(DebugMode == 1);
    Frame(kShoulders | PAD_R3);
    ASSERT_TRUE(DebugMode == 0);
    Frame(kShoulders | PAD_R3);
    ASSERT_TRUE(DebugMode == 0);
    Frame(kShoulders);
    Frame(kShoulders | PAD_R3);
    ASSERT_TRUE(DebugMode == 1);
    Frame(PAD_R3);
    Frame(0);
    Frame(PAD_L1 | PAD_R1 | PAD_L2 | PAD_R3);
    ASSERT_TRUE(DebugMode == 1);
    Frame(0);

    // A locked pad does not hide it.
    GamePad.KeyLock(1);
    Frame(kShoulders | PAD_R3);
    ASSERT_TRUE(DebugMode == 0);
    GamePad.KeyLock(0);
    InputSetOverride(0, nullptr);
}

TEST(PlatformInputDebugToggle, NothingTogglesWithTheConfigFlagOff) {
    InputResetBindings();
    OpenPads();
    LoadConfig(R"({"game": {"debug_mode": false}})");
    DebugMode = 0;
    Frame(kShoulders);
    Frame(kShoulders | PAD_R3);
    ASSERT_TRUE(DebugMode == 0);

    // Pad 2's combination and the key left of 1 are not read at all.
    InputPadState pad2;
    pad2.connected = true;
    pad2.buttons = kShoulders;
    InputSetOverride(1, &pad2);
    Frame(0);
    pad2.buttons = kShoulders | PAD_R3;
    InputSetOverride(1, &pad2);
    Frame(0);
    SDL_Event event{};
    event.type = SDL_EVENT_KEY_DOWN;
    event.key.scancode = SDL_SCANCODE_GRAVE;
    event.key.down = true;
    InputHandleEvent(event);
    Frame(0);
    ASSERT_TRUE(DebugMode == 0);
    InputSetOverride(0, nullptr);
    InputSetOverride(1, nullptr);
}
