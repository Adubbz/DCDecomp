.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AutoSetSub__6ClsMesFP10CCharacterP10CCharacterPi
/* 04D0E0 0014CFE0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 04D0E4 0014CFE4 2000BF7F */  sq          $31, 0x20($29)
/* 04D0E8 0014CFE8 1000B17F */  sq          $17, 0x10($29)
/* 04D0EC 0014CFEC 0000B07F */  sq          $16, 0x0($29)
/* 04D0F0 0014CFF0 288EC070 */  paddub      $17, $6, $0
/* 04D0F4 0014CFF4 2886E070 */  paddub      $16, $7, $0
/* 04D0F8 0014CFF8 2826A070 */  paddub      $4, $5, $0
/* 04D0FC 0014CFFC 282E0072 */  paddub      $5, $16, $0
/* 04D100 0014D000 6032050C */  jal         GetScrPosFromChar__FP10CCharacterPi
/* 04D104 0014D004 00000000 */   nop
/* 04D108 0014D008 28262072 */  paddub      $4, $17, $0
/* 04D10C 0014D00C 08000526 */  addiu       $5, $16, 0x8
/* 04D110 0014D010 6032050C */  jal         GetScrPosFromChar__FP10CCharacterPi
/* 04D114 0014D014 00000000 */   nop
/* 04D118 0014D018 2000BF7B */  lq          $31, 0x20($29)
/* 04D11C 0014D01C 1000B17B */  lq          $17, 0x10($29)
/* 04D120 0014D020 0000B07B */  lq          $16, 0x0($29)
/* 04D124 0014D024 3000BD27 */  addiu       $29, $29, 0x30
/* 04D128 0014D028 0800E003 */  jr          $31
/* 04D12C 0014D02C 00000000 */   nop
