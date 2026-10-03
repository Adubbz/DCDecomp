#pragma once

#include <chrono>
#include <cstdint>

#include "gfx/gfx.hpp"

// The game's main(): start-up, then one mode after another. The window, renderer, input and clock
// must already be initialised; the tick callback is the game's to install, the idle hook and the
// pump hooks the caller's. Returns kExitOk once a stop was requested or the frame budget is spent,
// at the end of a frame of the main loop, outside any frame, so the last frame can be read back.
int RunGame(int argc, char **argv);

// Frames of RunGame's main loop, one per MGEndFrame it calls itself; the presents a mode makes
// on its own (EditLoop's fades) and the loading screen's are not counted. Negative is no budget.
void GameSetFrameBudget(std::int64_t frames);

std::int64_t GameFrameCount();

// Test hooks. GameSetJump takes "edit[:<map no>]" (the game's MapNo: 0-4 the towns, 11 and up
// the sub maps, 99 the interior), "dungeon[:<n>]" (dungeon n, 0-6, map 200 + n, at its floor
// select), "title", "rush", "opening" or "menu"; false for anything else. RunGame then sets
// DebugMode, skips the warm-up and starts in that mode, set up as the developer menu (and, for a
// dungeon, its loader) would have. GameSetFastLoad cuts the loading screen's holds and fades to a
// few ticks.
bool GameSetJump(const char *spec);
void GameSetFastLoad(bool fast);
bool GameFastLoad();

// DebugMode from the pads and the host's debug key ([input] debug_toggle), factored out of RunGame
// for the tests. GameDebugRequestedAtBoot is the warm-up's test, once per tick: pad 2's L1+R1+L2+R2
// held, as retail PAL, or the key held or pressed since the last test. GameCheckDebugToggle runs after
// every frame of the main loop and flips DebugMode on pad 2's L1+R1+L2+R2 held with R3 pressed, as
// retail PAL, or on a press of the key.
bool GameDebugRequestedAtBoot();
void GameCheckDebugToggle();

// Honoured at the next frame boundary of the main loop.
void GameRequestStop();

bool GameStopRequested();

// What RunGame does between two modes and after a mode's loop returns, factored out so the
// transitions can be tested against the game's globals.

// NextMapNo, as MapJump left it, into mode, MapNo, LocalMapNo and main_select_menu_no.
void GameFollowMapJump();

// A non-zero result from loop_mode's loop (or the rush movie's skip) into the next mode. Retail
// handles each result in the case that ran the loop, so a loop that sets mode itself (the
// developer menu's) is judged by the mode it ran in. Title's result 1 also starts a new game and
// its result 2 reinitialises sound.
void GameApplyLoopResult(int loop_mode, int result);

// ---- Presentation ----------------------------------------------------------------------------
//
// Each tick (MGBeginFrame to MGEndFrame) is recorded as a display list. MGEndFrame hands it to
// GameRenderTick, which renders it once as the canonical image the next tick's effects sample;
// then, while MGEndFrame waits for the next tick, GamePresentBetweenTicks presents display frames
// interpolated between the last two lists at the elapsed fraction of the tick, and
// GamePresentTickEnd presents the canonical image if nothing was presented during the tick.

struct GamePresentSettings {
    // Off presents each tick's canonical image once, as the PS2 showed a field per VSync.
    bool interpolation = true;
    // Display frames per second at most; 0 leaves the pace to the present mode.
    double max_fps = 0.0;
    // Unbounded clock only (headless tests): display renders made per tick, at alphas k / n, before
    // the canonical image is presented.
    int display_per_tick = 0;
};

void GameSetPresentSettings(const GamePresentSettings &settings);

void GameRenderTick(gfx::DisplayListRef list);
bool GamePresentBetweenTicks(double fraction, std::chrono::steady_clock::time_point next_tick);
void GamePresentTickEnd();

struct GamePresentStats {
    std::uint64_t ticks;
    std::uint64_t display_frames;
    double        canonical_seconds;
    double        display_seconds;
    std::uint64_t mesh_draws;
    std::uint64_t keyed_mesh_draws;
    std::uint64_t draws_2d;
    std::uint64_t stateful;
    std::uint64_t max_draws;
};

GamePresentStats GamePresentStatistics();
