.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PSMode
/* 14860 00114760 7D000324 */  addiu      $3, $0, 0x7D
/* 14864 00114764 0C000000 */  syscall    0
/* 14868 00114768 0800E003 */  jr         $31
/* 1486C 0011476C 00000000 */   nop
