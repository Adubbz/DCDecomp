.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU090_iReferEventFlagStatus
/* 145C0 001144C0 A6FF0324 */  addiu      $3, $0, -0x5A
/* 145C4 001144C4 0C000000 */  syscall    0
/* 145C8 001144C8 0800E003 */  jr         $31
/* 145CC 001144CC 00000000 */   nop
