.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iGetCop0
/* 146C0 001145C0 99FF0324 */  addiu      $3, $0, -0x67
/* 146C4 001145C4 0C000000 */  syscall    0
/* 146C8 001145C8 0800E003 */  jr         $31
/* 146CC 001145CC 00000000 */   nop
