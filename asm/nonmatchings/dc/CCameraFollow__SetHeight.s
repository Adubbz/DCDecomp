.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetHeight__13CCameraFollowFf
/* 24CB0 00124BB0 D4028CE4 */  swc1       $f12, 0x2D4($4)
/* 24CB4 00124BB4 0800E003 */  jr         $31
/* 24CB8 00124BB8 00000000 */   nop
/* 24CBC 00124BBC 00000000 */  nop
