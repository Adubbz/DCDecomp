.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CreateSema
/* 14420 00114320 40000324 */  addiu      $3, $0, 0x40
/* 14424 00114324 0C000000 */  syscall    0
/* 14428 00114328 0800E003 */  jr         $31
/* 1442C 0011432C 00000000 */   nop
