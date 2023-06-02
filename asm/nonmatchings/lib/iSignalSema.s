.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iSignalSema
/* 14450 00114350 BDFF0324 */  addiu      $3, $0, -0x43
/* 14454 00114354 0C000000 */  syscall    0
/* 14458 00114358 0800E003 */  jr         $31
/* 1445C 0011435C 00000000 */   nop
