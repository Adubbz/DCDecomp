.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAngle__13CCameraFollowFv
/* 24C40 00124B40 DC0280C4 */  lwc1       $f0, 0x2DC($4)
/* 24C44 00124B44 0800E003 */  jr         $31
/* 24C48 00124B48 00000000 */   nop
/* 24C4C 00124B4C 00000000 */  nop
