.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU089_ReferEventFlagStatus
/* 145B0 001144B0 59000324 */  addiu      $3, $0, 0x59
/* 145B4 001144B4 0C000000 */  syscall    0
/* 145B8 001144B8 0800E003 */  jr         $31
/* 145BC 001144BC 00000000 */   nop
