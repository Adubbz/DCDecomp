.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AddAngle__13CCameraFollowFf
/* 024C50 00124B50 D80280C4 */  lwc1        $f0, 0x2D8($4)
/* 024C54 00124B54 00000C46 */  add.s       $f0, $f0, $f12
/* 024C58 00124B58 D80280E4 */  swc1        $f0, 0x2D8($4)
/* 024C5C 00124B5C 0800E003 */  jr          $31
/* 024C60 00124B60 00000000 */   nop
/* 024C64 00124B64 00000000 */  nop
/* 024C68 00124B68 00000000 */  nop
/* 024C6C 00124B6C 00000000 */  nop
