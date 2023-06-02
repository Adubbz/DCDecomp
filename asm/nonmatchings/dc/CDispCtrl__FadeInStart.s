.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FadeInStart__9CDispCtrlFf
/* 3E730 0013E630 04008CE4 */  swc1       $f12, 0x4($4)
/* 3E734 0013E634 0043033C */  lui        $3, (0x43000000 >> 16)
/* 3E738 0013E638 000083AC */  sw         $3, 0x0($4)
/* 3E73C 0013E63C 02000324 */  addiu      $3, $0, 0x2
/* 3E740 0013E640 080083AC */  sw         $3, 0x8($4)
/* 3E744 0013E644 0800E003 */  jr         $31
/* 3E748 0013E648 00000000 */   nop
/* 3E74C 0013E64C 00000000 */  nop
