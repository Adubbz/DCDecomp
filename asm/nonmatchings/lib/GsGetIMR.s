.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GsGetIMR
/* 14740 00114640 70000324 */  addiu      $3, $0, 0x70
/* 14744 00114644 0C000000 */  syscall    0
/* 14748 00114648 0800E003 */  jr         $31
/* 1474C 0011464C 00000000 */   nop
