.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iReleaseWaitThread
/* 14300 00114200 D2FF0324 */  addiu      $3, $0, -0x2E
/* 14304 00114204 0C000000 */  syscall    0
/* 14308 00114208 0800E003 */  jr         $31
/* 1430C 0011420C 00000000 */   nop
