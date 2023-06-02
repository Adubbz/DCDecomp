.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetAngle__13CCameraFollowFf
/* 24C20 00124B20 D8028CE4 */  swc1       $f12, 0x2D8($4)
/* 24C24 00124B24 0800E003 */  jr         $31
/* 24C28 00124B28 00000000 */   nop
/* 24C2C 00124B2C 00000000 */  nop
