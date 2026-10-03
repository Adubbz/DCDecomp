#pragma once

#include <cstdint>

// The game's main(): start-up, then one mode after another. The window, renderer, input and clock
// must already be initialised; the tick callback is the game's to install, the idle hook and the
// pump hooks the caller's. Returns kExitOk once a stop was requested or the frame budget is spent,
// at the end of a frame of the main loop, outside any frame, so the last frame can be read back.
int RunGame(int argc, char **argv);

// Frames of RunGame's main loop, one per MGEndFrame it calls itself; the presents a mode makes
// on its own (EditLoop's fades) and the loading screen's are not counted. Negative is no budget.
void GameSetFrameBudget(std::int64_t frames);

std::int64_t GameFrameCount();

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
