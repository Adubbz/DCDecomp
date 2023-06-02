.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _iSetAlarm
/* 14200 00114100 E2FF0324 */  addiu      $3, $0, -0x1E
/* 14204 00114104 0C000000 */  syscall    0
/* 14208 00114108 0800E003 */  jr         $31
/* 1420C 0011410C 00000000 */   nop
