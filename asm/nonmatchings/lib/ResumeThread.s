.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ResumeThread
/* 143B0 001142B0 39000324 */  addiu      $3, $0, 0x39
/* 143B4 001142B4 0C000000 */  syscall    0
/* 143B8 001142B8 0800E003 */  jr         $31
/* 143BC 001142BC 00000000 */   nop
