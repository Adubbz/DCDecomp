.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iChangeThreadPriority
/* 142C0 001141C0 D6FF0324 */  addiu      $3, $0, -0x2A
/* 142C4 001141C4 0C000000 */  syscall    0
/* 142C8 001141C8 0800E003 */  jr         $31
/* 142CC 001141CC 00000000 */   nop
