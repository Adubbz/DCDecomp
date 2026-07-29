.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetDistance__13CCameraFollowFf
/* 024C70 00124B70 D0028CE4 */  swc1        $f12, 0x2D0($4)
/* 024C74 00124B74 0800E003 */  jr          $31
/* 024C78 00124B78 00000000 */   nop
/* 024C7C 00124B7C 00000000 */  nop
