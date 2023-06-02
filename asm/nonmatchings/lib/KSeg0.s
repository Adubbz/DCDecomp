.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel KSeg0
/* 14660 00114560 60000324 */  addiu      $3, $0, 0x60
/* 14664 00114564 0C000000 */  syscall    0
/* 14668 00114568 0800E003 */  jr         $31
/* 1466C 0011456C 00000000 */   nop
