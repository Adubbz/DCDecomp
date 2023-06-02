.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ioctl
/* 14A68 00114968 0800E003 */  jr         $31
/* 14A6C 0011496C FFFF0224 */   addiu     $2, $0, -0x1
