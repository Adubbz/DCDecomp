.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iFlushCache
/* 146D0 001145D0 98FF0324 */  addiu      $3, $0, -0x68
/* 146D4 001145D4 0C000000 */  syscall    0
/* 146D8 001145D8 0800E003 */  jr         $31
/* 146DC 001145DC 00000000 */   nop
