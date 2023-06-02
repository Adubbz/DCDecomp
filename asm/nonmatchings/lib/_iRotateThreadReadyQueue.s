.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _iRotateThreadReadyQueue
/* 142E0 001141E0 D4FF0324 */  addiu      $3, $0, -0x2C
/* 142E4 001141E4 0C000000 */  syscall    0
/* 142E8 001141E8 0800E003 */  jr         $31
/* 142EC 001141EC 00000000 */   nop
