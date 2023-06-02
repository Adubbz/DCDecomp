.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetDistance__13CCameraFollowFv
/* 24C80 00124B80 D00280C4 */  lwc1       $f0, 0x2D0($4)
/* 24C84 00124B84 0800E003 */  jr         $31
/* 24C88 00124B88 00000000 */   nop
/* 24C8C 00124B8C 00000000 */  nop
