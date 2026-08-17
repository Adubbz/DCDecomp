#include "common.h"

/* Battle item handling: treasure boxes, pickups and thrown items. */

INCLUDE_ASM("asm/nonmatchings/btitem", selectChrUnit__Fii);
INCLUDE_ASM("asm/nonmatchings/btitem", LoadActiveItemIcon__Fv);
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetTreasureboxBig_Init__Fv);
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetTreasureboxBig_Loop__Fv);
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetTreasureboxSmall_Init__Fi);
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetTreasureboxSmall_Loop__Fv);
INCLUDE_ASM("asm/nonmatchings/btitem", BtAtraGetShort_Init__Fv);
INCLUDE_ASM("asm/nonmatchings/btitem", BtAtraGetShort_Loop__Fii);
INCLUDE_ASM("asm/nonmatchings/btitem", BtMiniChrSelect_Init__Fi);
INCLUDE_ASM("asm/nonmatchings/btitem", BtMiniChrSelect_Loop__Fv);
INCLUDE_ASM("asm/nonmatchings/btitem", BtMiniItemSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/btitem", BtMiniItemSelect_Loop__Fv);
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetGateKey_Init__Fi);
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetGateKey_Loop__Fv);
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetAttach_Init__Fii);
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetAttach_Loop__Fv);
INCLUDE_ASM("asm/nonmatchings/btitem", BtEscape_Init__Fv);
INCLUDE_ASM("asm/nonmatchings/btitem", BtEscape_Loop__Fv);
INCLUDE_ASM("asm/nonmatchings/btitem", BtSetActiveItemModel__FPUi);
INCLUDE_ASM("asm/nonmatchings/btitem", ParabolicInitialVector__FPfPfPfff);
INCLUDE_ASM("asm/nonmatchings/btitem", setShotVector__FPffff);
INCLUDE_ASM("asm/nonmatchings/btitem", getCharacterVector__FPff);
INCLUDE_ASM("asm/nonmatchings/btitem", ItemThrowStep__FPfPf);
