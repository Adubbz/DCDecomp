.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetAngle__13CCameraFollowFv
/* 024C40 00124B40 DC0280C4 */  lwc1        $f0, 0x2DC($4)
/* 024C44 00124B44 0800E003 */  jr          $31
/* 024C48 00124B48 00000000 */   nop
/* 024C4C 00124B4C 00000000 */  nop
