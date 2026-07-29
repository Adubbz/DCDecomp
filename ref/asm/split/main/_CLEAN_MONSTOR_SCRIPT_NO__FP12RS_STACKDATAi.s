.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CLEAN_MONSTOR_SCRIPT_NO__FP12RS_STACKDATAi
/* 0BCBB0 001BCAB0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0BCBB4 001BCAB4 3000BF7F */  sq          $31, 0x30($29)
/* 0BCBB8 001BCAB8 2000B27F */  sq          $18, 0x20($29)
/* 0BCBBC 001BCABC 1000B17F */  sq          $17, 0x10($29)
/* 0BCBC0 001BCAC0 0000B07F */  sq          $16, 0x0($29)
/* 0BCBC4 001BCAC4 288EA070 */  paddub      $17, $5, $0
/* 0BCBC8 001BCAC8 08009224 */  addiu       $18, $4, 0x8
/* 0BCBCC 001BCACC 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCBD0 001BCAD0 00000000 */   nop
/* 0BCBD4 001BCAD4 28864070 */  paddub      $16, $2, $0
/* 0BCBD8 001BCAD8 D501013C */  lui         $1, %hi(BtEventInfo + 0xA4)
/* 0BCBDC 001BCADC E46720AC */  sw          $0, %lo(BtEventInfo + 0xA4)($1)
/* 0BCBE0 001BCAE0 0200212A */  slti        $1, $17, 0x2
/* 0BCBE4 001BCAE4 06002014 */  bnez        $1, .L001BCB00
/* 0BCBE8 001BCAE8 00000000 */   nop
/* 0BCBEC 001BCAEC 28264072 */  paddub      $4, $18, $0
/* 0BCBF0 001BCAF0 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCBF4 001BCAF4 00000000 */   nop
/* 0BCBF8 001BCAF8 D501013C */  lui         $1, %hi(BtEventInfo + 0xA4)
/* 0BCBFC 001BCAFC E46722AC */  sw          $2, %lo(BtEventInfo + 0xA4)($1)
.L001BCB00:
/* 0BCC00 001BCB00 D501013C */  lui         $1, %hi(BtEventInfo + 0xA0)
/* 0BCC04 001BCB04 E06730AC */  sw          $16, %lo(BtEventInfo + 0xA0)($1)
/* 0BCC08 001BCB08 01000224 */  addiu       $2, $0, 0x1
/* 0BCC0C 001BCB0C 3000BF7B */  lq          $31, 0x30($29)
/* 0BCC10 001BCB10 2000B27B */  lq          $18, 0x20($29)
/* 0BCC14 001BCB14 1000B17B */  lq          $17, 0x10($29)
/* 0BCC18 001BCB18 0000B07B */  lq          $16, 0x0($29)
/* 0BCC1C 001BCB1C 4000BD27 */  addiu       $29, $29, 0x40
/* 0BCC20 001BCB20 0800E003 */  jr          $31
/* 0BCC24 001BCB24 00000000 */   nop
/* 0BCC28 001BCB28 00000000 */  nop
/* 0BCC2C 001BCB2C 00000000 */  nop
