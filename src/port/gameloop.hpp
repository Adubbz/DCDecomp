#pragma once

// The game's main(): start-up, then one mode after another until the process
// exits. The window, renderer, input and clock must already be initialised;
// the tick callback is the game's to install, the idle hook the caller's.
int RunGame(int argc, char **argv);
