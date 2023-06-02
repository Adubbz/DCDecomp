.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EnableDispatchThread
/* 142A0 001141A0 28000324 */  addiu      $3, $0, 0x28
/* 142A4 001141A4 0C000000 */  syscall    0
/* 142A8 001141A8 0800E003 */  jr         $31
/* 142AC 001141AC 00000000 */   nop
