.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_BGM_NO__FP12RS_STACKDATAi
/* 095EF0 00195DF0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 095EF4 00195DF4 1000BF7F */  sq          $31, 0x10($29)
/* 095EF8 00195DF8 0000B07F */  sq          $16, 0x0($29)
/* 095EFC 00195DFC 28868070 */  paddub      $16, $4, $0
/* 095F00 00195E00 4467050C */  jal         SndGetBgmNo__Fv
/* 095F04 00195E04 00000000 */   nop
/* 095F08 00195E08 28260072 */  paddub      $4, $16, $0
/* 095F0C 00195E0C 282E4070 */  paddub      $5, $2, $0
/* 095F10 00195E10 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 095F14 00195E14 00000000 */   nop
/* 095F18 00195E18 01000224 */  addiu       $2, $0, 0x1
/* 095F1C 00195E1C 1000BF7B */  lq          $31, 0x10($29)
/* 095F20 00195E20 0000B07B */  lq          $16, 0x0($29)
/* 095F24 00195E24 2000BD27 */  addiu       $29, $29, 0x20
/* 095F28 00195E28 0800E003 */  jr          $31
/* 095F2C 00195E2C 00000000 */   nop
