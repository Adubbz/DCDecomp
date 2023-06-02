.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iTerminateThread
/* 14280 00114180 DAFF0324 */  addiu      $3, $0, -0x26
/* 14284 00114184 0C000000 */  syscall    0
/* 14288 00114188 0800E003 */  jr         $31
/* 1428C 0011418C 00000000 */   nop
