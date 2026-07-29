.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SearchFile__FPc
/* 03EA80 0013E980 E0FEBD27 */  addiu       $29, $29, -0x120
/* 03EA84 0013E984 1000BF7F */  sq          $31, 0x10($29)
/* 03EA88 0013E988 0000B07F */  sq          $16, 0x0($29)
/* 03EA8C 0013E98C 28868070 */  paddub      $16, $4, $0
/* 03EA90 0013E990 2000A527 */  addiu       $5, $29, 0x20
/* 03EA94 0013E994 FC8C848F */  lw          $4, -0x7304($28)
/* 03EA98 0013E998 17000010 */  b           .L0013E9F8
/* 03EA9C 0013E99C 00000000 */   nop
.L0013E9A0:
/* 03EAA0 0013E9A0 3C1E0600 */  dsll32      $3, $6, 24
/* 03EAA4 0013E9A4 3F1E0300 */  dsra32      $3, $3, 24
/* 03EAA8 0013E9A8 2F000224 */  addiu       $2, $0, 0x2F
/* 03EAAC 0013E9AC 0F006214 */  bne         $3, $2, .L0013E9EC
/* 03EAB0 0013E9B0 00000000 */   nop
/* 03EAB4 0013E9B4 0000A0A0 */  sb          $0, 0x0($5)
/* 03EAB8 0013E9B8 2000A527 */  addiu       $5, $29, 0x20
/* 03EABC 0013E9BC BCFB040C */  jal         search_tree__FP9NAME_TREEPc
/* 03EAC0 0013E9C0 00000000 */   nop
/* 03EAC4 0013E9C4 28264070 */  paddub      $4, $2, $0
/* 03EAC8 0013E9C8 04008014 */  bnez        $4, .L0013E9DC
/* 03EACC 0013E9CC 00000000 */   nop
/* 03EAD0 0013E9D0 28160070 */  paddub      $2, $0, $0
/* 03EAD4 0013E9D4 17000010 */  b           .L0013EA34
/* 03EAD8 0013E9D8 00000000 */   nop
.L0013E9DC:
/* 03EADC 0013E9DC 01001026 */  addiu       $16, $16, 0x1
/* 03EAE0 0013E9E0 2000A527 */  addiu       $5, $29, 0x20
/* 03EAE4 0013E9E4 04000010 */  b           .L0013E9F8
/* 03EAE8 0013E9E8 00000000 */   nop
.L0013E9EC:
/* 03EAEC 0013E9EC 0000A6A0 */  sb          $6, 0x0($5)
/* 03EAF0 0013E9F0 01001026 */  addiu       $16, $16, 0x1
/* 03EAF4 0013E9F4 0100A524 */  addiu       $5, $5, 0x1
.L0013E9F8:
/* 03EAF8 0013E9F8 00000682 */  lb          $6, 0x0($16)
/* 03EAFC 0013E9FC E8FFC014 */  bnez        $6, .L0013E9A0
/* 03EB00 0013EA00 00000000 */   nop
/* 03EB04 0013EA04 0000A0A0 */  sb          $0, 0x0($5)
/* 03EB08 0013EA08 2000A527 */  addiu       $5, $29, 0x20
/* 03EB0C 0013EA0C BCFB040C */  jal         search_tree__FP9NAME_TREEPc
/* 03EB10 0013EA10 00000000 */   nop
/* 03EB14 0013EA14 28264070 */  paddub      $4, $2, $0
/* 03EB18 0013EA18 04008014 */  bnez        $4, .L0013EA2C
/* 03EB1C 0013EA1C 00000000 */   nop
/* 03EB20 0013EA20 28160070 */  paddub      $2, $0, $0
/* 03EB24 0013EA24 03000010 */  b           .L0013EA34
/* 03EB28 0013EA28 00000000 */   nop
.L0013EA2C:
/* 03EB2C 0013EA2C 0400828C */  lw          $2, 0x4($4)
/* 03EB30 0013EA30 00000000 */  nop
.L0013EA34:
/* 03EB34 0013EA34 1000BF7B */  lq          $31, 0x10($29)
/* 03EB38 0013EA38 0000B07B */  lq          $16, 0x0($29)
/* 03EB3C 0013EA3C 2001BD27 */  addiu       $29, $29, 0x120
/* 03EB40 0013EA40 0800E003 */  jr          $31
/* 03EB44 0013EA44 00000000 */   nop
/* 03EB48 0013EA48 00000000 */  nop
/* 03EB4C 0013EA4C 00000000 */  nop
