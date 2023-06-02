.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel close
/* 14A60 00114960 0800E003 */  jr         $31
/* 14A64 00114964 FFFF0224 */   addiu     $2, $0, -0x1
