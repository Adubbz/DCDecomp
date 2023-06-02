.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExecOSD
/* 14840 00114740 7B000324 */  addiu      $3, $0, 0x7B
/* 14844 00114744 0C000000 */  syscall    0
/* 14848 00114748 0800E003 */  jr         $31
/* 1484C 0011474C 00000000 */   nop
