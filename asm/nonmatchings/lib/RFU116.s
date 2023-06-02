.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU116
/* 147A0 001146A0 74000324 */  addiu      $3, $0, 0x74
/* 147A4 001146A4 0C000000 */  syscall    0
/* 147A8 001146A8 0800E003 */  jr         $31
/* 147AC 001146AC 00000000 */   nop
