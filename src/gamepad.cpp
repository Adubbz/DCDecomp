#include "gamepad.hpp"

/* The game's single global gamepad instance. Deliberately has no constructor:
 * retail never calls `__ct__8CGamePadFv`, only `Init__8CGamePadFv`, so adding
 * one would emit a `.ctor` entry retail doesn't have. */
CGamePad GamePad;

INCLUDE_ASM("asm/nonmatchings/gamepad", Init__8CGamePadFv);
INCLUDE_RODATA("asm/nonmatchings/gamepad", LIT_179);
INCLUDE_ASM("asm/nonmatchings/gamepad", pad_button_read__FP10PAD_STATUSii);
INCLUDE_ASM("asm/nonmatchings/gamepad", read_pad__FP10PAD_STATUSii);
INCLUDE_ASM("asm/nonmatchings/gamepad", UpDate__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", Step__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", AxisCalibration__Fi);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetRX__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetRY__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetLX__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetLY__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetRX2__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetRY2__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetLX2__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetLY2__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", AllOn__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", CancelAutoRepeat__8CGamePadFi);
INCLUDE_ASM("asm/nonmatchings/gamepad", SetAutoRepeat__8CGamePadFiii);
INCLUDE_ASM("asm/nonmatchings/gamepad", KeyLock__8CGamePadFi);
INCLUDE_ASM("asm/nonmatchings/gamepad", KeyLock2__8CGamePadFi);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetPadOn__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetPadDown__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetPadUp__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetRXf__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetRYf__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetLXf__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetLYf__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetLXf2__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", GetLYf2__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", On__8CGamePadFi);
INCLUDE_ASM("asm/nonmatchings/gamepad", On2__8CGamePadFi);
INCLUDE_ASM("asm/nonmatchings/gamepad", Down__8CGamePadFi);
INCLUDE_ASM("asm/nonmatchings/gamepad", Down2__8CGamePadFi);
INCLUDE_ASM("asm/nonmatchings/gamepad", AutoRepeatOff__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", MenuModeOn__8CGamePadFi);
INCLUDE_ASM("asm/nonmatchings/gamepad", MenuModeOff__8CGamePadFv);
INCLUDE_ASM("asm/nonmatchings/gamepad", SetVibration__8CGamePadFiii);
INCLUDE_ASM("asm/nonmatchings/gamepad", VibrationEnable__8CGamePadFi);
INCLUDE_ASM("asm/nonmatchings/gamepad", StopVibration__8CGamePadFv);

