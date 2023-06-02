.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel isatty
/* 14B20 00114A20 0800E003 */  jr         $31
/* 14B24 00114A24 01000224 */   addiu     $2, $0, 0x1
