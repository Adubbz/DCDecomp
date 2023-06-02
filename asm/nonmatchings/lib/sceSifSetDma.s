.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifSetDma
/* 147E0 001146E0 77000324 */  addiu      $3, $0, 0x77
/* 147E4 001146E4 0C000000 */  syscall    0
/* 147E8 001146E8 0800E003 */  jr         $31
/* 147EC 001146EC 00000000 */   nop
