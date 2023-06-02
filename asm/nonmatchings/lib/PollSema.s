.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PollSema
/* 14470 00114370 45000324 */  addiu      $3, $0, 0x45
/* 14474 00114374 0C000000 */  syscall    0
/* 14478 00114378 0800E003 */  jr         $31
/* 1447C 0011437C 00000000 */   nop
