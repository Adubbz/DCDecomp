.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DeleteThread
/* 14230 00114130 21000324 */  addiu      $3, $0, 0x21
/* 14234 00114134 0C000000 */  syscall    0
/* 14238 00114138 0800E003 */  jr         $31
/* 1423C 0011413C 00000000 */   nop
