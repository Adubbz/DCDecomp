.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EnableDmacHandler
/* 14620 00114520 5E000324 */  addiu      $3, $0, 0x5E
/* 14624 00114524 0C000000 */  syscall    0
/* 14628 00114528 0800E003 */  jr         $31
/* 1462C 0011452C 00000000 */   nop
