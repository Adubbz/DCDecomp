.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ChangeDigData__9CMapPartsFv
/* 9ADE0 0019ACE0 0801858C */  lw         $5, 0x108($4)
/* 9ADE4 0019ACE4 0400A014 */  bnez       $5, .L0019ACF8
/* 9ADE8 0019ACE8 00000000 */   nop
/* 9ADEC 0019ACEC 28160070 */  paddub     $2, $0, $0
/* 9ADF0 0019ACF0 1F000010 */  b          .L0019AD70
/* 9ADF4 0019ACF4 00000000 */   nop
.L0019ACF8:
/* 9ADF8 0019ACF8 E400A68C */  lw         $6, 0xE4($5)
/* 9ADFC 0019ACFC 0400C014 */  bnez       $6, .L0019AD10
/* 9AE00 0019AD00 00000000 */   nop
/* 9AE04 0019AD04 28160070 */  paddub     $2, $0, $0
/* 9AE08 0019AD08 19000010 */  b          .L0019AD70
/* 9AE0C 0019AD0C 00000000 */   nop
.L0019AD10:
/* 9AE10 0019AD10 28260070 */  paddub     $4, $0, $0
/* 9AE14 0019AD14 0F000010 */  b          .L0019AD54
/* 9AE18 0019AD18 00000000 */   nop
.L0019AD1C:
/* 9AE1C 0019AD1C 3C00C28C */  lw         $2, 0x3C($6)
/* 9AE20 0019AD20 21104400 */  addu       $2, $2, $4
/* 9AE24 0019AD24 00004290 */  lbu        $2, 0x0($2)
/* 9AE28 0019AD28 3C1C0200 */  dsll32     $3, $2, 16
/* 9AE2C 0019AD2C 3F1C0300 */  dsra32     $3, $3, 16
/* 9AE30 0019AD30 07006010 */  beqz       $3, .L0019AD50
/* 9AE34 0019AD34 00000000 */   nop
/* 9AE38 0019AD38 81000224 */  addiu      $2, $0, 0x81
/* 9AE3C 0019AD3C 04006214 */  bne        $3, $2, .L0019AD50
/* 9AE40 0019AD40 00000000 */   nop
/* 9AE44 0019AD44 01000224 */  addiu      $2, $0, 0x1
/* 9AE48 0019AD48 09000010 */  b          .L0019AD70
/* 9AE4C 0019AD4C 00000000 */   nop
.L0019AD50:
/* 9AE50 0019AD50 01008424 */  addiu      $4, $4, 0x1
.L0019AD54:
/* 9AE54 0019AD54 1C00A38C */  lw         $3, 0x1C($5)
/* 9AE58 0019AD58 2000A28C */  lw         $2, 0x20($5)
/* 9AE5C 0019AD5C 18106200 */  mult       $2, $3, $2
/* 9AE60 0019AD60 2A108200 */  slt        $2, $4, $2
/* 9AE64 0019AD64 EDFF4014 */  bnez       $2, .L0019AD1C
/* 9AE68 0019AD68 00000000 */   nop
/* 9AE6C 0019AD6C 28160070 */  paddub     $2, $0, $0
.L0019AD70:
/* 9AE70 0019AD70 0800E003 */  jr         $31
/* 9AE74 0019AD74 00000000 */   nop
/* 9AE78 0019AD78 00000000 */  nop
/* 9AE7C 0019AD7C 00000000 */  nop
