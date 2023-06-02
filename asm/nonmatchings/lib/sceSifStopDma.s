.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifStopDma
/* 146F0 001145F0 6B000324 */  addiu      $3, $0, 0x6B
/* 146F4 001145F4 0C000000 */  syscall    0
/* 146F8 001145F8 0800E003 */  jr         $31
/* 146FC 001145FC 00000000 */   nop
