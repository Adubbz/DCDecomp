.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadChara__Fv
/* 9EFC0 0019EEC0 0800E003 */  jr         $31
/* 9EFC4 0019EEC4 00000000 */   nop
/* 9EFC8 0019EEC8 00000000 */  nop
/* 9EFCC 0019EECC 00000000 */  nop
