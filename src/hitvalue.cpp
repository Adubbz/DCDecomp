#include "hitvalue.hpp"

CHitValue *NowHitValue;

INCLUDE_ASM("main", BattleSubWeaponDmg__Ffi);
INCLUDE_ASM("main", HitValueEntry__FP9CHitValuePfiiP6CFrame);
INCLUDE_ASM("main", EntryValue__9CHitValueFPfiiP6CFrame);
INCLUDE_ASM("main", Draw__9CHitValueFv);
INCLUDE_ASM("main", Step__9CHitValueFv);
