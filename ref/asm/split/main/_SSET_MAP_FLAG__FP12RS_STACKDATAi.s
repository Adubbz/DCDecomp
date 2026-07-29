.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SSET_MAP_FLAG__FP12RS_STACKDATAi
/* 095260 00195160 D0FFBD27 */  addiu       $29, $29, -0x30
/* 095264 00195164 2000BF7F */  sq          $31, 0x20($29)
/* 095268 00195168 1000B17F */  sq          $17, 0x10($29)
/* 09526C 0019516C 0000B07F */  sq          $16, 0x0($29)
/* 095270 00195170 08009124 */  addiu       $17, $4, 0x8
/* 095274 00195174 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 095278 00195178 00000000 */   nop
/* 09527C 0019517C 28864070 */  paddub      $16, $2, $0
/* 095280 00195180 28262072 */  paddub      $4, $17, $0
/* 095284 00195184 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 095288 00195188 00000000 */   nop
/* 09528C 0019518C 2B100200 */  sltu        $2, $0, $2
/* 095290 00195190 01004238 */  xori        $2, $2, 0x1
/* 095294 00195194 FF004530 */  andi        $5, $2, 0xFF
/* 095298 00195198 28260072 */  paddub      $4, $16, $0
/* 09529C 0019519C 24E0050C */  jal         EdSetMapFlag__Fii
/* 0952A0 001951A0 00000000 */   nop
/* 0952A4 001951A4 01000224 */  addiu       $2, $0, 0x1
/* 0952A8 001951A8 2000BF7B */  lq          $31, 0x20($29)
/* 0952AC 001951AC 1000B17B */  lq          $17, 0x10($29)
/* 0952B0 001951B0 0000B07B */  lq          $16, 0x0($29)
/* 0952B4 001951B4 3000BD27 */  addiu       $29, $29, 0x30
/* 0952B8 001951B8 0800E003 */  jr          $31
/* 0952BC 001951BC 00000000 */   nop
