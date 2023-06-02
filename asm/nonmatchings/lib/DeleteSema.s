.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DeleteSema
/* 14430 00114330 41000324 */  addiu      $3, $0, 0x41
/* 14434 00114334 0C000000 */  syscall    0
/* 14438 00114338 0800E003 */  jr         $31
/* 1443C 0011433C 00000000 */   nop
