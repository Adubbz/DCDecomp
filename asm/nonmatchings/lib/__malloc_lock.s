.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __malloc_lock
/* 3728 00103628 0800E003 */  jr         $31
/* 372C 0010362C 00000000 */   nop
