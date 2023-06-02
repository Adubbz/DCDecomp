.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ChangeThreadPriority
/* 142B0 001141B0 29000324 */  addiu      $3, $0, 0x29
/* 142B4 001141B4 0C000000 */  syscall    0
/* 142B8 001141B8 0800E003 */  jr         $31
/* 142BC 001141BC 00000000 */   nop
