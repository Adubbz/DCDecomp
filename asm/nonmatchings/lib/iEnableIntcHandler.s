.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iEnableIntcHandler
/* 145F0 001144F0 A4FF0324 */  addiu      $3, $0, -0x5C
/* 145F4 001144F4 0C000000 */  syscall    0
/* 145F8 001144F8 0800E003 */  jr         $31
/* 145FC 001144FC 00000000 */   nop
