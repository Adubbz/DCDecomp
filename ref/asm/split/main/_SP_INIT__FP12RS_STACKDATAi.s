.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SP_INIT__FP12RS_STACKDATAi
/* 093AD0 001939D0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 093AD4 001939D4 1000BF7F */  sq          $31, 0x10($29)
/* 093AD8 001939D8 0000B07F */  sq          $16, 0x0($29)
/* 093ADC 001939DC D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 093AE0 001939E0 00000000 */   nop
/* 093AE4 001939E4 10004104 */  bgez        $2, .L00193A28
/* 093AE8 001939E8 00000000 */   nop
/* 093AEC 001939EC 28860070 */  paddub      $16, $0, $0
.L001939F0:
/* 093AF0 001939F0 28260072 */  paddub      $4, $16, $0
/* 093AF4 001939F4 5428060C */  jal         GetSprite__Fi
/* 093AF8 001939F8 00000000 */   nop
/* 093AFC 001939FC 07004010 */  beqz        $2, .L00193A1C
/* 093B00 00193A00 00000000 */   nop
/* 093B04 00193A04 28264070 */  paddub      $4, $2, $0
/* 093B08 00193A08 6428060C */  jal         InitSprite__FP9ED_SPRITE
/* 093B0C 00193A0C 00000000 */   nop
/* 093B10 00193A10 01001026 */  addiu       $16, $16, 0x1
/* 093B14 00193A14 F6FF0010 */  b           .L001939F0
/* 093B18 00193A18 00000000 */   nop
.L00193A1C:
/* 093B1C 00193A1C 01000224 */  addiu       $2, $0, 0x1
/* 093B20 00193A20 0D000010 */  b           .L00193A58
/* 093B24 00193A24 00000000 */   nop
.L00193A28:
/* 093B28 00193A28 28264070 */  paddub      $4, $2, $0
/* 093B2C 00193A2C 5428060C */  jal         GetSprite__Fi
/* 093B30 00193A30 00000000 */   nop
/* 093B34 00193A34 04004014 */  bnez        $2, .L00193A48
/* 093B38 00193A38 00000000 */   nop
/* 093B3C 00193A3C 28160070 */  paddub      $2, $0, $0
/* 093B40 00193A40 05000010 */  b           .L00193A58
/* 093B44 00193A44 00000000 */   nop
.L00193A48:
/* 093B48 00193A48 28264070 */  paddub      $4, $2, $0
/* 093B4C 00193A4C 6428060C */  jal         InitSprite__FP9ED_SPRITE
/* 093B50 00193A50 00000000 */   nop
/* 093B54 00193A54 01000224 */  addiu       $2, $0, 0x1
.L00193A58:
/* 093B58 00193A58 1000BF7B */  lq          $31, 0x10($29)
/* 093B5C 00193A5C 0000B07B */  lq          $16, 0x0($29)
/* 093B60 00193A60 2000BD27 */  addiu       $29, $29, 0x20
/* 093B64 00193A64 0800E003 */  jr          $31
/* 093B68 00193A68 00000000 */   nop
/* 093B6C 00193A6C 00000000 */  nop
