#pragma once

#include <cstdint>

// The game's logic clock: the port's stand-in for the PS2's VSync interrupt.
//
// The game counts time in VSyncs. One logic tick is one VSync; the count is
// the number of tick periods elapsed since the clock was anchored, so a frame
// that overruns sees the count jump as retail does (`over_vsync`) and the game
// never runs frames fast to catch up. Nothing runs asynchronously: the tick
// callback (the game's VSync callback, `PlayTimeCount` or the loading screen)
// runs inside `ClockPump`, once for every tick that elapsed since the previous
// pump, with the count already advanced to that tick. Every place retail
// spins on the interrupt (`WaitVSync`, `check_now_loading`, `ReadBGSync`,
// `sceGsSyncV`, ...) must pump, or its spin never ends. `ClockPump` then runs
// every pump hook (the host's: window events, input sampling) in the order
// they were added, then the idle hook (the game's: loading-screen presents)
// once. It is not reentrant: a pump from inside the callback or a hook does
// nothing.
//
// The mglib VSync group maps onto it directly: `MGGetVSyncCount` returns
// `ClockTickCount()`, `MGInitVSyncCallBack` calls `ClockSetTickCallback`, and
// `MGEndFrame` calls `ClockWaitNextTick()` then `ClockPump()` (`ClockSyncV`).
//
// The tick rate is a runtime setting (50 Hz, the PAL field rate, by default)
// and changing it re-anchors the clock without moving the count. Unbounded
// mode, for headless runs, ignores real time: each pump advances exactly one
// tick and waiting returns at once.

using ClockTickCallback = int (*)(int);
using ClockIdleHook = void (*)();

void ClockSetTickRate(double hertz);

double ClockTickRate();

void ClockSetUnbounded(bool unbounded);

bool ClockUnbounded();

// Re-anchors the clock at the current time with a count of zero.
void ClockReset();

std::int64_t ClockTickCount();

void ClockSetTickCallback(ClockTickCallback callback);

ClockTickCallback ClockGetTickCallback();

// One slot, owned by the game side; installing a hook replaces the previous one.
void ClockSetIdleHook(ClockIdleHook hook);

ClockIdleHook ClockGetIdleHook();

// Pump hooks stay installed whatever the game does with the idle hook. Adding one twice runs it
// once.
void ClockAddPumpHook(ClockIdleHook hook);

void ClockRemovePumpHook(ClockIdleHook hook);

std::int64_t ClockPump();

void ClockWaitNextTick();

// What `sceGsSyncV` and the end of a frame do: wait for the next tick, then pump.
std::int64_t ClockSyncV();
