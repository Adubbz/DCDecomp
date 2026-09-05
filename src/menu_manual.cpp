#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "menu_manual.hpp"

INCLUDE_ASM("asm/nonmatchings/menu_manual", GetNowManualPartTgaNum__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_manual", GetGameFlagForManualMenu__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_manual", ManualImgLoad__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @479__2);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @480__2);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @489__2);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @496__5);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @497__5);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @498__5);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @499__4);
INCLUDE_ASM("asm/nonmatchings/menu_manual", ManualImgEnter__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @505__3);
INCLUDE_ASM("asm/nonmatchings/menu_manual", DrawPrevNextCursor__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @535);
INCLUDE_ASM("asm/nonmatchings/menu_manual", DrawManualMsg__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_manual", InitMenuManual__FPiP1);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @559__2);
INCLUDE_ASM("asm/nonmatchings/menu_manual", SetManualMsgBuffer__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_manual", @606__5);
INCLUDE_ASM("asm/nonmatchings/menu_manual", ExitManualMenu__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_manual", GetNowManualMenuMode__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_manual", MenuManualKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_manual", MenuManualDraw__Fv);
