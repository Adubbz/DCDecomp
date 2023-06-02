.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifDmaStat
/* 147C0 001146C0 76000324 */  addiu      $3, $0, 0x76
/* 147C4 001146C4 0C000000 */  syscall    0
/* 147C8 001146C8 0800E003 */  jr         $31
/* 147CC 001146CC 00000000 */   nop
