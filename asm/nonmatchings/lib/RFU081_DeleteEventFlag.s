.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU081_DeleteEventFlag
/* 14530 00114430 51000324 */  addiu      $3, $0, 0x51
/* 14534 00114434 0C000000 */  syscall    0
/* 14538 00114438 0800E003 */  jr         $31
/* 1453C 0011443C 00000000 */   nop
