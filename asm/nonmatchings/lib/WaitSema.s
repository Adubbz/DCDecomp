.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WaitSema
/* 14460 00114360 44000324 */  addiu      $3, $0, 0x44
/* 14464 00114364 0C000000 */  syscall    0
/* 14468 00114368 0800E003 */  jr         $31
/* 1446C 0011436C 00000000 */   nop
