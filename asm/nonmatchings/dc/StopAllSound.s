.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StopAllSound__Fv
/* 77850 00177750 0800E003 */  jr         $31
/* 77854 00177754 00000000 */   nop
/* 77858 00177758 00000000 */  nop
/* 7785C 0017775C 00000000 */  nop
