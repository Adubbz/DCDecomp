.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetAngleSoon__13CCameraFollowFf
/* 24C30 00124B30 D8028CE4 */  swc1       $f12, 0x2D8($4)
/* 24C34 00124B34 DC028CE4 */  swc1       $f12, 0x2DC($4)
/* 24C38 00124B38 0800E003 */  jr         $31
/* 24C3C 00124B3C 00000000 */   nop
