.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddIntcHandler2
/* 14110 00114010 10000324 */  addiu      $3, $0, 0x10
/* 14114 00114014 0C000000 */  syscall    0
/* 14118 00114018 0800E003 */  jr         $31
/* 1411C 0011401C 00000000 */   nop
