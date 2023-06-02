.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __nw__FUiP1
/* 27C80 00127B80 2816A070 */  paddub     $2, $5, $0
/* 27C84 00127B84 0800E003 */  jr         $31
/* 27C88 00127B88 00000000 */   nop
/* 27C8C 00127B8C 00000000 */  nop
