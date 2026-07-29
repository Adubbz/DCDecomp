.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FadeInStart__9CDispCtrlFf
/* 03E730 0013E630 04008CE4 */  swc1        $f12, 0x4($4)
/* 03E734 0013E634 0043033C */  lui         $3, (0x43000000 >> 16)
/* 03E738 0013E638 000083AC */  sw          $3, 0x0($4)
/* 03E73C 0013E63C 02000324 */  addiu       $3, $0, 0x2
/* 03E740 0013E640 080083AC */  sw          $3, 0x8($4)
/* 03E744 0013E644 0800E003 */  jr          $31
/* 03E748 0013E648 00000000 */   nop
/* 03E74C 0013E64C 00000000 */  nop
