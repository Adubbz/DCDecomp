.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ReleaseWaitThread
/* 142F0 001141F0 2D000324 */  addiu      $3, $0, 0x2D
/* 142F4 001141F4 0C000000 */  syscall    0
/* 142F8 001141F8 0800E003 */  jr         $31
/* 142FC 001141FC 00000000 */   nop
