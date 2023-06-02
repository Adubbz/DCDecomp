.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iEnableDmacHandler
/* 14630 00114530 A2FF0324 */  addiu      $3, $0, -0x5E
/* 14634 00114534 0C000000 */  syscall    0
/* 14638 00114538 0800E003 */  jr         $31
/* 1463C 0011453C 00000000 */   nop
