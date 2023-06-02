.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU061
/* 143F0 001142F0 3D000324 */  addiu      $3, $0, 0x3D
/* 143F4 001142F4 0C000000 */  syscall    0
/* 143F8 001142F8 0800E003 */  jr         $31
/* 143FC 001142FC 00000000 */   nop
