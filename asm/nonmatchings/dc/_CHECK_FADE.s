.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CHECK_FADE__FP12RS_STACKDATAi
/* 92F00 00192E00 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 92F04 00192E04 1000BF7F */  sq         $31, 0x10($sp)
/* 92F08 00192E08 0000B07F */  sq         $16, 0x0($sp)
/* 92F0C 00192E0C 28868070 */  paddub     $16, $4, $0
/* 92F10 00192E10 0400A01C */  bgtz       $5, .L00192E24
/* 92F14 00192E14 00000000 */   nop
/* 92F18 00192E18 28160070 */  paddub     $2, $0, $0
/* 92F1C 00192E1C 08000010 */  b          .L00192E40
/* 92F20 00192E20 00000000 */   nop
.L00192E24:
/* 92F24 00192E24 0426060C */  jal        EdFadeOutCheck__Fv
/* 92F28 00192E28 00000000 */   nop
/* 92F2C 00192E2C 28260072 */  paddub     $4, $16, $0
/* 92F30 00192E30 282E4070 */  paddub     $5, $2, $0
/* 92F34 00192E34 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 92F38 00192E38 00000000 */   nop
/* 92F3C 00192E3C 01000224 */  addiu      $2, $0, 0x1
.L00192E40:
/* 92F40 00192E40 1000BF7B */  lq         $31, 0x10($sp)
/* 92F44 00192E44 0000B07B */  lq         $16, 0x0($sp)
/* 92F48 00192E48 2000BD27 */  addiu      $sp, $sp, 0x20
/* 92F4C 00192E4C 0800E003 */  jr         $31
/* 92F50 00192E50 00000000 */   nop
/* 92F54 00192E54 00000000 */  nop
/* 92F58 00192E58 00000000 */  nop
/* 92F5C 00192E5C 00000000 */  nop
