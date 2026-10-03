#include <SDL3/SDL.h>
#include <libpad.h>

#include "../platform/input.hpp"
#include "gameloop.hpp"
#include "gamepad.hpp"
#include "mainselect.hpp"
#include "test.hpp"

// RunGame's DebugMode tests (GameDebugRequestedAtBoot in the warm-up, GameCheckDebugToggle after each
// frame) on pad 2's shoulder buttons, as retail PAL, and on the host's debug key. The pads are set
// up as platform_pad_test does: CGamePad::Init waits on a stub.

namespace {

unsigned char g_dma_buffer[2][1024];

void SetPad2(std::uint16_t buttons) {
    InputPadState state;
    state.connected = true;
    state.buttons = buttons;
    InputSetOverride(1, &state);
}

void OpenPads() {
    DC_CHECK(scePadInit(0) == 1);
    DC_CHECK(scePadPortOpen(0, 0, g_dma_buffer[0]) == 1);
    DC_CHECK(scePadPortOpen(1, 0, g_dma_buffer[1]) == 1);
    SetPad2(0);
    for (int i = 0; i < 4; ++i) {
        GamePad.UpDate();
    }
}

void Key(SDL_Scancode scancode, bool down) {
    SDL_Event event{};
    event.type = down ? SDL_EVENT_KEY_DOWN : SDL_EVENT_KEY_UP;
    event.key.scancode = scancode;
    event.key.down = down;
    InputHandleEvent(event);
}

// One frame of RunGame's main loop, as far as DebugMode is concerned.
void Frame() {
    GamePad.UpDate();
    GameCheckDebugToggle();
}

constexpr std::uint16_t kShoulders = PAD_L1 | PAD_R1 | PAD_L2 | PAD_R2;

} // namespace

DC_TEST(platform_input_debug_requested_at_boot) {
    InputResetBindings();
    OpenPads();
    GamePad.UpDate();
    DC_CHECK(!GameDebugRequestedAtBoot());

    SetPad2(kShoulders);
    GamePad.UpDate();
    DC_CHECK(GameDebugRequestedAtBoot());
    SetPad2(PAD_L1 | PAD_R1 | PAD_L2);
    GamePad.UpDate();
    DC_CHECK(!GameDebugRequestedAtBoot());

    // The key held through a tick, or pressed and let go between two.
    SetPad2(0);
    GamePad.UpDate();
    Key(SDL_SCANCODE_GRAVE, true);
    DC_CHECK(GameDebugRequestedAtBoot());
    DC_CHECK(GameDebugRequestedAtBoot());
    Key(SDL_SCANCODE_GRAVE, false);
    DC_CHECK(!GameDebugRequestedAtBoot());
    Key(SDL_SCANCODE_GRAVE, true);
    Key(SDL_SCANCODE_GRAVE, false);
    DC_CHECK(GameDebugRequestedAtBoot());
    DC_CHECK(!GameDebugRequestedAtBoot());
}

DC_TEST(platform_input_debug_toggles_in_game) {
    InputResetBindings();
    OpenPads();
    DebugMode = 0;

    // Retail PAL: the four shoulders held, R3's press edge flips it, once per press.
    SetPad2(kShoulders);
    Frame();
    DC_CHECK(DebugMode == 0);
    SetPad2(kShoulders | PAD_R3);
    Frame();
    DC_CHECK(DebugMode == 1);
    Frame();
    DC_CHECK(DebugMode == 1);
    SetPad2(kShoulders);
    Frame();
    SetPad2(kShoulders | PAD_R3);
    Frame();
    DC_CHECK(DebugMode == 0);
    SetPad2(PAD_R3);
    Frame();
    SetPad2(0);
    Frame();
    DC_CHECK(DebugMode == 0);

    // The key: one flip per press, holding it does nothing more.
    Key(SDL_SCANCODE_GRAVE, true);
    Frame();
    DC_CHECK(DebugMode == 1);
    Frame();
    Frame();
    DC_CHECK(DebugMode == 1);
    Key(SDL_SCANCODE_GRAVE, false);
    Frame();
    DC_CHECK(DebugMode == 1);
    Key(SDL_SCANCODE_GRAVE, true);
    Key(SDL_SCANCODE_GRAVE, false);
    Frame();
    DC_CHECK(DebugMode == 0);

    // A boot without debug mode locks pad 2 (KeyLock2), so retail's combination cannot reach the
    // game any more; the key is not pad 2 and still can.
    GamePad.KeyLock2(1);
    SetPad2(kShoulders);
    Frame();
    SetPad2(kShoulders | PAD_R3);
    Frame();
    DC_CHECK(DebugMode == 0);
    Key(SDL_SCANCODE_GRAVE, true);
    Key(SDL_SCANCODE_GRAVE, false);
    Frame();
    DC_CHECK(DebugMode == 1);
    GamePad.KeyLock2(0);
}
