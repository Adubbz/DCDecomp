.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel getpid
/* 14B40 00114A40 0800E003 */  jr         $31
/* 14B44 00114A44 01000224 */   addiu     $2, $0, 0x1
