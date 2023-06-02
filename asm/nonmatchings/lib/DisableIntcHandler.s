.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DisableIntcHandler
/* 14600 00114500 5D000324 */  addiu      $3, $0, 0x5D
/* 14604 00114504 0C000000 */  syscall    0
/* 14608 00114508 0800E003 */  jr         $31
/* 1460C 0011450C 00000000 */   nop
