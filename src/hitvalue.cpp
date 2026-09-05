#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 612

#include "hitvalue.hpp"

INCLUDE_ASM("asm/nonmatchings/hitvalue", BattleSubWeaponDmg__Ffi);
INCLUDE_ASM("asm/nonmatchings/hitvalue", HitValueEntry__FP9CHitValuePfiiP6CFrame);
INCLUDE_ASM("asm/nonmatchings/hitvalue", EntryValue__9CHitValueFPfiiP6CFrame);
INCLUDE_ASM("asm/nonmatchings/hitvalue", Draw__9CHitValueFv);
INCLUDE_RODATA("asm/nonmatchings/hitvalue", @804);
INCLUDE_RODATA("asm/nonmatchings/hitvalue", @805);
INCLUDE_RODATA("asm/nonmatchings/hitvalue", @863);
INCLUDE_ASM("asm/nonmatchings/hitvalue", Step__9CHitValueFv);
