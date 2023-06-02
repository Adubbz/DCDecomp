.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __malloc_unlock
/* 3730 00103630 0800E003 */  jr         $31
/* 3734 00103634 00000000 */   nop
