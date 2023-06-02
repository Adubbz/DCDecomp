.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TerminateThread
/* 14270 00114170 25000324 */  addiu      $3, $0, 0x25
/* 14274 00114174 0C000000 */  syscall    0
/* 14278 00114178 0800E003 */  jr         $31
/* 1427C 0011417C 00000000 */   nop
