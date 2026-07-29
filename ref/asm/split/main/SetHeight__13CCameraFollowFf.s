.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetHeight__13CCameraFollowFf
/* 024CB0 00124BB0 D4028CE4 */  swc1        $f12, 0x2D4($4)
/* 024CB4 00124BB4 0800E003 */  jr          $31
/* 024CB8 00124BB8 00000000 */   nop
/* 024CBC 00124BBC 00000000 */  nop
