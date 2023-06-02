.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __nwa__FUiP1
/* 27C90 00127B90 2816A070 */  paddub     $2, $5, $0
/* 27C94 00127B94 0800E003 */  jr         $31
/* 27C98 00127B98 00000000 */   nop
/* 27C9C 00127B9C 00000000 */  nop
