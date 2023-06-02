.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SP_INIT__FP12RS_STACKDATAi
/* 93AD0 001939D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 93AD4 001939D4 1000BF7F */  sq         $31, 0x10($sp)
/* 93AD8 001939D8 0000B07F */  sq         $16, 0x0($sp)
/* 93ADC 001939DC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 93AE0 001939E0 00000000 */   nop
/* 93AE4 001939E4 10004104 */  bgez       $2, .L00193A28
/* 93AE8 001939E8 00000000 */   nop
/* 93AEC 001939EC 28860070 */  paddub     $16, $0, $0
.L001939F0:
/* 93AF0 001939F0 28260072 */  paddub     $4, $16, $0
/* 93AF4 001939F4 5428060C */  jal        GetSprite__Fi
/* 93AF8 001939F8 00000000 */   nop
/* 93AFC 001939FC 07004010 */  beqz       $2, .L00193A1C
/* 93B00 00193A00 00000000 */   nop
/* 93B04 00193A04 28264070 */  paddub     $4, $2, $0
/* 93B08 00193A08 6428060C */  jal        InitSprite__FP9ED_SPRITE
/* 93B0C 00193A0C 00000000 */   nop
/* 93B10 00193A10 01001026 */  addiu      $16, $16, 0x1
/* 93B14 00193A14 F6FF0010 */  b          .L001939F0
/* 93B18 00193A18 00000000 */   nop
.L00193A1C:
/* 93B1C 00193A1C 01000224 */  addiu      $2, $0, 0x1
/* 93B20 00193A20 0D000010 */  b          .L00193A58
/* 93B24 00193A24 00000000 */   nop
.L00193A28:
/* 93B28 00193A28 28264070 */  paddub     $4, $2, $0
/* 93B2C 00193A2C 5428060C */  jal        GetSprite__Fi
/* 93B30 00193A30 00000000 */   nop
/* 93B34 00193A34 04004014 */  bnez       $2, .L00193A48
/* 93B38 00193A38 00000000 */   nop
/* 93B3C 00193A3C 28160070 */  paddub     $2, $0, $0
/* 93B40 00193A40 05000010 */  b          .L00193A58
/* 93B44 00193A44 00000000 */   nop
.L00193A48:
/* 93B48 00193A48 28264070 */  paddub     $4, $2, $0
/* 93B4C 00193A4C 6428060C */  jal        InitSprite__FP9ED_SPRITE
/* 93B50 00193A50 00000000 */   nop
/* 93B54 00193A54 01000224 */  addiu      $2, $0, 0x1
.L00193A58:
/* 93B58 00193A58 1000BF7B */  lq         $31, 0x10($sp)
/* 93B5C 00193A5C 0000B07B */  lq         $16, 0x0($sp)
/* 93B60 00193A60 2000BD27 */  addiu      $sp, $sp, 0x20
/* 93B64 00193A64 0800E003 */  jr         $31
/* 93B68 00193A68 00000000 */   nop
/* 93B6C 00193A6C 00000000 */  nop
