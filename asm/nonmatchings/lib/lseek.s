.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel lseek
/* 14A70 00114970 0800E003 */  jr         $31
/* 14A74 00114974 FFFF0224 */   addiu     $2, $0, -0x1
