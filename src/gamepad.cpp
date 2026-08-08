#include "gamepad.hpp"

/* The game's single global gamepad instance. Deliberately has no constructor:
 * retail never calls `__ct__8CGamePadFv`, only `Init__8CGamePadFv`, so adding
 * one would emit a `.ctor` entry retail doesn't have. */
CGamePad GamePad;

INCLUDE_ASM("main", Init__8CGamePadFv);
INCLUDE_ASM("main", pad_button_read__FP10PAD_STATUSii);
INCLUDE_ASM("main", read_pad__FP10PAD_STATUSii);
INCLUDE_ASM("main", UpDate__8CGamePadFv);
INCLUDE_ASM("main", Step__8CGamePadFv);
INCLUDE_ASM("main", AxisCalibration__Fi);
INCLUDE_ASM("main", GetRX__8CGamePadFv);
INCLUDE_ASM("main", GetRY__8CGamePadFv);
INCLUDE_ASM("main", GetLX__8CGamePadFv);
INCLUDE_ASM("main", GetLY__8CGamePadFv);
INCLUDE_ASM("main", GetRX2__8CGamePadFv);
INCLUDE_ASM("main", GetRY2__8CGamePadFv);
INCLUDE_ASM("main", GetLX2__8CGamePadFv);
INCLUDE_ASM("main", GetLY2__8CGamePadFv);
INCLUDE_ASM("main", AllOn__8CGamePadFv);
INCLUDE_ASM("main", CancelAutoRepeat__8CGamePadFi);
INCLUDE_ASM("main", SetAutoRepeat__8CGamePadFiii);
INCLUDE_ASM("main", KeyLock__8CGamePadFi);
INCLUDE_ASM("main", KeyLock2__8CGamePadFi);
INCLUDE_ASM("main", GetPadOn__8CGamePadFv);
INCLUDE_ASM("main", GetPadDown__8CGamePadFv);
INCLUDE_ASM("main", GetPadUp__8CGamePadFv);
INCLUDE_ASM("main", GetRXf__8CGamePadFv);
INCLUDE_ASM("main", GetRYf__8CGamePadFv);
INCLUDE_ASM("main", GetLXf__8CGamePadFv);
INCLUDE_ASM("main", GetLYf__8CGamePadFv);
INCLUDE_ASM("main", GetLXf2__8CGamePadFv);
INCLUDE_ASM("main", GetLYf2__8CGamePadFv);
INCLUDE_ASM("main", On__8CGamePadFi);
INCLUDE_ASM("main", On2__8CGamePadFi);
INCLUDE_ASM("main", Down__8CGamePadFi);
INCLUDE_ASM("main", Down2__8CGamePadFi);
INCLUDE_ASM("main", AutoRepeatOff__8CGamePadFv);
INCLUDE_ASM("main", MenuModeOn__8CGamePadFi);
INCLUDE_ASM("main", MenuModeOff__8CGamePadFv);
INCLUDE_ASM("main", SetVibration__8CGamePadFiii);
INCLUDE_ASM("main", VibrationEnable__8CGamePadFi);
INCLUDE_ASM("main", StopVibration__8CGamePadFv);
