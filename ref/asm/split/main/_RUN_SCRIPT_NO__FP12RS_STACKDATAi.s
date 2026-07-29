.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _RUN_SCRIPT_NO__FP12RS_STACKDATAi
/* 0BCAF0 001BC9F0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0BCAF4 001BC9F4 3000BF7F */  sq          $31, 0x30($29)
/* 0BCAF8 001BC9F8 2000B27F */  sq          $18, 0x20($29)
/* 0BCAFC 001BC9FC 1000B17F */  sq          $17, 0x10($29)
/* 0BCB00 001BCA00 0000B07F */  sq          $16, 0x0($29)
/* 0BCB04 001BCA04 288EA070 */  paddub      $17, $5, $0
/* 0BCB08 001BCA08 08009224 */  addiu       $18, $4, 0x8
/* 0BCB0C 001BCA0C 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCB10 001BCA10 00000000 */   nop
/* 0BCB14 001BCA14 28864070 */  paddub      $16, $2, $0
/* 0BCB18 001BCA18 D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 0BCB1C 001BCA1C 746720AC */  sw          $0, %lo(BtEventInfo + 0x34)($1)
/* 0BCB20 001BCA20 02000224 */  addiu       $2, $0, 0x2
/* 0BCB24 001BCA24 07002216 */  bne         $17, $2, .L001BCA44
/* 0BCB28 001BCA28 00000000 */   nop
/* 0BCB2C 001BCA2C 28264072 */  paddub      $4, $18, $0
/* 0BCB30 001BCA30 08009224 */  addiu       $18, $4, 0x8
/* 0BCB34 001BCA34 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCB38 001BCA38 00000000 */   nop
/* 0BCB3C 001BCA3C D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 0BCB40 001BCA40 746722AC */  sw          $2, %lo(BtEventInfo + 0x34)($1)
.L001BCA44:
/* 0BCB44 001BCA44 03000224 */  addiu       $2, $0, 0x3
/* 0BCB48 001BCA48 0C002216 */  bne         $17, $2, .L001BCA7C
/* 0BCB4C 001BCA4C 00000000 */   nop
/* 0BCB50 001BCA50 28264072 */  paddub      $4, $18, $0
/* 0BCB54 001BCA54 08009224 */  addiu       $18, $4, 0x8
/* 0BCB58 001BCA58 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCB5C 001BCA5C 00000000 */   nop
/* 0BCB60 001BCA60 D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 0BCB64 001BCA64 746722AC */  sw          $2, %lo(BtEventInfo + 0x34)($1)
/* 0BCB68 001BCA68 28264072 */  paddub      $4, $18, $0
/* 0BCB6C 001BCA6C 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCB70 001BCA70 00000000 */   nop
/* 0BCB74 001BCA74 D501013C */  lui         $1, %hi(BtEventInfo + 0x90)
/* 0BCB78 001BCA78 D06722AC */  sw          $2, %lo(BtEventInfo + 0x90)($1)
.L001BCA7C:
/* 0BCB7C 001BCA7C 05000224 */  addiu       $2, $0, 0x5
/* 0BCB80 001BCA80 D501013C */  lui         $1, %hi(BtEventInfo + 0x98)
/* 0BCB84 001BCA84 D86722AC */  sw          $2, %lo(BtEventInfo + 0x98)($1)
/* 0BCB88 001BCA88 D501013C */  lui         $1, %hi(BtEventInfo + 0x9C)
/* 0BCB8C 001BCA8C DC6730AC */  sw          $16, %lo(BtEventInfo + 0x9C)($1)
/* 0BCB90 001BCA90 01000224 */  addiu       $2, $0, 0x1
/* 0BCB94 001BCA94 3000BF7B */  lq          $31, 0x30($29)
/* 0BCB98 001BCA98 2000B27B */  lq          $18, 0x20($29)
/* 0BCB9C 001BCA9C 1000B17B */  lq          $17, 0x10($29)
/* 0BCBA0 001BCAA0 0000B07B */  lq          $16, 0x0($29)
/* 0BCBA4 001BCAA4 4000BD27 */  addiu       $29, $29, 0x40
/* 0BCBA8 001BCAA8 0800E003 */  jr          $31
/* 0BCBAC 001BCAAC 00000000 */   nop
