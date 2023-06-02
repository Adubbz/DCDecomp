.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetVTLBRefillHandler
/* 140D0 00113FD0 0D000324 */  addiu      $3, $0, 0xD
/* 140D4 00113FD4 0C000000 */  syscall    0
/* 140D8 00113FD8 0800E003 */  jr         $31
/* 140DC 00113FDC 00000000 */   nop
