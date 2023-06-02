.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iDisableDmacHandler
/* 14650 00114550 A1FF0324 */  addiu      $3, $0, -0x5F
/* 14654 00114554 0C000000 */  syscall    0
/* 14658 00114558 0800E003 */  jr         $31
/* 1465C 0011455C 00000000 */   nop
