#include "gamepad.hpp"

/* The game's single global gamepad instance. Deliberately has no constructor:
 * retail never calls `__ct__8CGamePadFv`, only `Init__8CGamePadFv`, so adding
 * one would emit a `.ctor` entry retail doesn't have. */
CGamePad GamePad;
