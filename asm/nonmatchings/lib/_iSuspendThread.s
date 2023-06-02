.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _iSuspendThread
/* 143A0 001142A0 C8FF0324 */  addiu      $3, $0, -0x38
/* 143A4 001142A4 0C000000 */  syscall    0
/* 143A8 001142A8 0800E003 */  jr         $31
/* 143AC 001142AC 00000000 */   nop
