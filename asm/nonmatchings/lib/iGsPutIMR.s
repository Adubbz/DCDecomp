.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iGsPutIMR
/* 14770 00114670 8FFF0324 */  addiu      $3, $0, -0x71
/* 14774 00114674 0C000000 */  syscall    0
/* 14778 00114678 0800E003 */  jr         $31
/* 1477C 0011467C 00000000 */   nop
