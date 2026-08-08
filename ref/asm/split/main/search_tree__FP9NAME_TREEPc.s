.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
jlabel search_tree__FP9NAME_TREEPc
/* 03EFF0 0013EEF0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 03EFF4 0013EEF4 2000BF7F */  sq          $31, 0x20($29)
/* 03EFF8 0013EEF8 1000B17F */  sq          $17, 0x10($29)
/* 03EFFC 0013EEFC 0000B07F */  sq          $16, 0x0($29)
/* 03F000 0013EF00 288E8070 */  paddub      $17, $4, $0
/* 03F004 0013EF04 2886A070 */  paddub      $16, $5, $0
/* 03F008 0013EF08 0000848C */  lw          $4, 0x0($4)
/* 03F00C 0013EF0C 8E14040C */  jal         strcasecmp
/* 03F010 0013EF10 00000000 */   nop
/* 03F014 0013EF14 04004014 */  bnez        $2, .L0013EF28
/* 03F018 0013EF18 00000000 */   nop
/* 03F01C 0013EF1C 28162072 */  paddub      $2, $17, $0
/* 03F020 0013EF20 11000010 */  b           .L0013EF68
/* 03F024 0013EF24 00000000 */   nop
.L0013EF28:
/* 03F028 0013EF28 0800318E */  lw          $17, 0x8($17)
/* 03F02C 0013EF2C 0B000010 */  b           .L0013EF5C
/* 03F030 0013EF30 00000000 */   nop
.L0013EF34:
/* 03F034 0013EF34 28262072 */  paddub      $4, $17, $0
/* 03F038 0013EF38 282E0072 */  paddub      $5, $16, $0
/* 03F03C 0013EF3C BCFB040C */  jal         search_tree__FP9NAME_TREEPc
/* 03F040 0013EF40 00000000 */   nop
/* 03F044 0013EF44 03004010 */  beqz        $2, .L0013EF54
/* 03F048 0013EF48 00000000 */   nop
/* 03F04C 0013EF4C 06000010 */  b           .L0013EF68
/* 03F050 0013EF50 00000000 */   nop
.L0013EF54:
/* 03F054 0013EF54 0C00318E */  lw          $17, 0xC($17)
/* 03F058 0013EF58 00000000 */  nop
.L0013EF5C:
/* 03F05C 0013EF5C F5FF2016 */  bnez        $17, .L0013EF34
/* 03F060 0013EF60 00000000 */   nop
/* 03F064 0013EF64 28160070 */  paddub      $2, $0, $0
.L0013EF68:
/* 03F068 0013EF68 2000BF7B */  lq          $31, 0x20($29)
/* 03F06C 0013EF6C 1000B17B */  lq          $17, 0x10($29)
/* 03F070 0013EF70 0000B07B */  lq          $16, 0x0($29)
/* 03F074 0013EF74 3000BD27 */  addiu       $29, $29, 0x30
/* 03F078 0013EF78 0800E003 */  jr          $31
/* 03F07C 0013EF7C 00000000 */   nop
