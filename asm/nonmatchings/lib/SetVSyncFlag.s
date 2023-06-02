.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetVSyncFlag
/* 14790 00114690 73000324 */  addiu      $3, $0, 0x73
/* 14794 00114694 0C000000 */  syscall    0
/* 14798 00114698 0800E003 */  jr         $31
/* 1479C 0011469C 00000000 */   nop
