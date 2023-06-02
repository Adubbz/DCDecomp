.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_NOW_TIME__FP12RS_STACKDATAi
/* 906F0 001905F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 906F4 001905F4 1000BF7F */  sq         $31, 0x10($sp)
/* 906F8 001905F8 0000B07F */  sq         $16, 0x0($sp)
/* 906FC 001905FC 28868070 */  paddub     $16, $4, $0
/* 90700 00190600 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 90704 00190604 F0D32CC4 */  lwc1       $f12, -0x2C10($at)
/* 90708 00190608 981F060C */  jal        EdGetTime__Ff
/* 9070C 0019060C 00000000 */   nop
/* 90710 00190610 282E4070 */  paddub     $5, $2, $0
/* 90714 00190614 28260072 */  paddub     $4, $16, $0
/* 90718 00190618 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 9071C 0019061C 00000000 */   nop
/* 90720 00190620 01000224 */  addiu      $2, $0, 0x1
/* 90724 00190624 1000BF7B */  lq         $31, 0x10($sp)
/* 90728 00190628 0000B07B */  lq         $16, 0x0($sp)
/* 9072C 0019062C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 90730 00190630 0800E003 */  jr         $31
/* 90734 00190634 00000000 */   nop
/* 90738 00190638 00000000 */  nop
/* 9073C 0019063C 00000000 */  nop
