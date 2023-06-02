.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iResumeThread
/* 143C0 001142C0 C6FF0324 */  addiu      $3, $0, -0x3A
/* 143C4 001142C4 0C000000 */  syscall    0
/* 143C8 001142C8 0800E003 */  jr         $31
/* 143CC 001142CC 00000000 */   nop
