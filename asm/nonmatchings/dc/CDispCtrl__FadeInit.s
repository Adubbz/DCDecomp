.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FadeInit__9CDispCtrlFf
/* 3E750 0013E650 00008CE4 */  swc1       $f12, 0x0($4)
/* 3E754 0013E654 FFFF0324 */  addiu      $3, $0, -0x1
/* 3E758 0013E658 080083AC */  sw         $3, 0x8($4)
/* 3E75C 0013E65C 0800E003 */  jr         $31
/* 3E760 0013E660 00000000 */   nop
/* 3E764 0013E664 00000000 */  nop
/* 3E768 0013E668 00000000 */  nop
/* 3E76C 0013E66C 00000000 */  nop
