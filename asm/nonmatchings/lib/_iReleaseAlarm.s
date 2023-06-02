.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _iReleaseAlarm
/* 14210 00114110 E1FF0324 */  addiu      $3, $0, -0x1F
/* 14214 00114114 0C000000 */  syscall    0
/* 14218 00114118 0800E003 */  jr         $31
/* 1421C 0011411C 00000000 */   nop
