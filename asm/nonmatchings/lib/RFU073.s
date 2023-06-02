.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU073
/* 144B0 001143B0 49000324 */  addiu      $3, $0, 0x49
/* 144B4 001143B4 0C000000 */  syscall    0
/* 144B8 001143B8 0800E003 */  jr         $31
/* 144BC 001143BC 00000000 */   nop
