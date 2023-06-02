.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU080_CreateEventFlag
/* 14520 00114420 50000324 */  addiu      $3, $0, 0x50
/* 14524 00114424 0C000000 */  syscall    0
/* 14528 00114428 0800E003 */  jr         $31
/* 1452C 0011442C 00000000 */   nop
