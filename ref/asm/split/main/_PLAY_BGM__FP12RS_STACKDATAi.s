.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _PLAY_BGM__FP12RS_STACKDATAi
/* 095DF0 00195CF0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 095DF4 00195CF4 0000BF7F */  sq          $31, 0x0($29)
/* 095DF8 00195CF8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 095DFC 00195CFC 00000000 */   nop
/* 095E00 00195D00 28264070 */  paddub      $4, $2, $0
/* 095E04 00195D04 CC66050C */  jal         SndBgmPlay__Fi
/* 095E08 00195D08 00000000 */   nop
/* 095E0C 00195D0C 01000224 */  addiu       $2, $0, 0x1
/* 095E10 00195D10 0000BF7B */  lq          $31, 0x0($29)
/* 095E14 00195D14 1000BD27 */  addiu       $29, $29, 0x10
/* 095E18 00195D18 0800E003 */  jr          $31
/* 095E1C 00195D1C 00000000 */   nop
