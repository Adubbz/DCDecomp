.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MAIN_CHR2__FP12RS_STACKDATAi
/* BCF40 001BCE40 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* BCF44 001BCE44 3000BF7F */  sq         $31, 0x30($sp)
/* BCF48 001BCE48 2000B27F */  sq         $18, 0x20($sp)
/* BCF4C 001BCE4C 1000B17F */  sq         $17, 0x10($sp)
/* BCF50 001BCE50 0000B07F */  sq         $16, 0x0($sp)
/* BCF54 001BCE54 288EA070 */  paddub     $17, $5, $0
/* BCF58 001BCE58 08009224 */  addiu      $18, $4, 0x8
/* BCF5C 001BCE5C 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCF60 001BCE60 00000000 */   nop
/* BCF64 001BCE64 28864070 */  paddub     $16, $2, $0
/* BCF68 001BCE68 28160070 */  paddub     $2, $0, $0
/* BCF6C 001BCE6C 02000324 */  addiu      $3, $0, 0x2
/* BCF70 001BCE70 04002316 */  bne        $17, $3, .L001BCE84
/* BCF74 001BCE74 00000000 */   nop
/* BCF78 001BCE78 28264072 */  paddub     $4, $18, $0
/* BCF7C 001BCE7C 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCF80 001BCE80 00000000 */   nop
.L001BCE84:
/* BCF84 001BCE84 04000006 */  bltz       $16, .L001BCE98
/* BCF88 001BCE88 00000000 */   nop
/* BCF8C 001BCE8C 0600012A */  slti       $at, $16, 0x6
/* BCF90 001BCE90 04002014 */  bnez       $at, .L001BCEA4
/* BCF94 001BCE94 00000000 */   nop
.L001BCE98:
/* BCF98 001BCE98 01000224 */  addiu      $2, $0, 0x1
/* BCF9C 001BCE9C 08000010 */  b          .L001BCEC0
/* BCFA0 001BCEA0 00000000 */   nop
.L001BCEA4:
/* BCFA4 001BCEA4 28260072 */  paddub     $4, $16, $0
/* BCFA8 001BCEA8 282E4070 */  paddub     $5, $2, $0
/* BCFAC 001BCEAC 0C44070C */  jal        selectChrUnit__Fii
/* BCFB0 001BCEB0 00000000 */   nop
/* BCFB4 001BCEB4 D501013C */  lui        $at, (0x1D567E8 >> 16)
/* BCFB8 001BCEB8 E86730AC */  sw         $16, (0x1D567E8 & 0xFFFF)($at)
/* BCFBC 001BCEBC 01000224 */  addiu      $2, $0, 0x1
.L001BCEC0:
/* BCFC0 001BCEC0 3000BF7B */  lq         $31, 0x30($sp)
/* BCFC4 001BCEC4 2000B27B */  lq         $18, 0x20($sp)
/* BCFC8 001BCEC8 1000B17B */  lq         $17, 0x10($sp)
/* BCFCC 001BCECC 0000B07B */  lq         $16, 0x0($sp)
/* BCFD0 001BCED0 4000BD27 */  addiu      $sp, $sp, 0x40
/* BCFD4 001BCED4 0800E003 */  jr         $31
/* BCFD8 001BCED8 00000000 */   nop
/* BCFDC 001BCEDC 00000000 */  nop
