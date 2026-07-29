.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FadeInit__9CDispCtrlFf
/* 03E750 0013E650 00008CE4 */  swc1        $f12, 0x0($4)
/* 03E754 0013E654 FFFF0324 */  addiu       $3, $0, -0x1
/* 03E758 0013E658 080083AC */  sw          $3, 0x8($4)
/* 03E75C 0013E65C 0800E003 */  jr          $31
/* 03E760 0013E660 00000000 */   nop
/* 03E764 0013E664 00000000 */  nop
/* 03E768 0013E668 00000000 */  nop
/* 03E76C 0013E66C 00000000 */  nop
