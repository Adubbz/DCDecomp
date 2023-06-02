.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Interrupt2Iop
/* 140C0 00113FC0 0C000324 */  addiu      $3, $0, 0xC
/* 140C4 00113FC4 0C000000 */  syscall    0
/* 140C8 00113FC8 0800E003 */  jr         $31
/* 140CC 00113FCC 00000000 */   nop
