.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU085_iClearEventFlag
/* 14570 00114470 ABFF0324 */  addiu      $3, $0, -0x55
/* 14574 00114474 0C000000 */  syscall    0
/* 14578 00114478 0800E003 */  jr         $31
/* 1457C 0011447C 00000000 */   nop
