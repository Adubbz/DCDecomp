.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetCPUTimer
/* 14710 00114610 6D000324 */  addiu      $3, $0, 0x6D
/* 14714 00114614 0C000000 */  syscall    0
/* 14718 00114618 0800E003 */  jr         $31
/* 1471C 0011461C 00000000 */   nop
