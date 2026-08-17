#include "common.h"

/* The per-character special-attack key handlers (Toan, Ungaga, Goro) and the
 * language-setting screen. */

INCLUDE_ASM("asm/nonmatchings/charakey", LoadFish__FP5CFishiiP14CDataAlloc2_1_i);
INCLUDE_ASM("asm/nonmatchings/charakey", GetFishFileName__Fi);
INCLUDE_ASM("asm/nonmatchings/charakey", sound_play__Ffffi);
INCLUDE_ASM("asm/nonmatchings/charakey", basic_damage__Fii);
INCLUDE_ASM("asm/nonmatchings/charakey", ToanKey_On__Fv);
INCLUDE_ASM("asm/nonmatchings/charakey", ToanKey_Play__Fv);
INCLUDE_ASM("asm/nonmatchings/charakey", UngagaKey_On__Fv);
INCLUDE_ASM("asm/nonmatchings/charakey", UngagaKey_Play__Fv);
INCLUDE_ASM("asm/nonmatchings/charakey", GoroKey_On__Fv);
INCLUDE_ASM("asm/nonmatchings/charakey", GoroKey_Play__Fv);
INCLUDE_ASM("asm/nonmatchings/charakey", LangsetInit__Fv);
INCLUDE_ASM("asm/nonmatchings/charakey", LangsetLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/charakey", LangsetProc__Fv);
INCLUDE_ASM("asm/nonmatchings/charakey", LangsetDraw__Fv);
