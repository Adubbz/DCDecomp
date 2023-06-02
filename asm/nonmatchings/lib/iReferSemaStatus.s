.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iReferSemaStatus
/* 144A0 001143A0 B8FF0324 */  addiu      $3, $0, -0x48
/* 144A4 001143A4 0C000000 */  syscall    0
/* 144A8 001143A8 0800E003 */  jr         $31
/* 144AC 001143AC 00000000 */   nop
