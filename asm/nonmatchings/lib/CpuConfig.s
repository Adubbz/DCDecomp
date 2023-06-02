.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CpuConfig
/* 146B0 001145B0 66000324 */  addiu      $3, $0, 0x66
/* 146B4 001145B4 0C000000 */  syscall    0
/* 146B8 001145B8 0800E003 */  jr         $31
/* 146BC 001145BC 00000000 */   nop
