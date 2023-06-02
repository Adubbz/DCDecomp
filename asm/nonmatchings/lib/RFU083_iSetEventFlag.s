.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU083_iSetEventFlag
/* 14550 00114450 ADFF0324 */  addiu      $3, $0, -0x53
/* 14554 00114454 0C000000 */  syscall    0
/* 14558 00114458 0800E003 */  jr         $31
/* 1455C 0011445C 00000000 */   nop
