.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExitThread
/* 14250 00114150 23000324 */  addiu      $3, $0, 0x23
/* 14254 00114154 0C000000 */  syscall    0
/* 14258 00114158 0800E003 */  jr         $31
/* 1425C 0011415C 00000000 */   nop
