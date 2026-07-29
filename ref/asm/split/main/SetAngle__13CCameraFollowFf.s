.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetAngle__13CCameraFollowFf
/* 024C20 00124B20 D8028CE4 */  swc1        $f12, 0x2D8($4)
/* 024C24 00124B24 0800E003 */  jr          $31
/* 024C28 00124B28 00000000 */   nop
/* 024C2C 00124B2C 00000000 */  nop
