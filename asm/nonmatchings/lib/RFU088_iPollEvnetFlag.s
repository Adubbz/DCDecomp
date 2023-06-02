.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU088_iPollEvnetFlag
/* 145A0 001144A0 A8FF0324 */  addiu      $3, $0, -0x58
/* 145A4 001144A4 0C000000 */  syscall    0
/* 145A8 001144A8 0800E003 */  jr         $31
/* 145AC 001144AC 00000000 */   nop
