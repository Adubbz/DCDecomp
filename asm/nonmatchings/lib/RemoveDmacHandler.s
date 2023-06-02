.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RemoveDmacHandler
/* 14150 00114050 13000324 */  addiu      $3, $0, 0x13
/* 14154 00114054 0C000000 */  syscall    0
/* 14158 00114058 0800E003 */  jr         $31
/* 1415C 0011405C 00000000 */   nop
