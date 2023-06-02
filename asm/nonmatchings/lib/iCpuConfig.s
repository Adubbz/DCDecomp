.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iCpuConfig
/* 146E0 001145E0 96FF0324 */  addiu      $3, $0, -0x6A
/* 146E4 001145E4 0C000000 */  syscall    0
/* 146E8 001145E8 0800E003 */  jr         $31
/* 146EC 001145EC 00000000 */   nop
