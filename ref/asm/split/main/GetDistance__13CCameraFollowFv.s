.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetDistance__13CCameraFollowFv
/* 024C80 00124B80 D00280C4 */  lwc1        $f0, 0x2D0($4)
/* 024C84 00124B84 0800E003 */  jr          $31
/* 024C88 00124B88 00000000 */   nop
/* 024C8C 00124B8C 00000000 */  nop
