.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_NOW_TIME__FP12RS_STACKDATAi
/* 0906F0 001905F0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0906F4 001905F4 1000BF7F */  sq          $31, 0x10($29)
/* 0906F8 001905F8 0000B07F */  sq          $16, 0x0($29)
/* 0906FC 001905FC 28868070 */  paddub      $16, $4, $0
/* 090700 00190600 D401013C */  lui         $1, %hi(EdEventInfo + 0x220)
/* 090704 00190604 F0D32CC4 */  lwc1        $f12, %lo(EdEventInfo + 0x220)($1)
/* 090708 00190608 981F060C */  jal         EdGetTime__Ff
/* 09070C 0019060C 00000000 */   nop
/* 090710 00190610 282E4070 */  paddub      $5, $2, $0
/* 090714 00190614 28260072 */  paddub      $4, $16, $0
/* 090718 00190618 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 09071C 0019061C 00000000 */   nop
/* 090720 00190620 01000224 */  addiu       $2, $0, 0x1
/* 090724 00190624 1000BF7B */  lq          $31, 0x10($29)
/* 090728 00190628 0000B07B */  lq          $16, 0x0($29)
/* 09072C 0019062C 2000BD27 */  addiu       $29, $29, 0x20
/* 090730 00190630 0800E003 */  jr          $31
/* 090734 00190634 00000000 */   nop
/* 090738 00190638 00000000 */  nop
/* 09073C 0019063C 00000000 */  nop
