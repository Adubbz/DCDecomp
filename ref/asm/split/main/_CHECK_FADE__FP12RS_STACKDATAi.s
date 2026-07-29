.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CHECK_FADE__FP12RS_STACKDATAi
/* 092F00 00192E00 E0FFBD27 */  addiu       $29, $29, -0x20
/* 092F04 00192E04 1000BF7F */  sq          $31, 0x10($29)
/* 092F08 00192E08 0000B07F */  sq          $16, 0x0($29)
/* 092F0C 00192E0C 28868070 */  paddub      $16, $4, $0
/* 092F10 00192E10 0400A01C */  bgtz        $5, .L00192E24
/* 092F14 00192E14 00000000 */   nop
/* 092F18 00192E18 28160070 */  paddub      $2, $0, $0
/* 092F1C 00192E1C 08000010 */  b           .L00192E40
/* 092F20 00192E20 00000000 */   nop
.L00192E24:
/* 092F24 00192E24 0426060C */  jal         EdFadeOutCheck__Fv
/* 092F28 00192E28 00000000 */   nop
/* 092F2C 00192E2C 28260072 */  paddub      $4, $16, $0
/* 092F30 00192E30 282E4070 */  paddub      $5, $2, $0
/* 092F34 00192E34 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 092F38 00192E38 00000000 */   nop
/* 092F3C 00192E3C 01000224 */  addiu       $2, $0, 0x1
.L00192E40:
/* 092F40 00192E40 1000BF7B */  lq          $31, 0x10($29)
/* 092F44 00192E44 0000B07B */  lq          $16, 0x0($29)
/* 092F48 00192E48 2000BD27 */  addiu       $29, $29, 0x20
/* 092F4C 00192E4C 0800E003 */  jr          $31
/* 092F50 00192E50 00000000 */   nop
/* 092F54 00192E54 00000000 */  nop
/* 092F58 00192E58 00000000 */  nop
/* 092F5C 00192E5C 00000000 */  nop
