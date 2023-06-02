.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel abs
/* 2C8 001001C8 02008104 */  bgez       $4, .L001001D4
/* 2CC 001001CC 2D108000 */   daddu     $2, $4, $0
/* 2D0 001001D0 23100200 */  negu       $2, $2
.L001001D4:
/* 2D4 001001D4 0800E003 */  jr         $31
/* 2D8 001001D8 00000000 */   nop
/* 2DC 001001DC 00000000 */  nop
