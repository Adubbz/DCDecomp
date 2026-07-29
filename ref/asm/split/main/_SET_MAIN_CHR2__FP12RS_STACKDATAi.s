.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_MAIN_CHR2__FP12RS_STACKDATAi
/* 0BCF40 001BCE40 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0BCF44 001BCE44 3000BF7F */  sq          $31, 0x30($29)
/* 0BCF48 001BCE48 2000B27F */  sq          $18, 0x20($29)
/* 0BCF4C 001BCE4C 1000B17F */  sq          $17, 0x10($29)
/* 0BCF50 001BCE50 0000B07F */  sq          $16, 0x0($29)
/* 0BCF54 001BCE54 288EA070 */  paddub      $17, $5, $0
/* 0BCF58 001BCE58 08009224 */  addiu       $18, $4, 0x8
/* 0BCF5C 001BCE5C 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCF60 001BCE60 00000000 */   nop
/* 0BCF64 001BCE64 28864070 */  paddub      $16, $2, $0
/* 0BCF68 001BCE68 28160070 */  paddub      $2, $0, $0
/* 0BCF6C 001BCE6C 02000324 */  addiu       $3, $0, 0x2
/* 0BCF70 001BCE70 04002316 */  bne         $17, $3, .L001BCE84
/* 0BCF74 001BCE74 00000000 */   nop
/* 0BCF78 001BCE78 28264072 */  paddub      $4, $18, $0
/* 0BCF7C 001BCE7C 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCF80 001BCE80 00000000 */   nop
.L001BCE84:
/* 0BCF84 001BCE84 04000006 */  bltz        $16, .L001BCE98
/* 0BCF88 001BCE88 00000000 */   nop
/* 0BCF8C 001BCE8C 0600012A */  slti        $1, $16, 0x6
/* 0BCF90 001BCE90 04002014 */  bnez        $1, .L001BCEA4
/* 0BCF94 001BCE94 00000000 */   nop
.L001BCE98:
/* 0BCF98 001BCE98 01000224 */  addiu       $2, $0, 0x1
/* 0BCF9C 001BCE9C 08000010 */  b           .L001BCEC0
/* 0BCFA0 001BCEA0 00000000 */   nop
.L001BCEA4:
/* 0BCFA4 001BCEA4 28260072 */  paddub      $4, $16, $0
/* 0BCFA8 001BCEA8 282E4070 */  paddub      $5, $2, $0
/* 0BCFAC 001BCEAC 0C44070C */  jal         selectChrUnit__Fii
/* 0BCFB0 001BCEB0 00000000 */   nop
/* 0BCFB4 001BCEB4 D501013C */  lui         $1, %hi(BtEventInfo + 0xA8)
/* 0BCFB8 001BCEB8 E86730AC */  sw          $16, %lo(BtEventInfo + 0xA8)($1)
/* 0BCFBC 001BCEBC 01000224 */  addiu       $2, $0, 0x1
.L001BCEC0:
/* 0BCFC0 001BCEC0 3000BF7B */  lq          $31, 0x30($29)
/* 0BCFC4 001BCEC4 2000B27B */  lq          $18, 0x20($29)
/* 0BCFC8 001BCEC8 1000B17B */  lq          $17, 0x10($29)
/* 0BCFCC 001BCECC 0000B07B */  lq          $16, 0x0($29)
/* 0BCFD0 001BCED0 4000BD27 */  addiu       $29, $29, 0x40
/* 0BCFD4 001BCED4 0800E003 */  jr          $31
/* 0BCFD8 001BCED8 00000000 */   nop
/* 0BCFDC 001BCEDC 00000000 */  nop
