.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _FADE_IN__FP12RS_STACKDATAi
/* 092D40 00192C40 A0FFBD27 */  addiu       $29, $29, -0x60
/* 092D44 00192C44 5000BF7F */  sq          $31, 0x50($29)
/* 092D48 00192C48 4000B47F */  sq          $20, 0x40($29)
/* 092D4C 00192C4C 3000B37F */  sq          $19, 0x30($29)
/* 092D50 00192C50 2000B27F */  sq          $18, 0x20($29)
/* 092D54 00192C54 1000B17F */  sq          $17, 0x10($29)
/* 092D58 00192C58 0000B07F */  sq          $16, 0x0($29)
/* 092D5C 00192C5C 289EA070 */  paddub      $19, $5, $0
/* 092D60 00192C60 08009424 */  addiu       $20, $4, 0x8
/* 092D64 00192C64 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 092D68 00192C68 00000000 */   nop
/* 092D6C 00192C6C 28964070 */  paddub      $18, $2, $0
/* 092D70 00192C70 28160070 */  paddub      $2, $0, $0
/* 092D74 00192C74 288E0070 */  paddub      $17, $0, $0
/* 092D78 00192C78 28860070 */  paddub      $16, $0, $0
/* 092D7C 00192C7C 04000324 */  addiu       $3, $0, 0x4
/* 092D80 00192C80 0E006316 */  bne         $19, $3, .L00192CBC
/* 092D84 00192C84 00000000 */   nop
/* 092D88 00192C88 28268072 */  paddub      $4, $20, $0
/* 092D8C 00192C8C 08009424 */  addiu       $20, $4, 0x8
/* 092D90 00192C90 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 092D94 00192C94 00000000 */   nop
/* 092D98 00192C98 28864070 */  paddub      $16, $2, $0
/* 092D9C 00192C9C 28268072 */  paddub      $4, $20, $0
/* 092DA0 00192CA0 08009424 */  addiu       $20, $4, 0x8
/* 092DA4 00192CA4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 092DA8 00192CA8 00000000 */   nop
/* 092DAC 00192CAC 288E4070 */  paddub      $17, $2, $0
/* 092DB0 00192CB0 28268072 */  paddub      $4, $20, $0
/* 092DB4 00192CB4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 092DB8 00192CB8 00000000 */   nop
.L00192CBC:
/* 092DBC 00192CBC 00009044 */  mtc1        $16, $f0
/* 092DC0 00192CC0 00000000 */  nop
/* 092DC4 00192CC4 20038046 */  cvt.s.w     $f12, $f0
/* 092DC8 00192CC8 00009144 */  mtc1        $17, $f0
/* 092DCC 00192CCC 00000000 */  nop
/* 092DD0 00192CD0 60038046 */  cvt.s.w     $f13, $f0
/* 092DD4 00192CD4 00008244 */  mtc1        $2, $f0
/* 092DD8 00192CD8 00000000 */  nop
/* 092DDC 00192CDC A0038046 */  cvt.s.w     $f14, $f0
/* 092DE0 00192CE0 28264072 */  paddub      $4, $18, $0
/* 092DE4 00192CE4 C425060C */  jal         EdFadeIn__Fifff
/* 092DE8 00192CE8 00000000 */   nop
/* 092DEC 00192CEC 01000224 */  addiu       $2, $0, 0x1
/* 092DF0 00192CF0 5000BF7B */  lq          $31, 0x50($29)
/* 092DF4 00192CF4 4000B47B */  lq          $20, 0x40($29)
/* 092DF8 00192CF8 3000B37B */  lq          $19, 0x30($29)
/* 092DFC 00192CFC 2000B27B */  lq          $18, 0x20($29)
/* 092E00 00192D00 1000B17B */  lq          $17, 0x10($29)
/* 092E04 00192D04 0000B07B */  lq          $16, 0x0($29)
/* 092E08 00192D08 6000BD27 */  addiu       $29, $29, 0x60
/* 092E0C 00192D0C 0800E003 */  jr          $31
/* 092E10 00192D10 00000000 */   nop
/* 092E14 00192D14 00000000 */  nop
/* 092E18 00192D18 00000000 */  nop
/* 092E1C 00192D1C 00000000 */  nop
