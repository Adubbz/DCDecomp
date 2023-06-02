.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DisableCache
/* 14680 00114580 62000324 */  addiu      $3, $0, 0x62
/* 14684 00114584 0C000000 */  syscall    0
/* 14688 00114588 0800E003 */  jr         $31
/* 1468C 0011458C 00000000 */   nop
