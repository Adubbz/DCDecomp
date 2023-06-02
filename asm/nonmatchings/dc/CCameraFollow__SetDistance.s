.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetDistance__13CCameraFollowFf
/* 24C70 00124B70 D0028CE4 */  swc1       $f12, 0x2D0($4)
/* 24C74 00124B74 0800E003 */  jr         $31
/* 24C78 00124B78 00000000 */   nop
/* 24C7C 00124B7C 00000000 */  nop
