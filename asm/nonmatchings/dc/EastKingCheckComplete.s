.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EastKingCheckComplete__Fv
/* 10EBE0 0020EAE0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 10EBE4 0020EAE4 2000BF7F */  sq         $31, 0x20($sp)
/* 10EBE8 0020EAE8 1000B17F */  sq         $17, 0x10($sp)
/* 10EBEC 0020EAEC 0000B07F */  sq         $16, 0x0($sp)
/* 10EBF0 0020EAF0 1C8D828F */  lw         $2, -0x72E4($gp)
/* 10EBF4 0020EAF4 04004014 */  bnez       $2, .L0020EB08
/* 10EBF8 0020EAF8 00000000 */   nop
/* 10EBFC 0020EAFC 28160070 */  paddub     $2, $0, $0
/* 10EC00 0020EB00 11000010 */  b          .L0020EB48
/* 10EC04 0020EB04 00000000 */   nop
.L0020EB08:
/* 10EC08 0020EB08 01001024 */  addiu      $16, $0, 0x1
/* 10EC0C 0020EB0C 288E0070 */  paddub     $17, $0, $0
/* 10EC10 0020EB10 09000010 */  b          .L0020EB38
/* 10EC14 0020EB14 00000000 */   nop
.L0020EB18:
/* 10EC18 0020EB18 E6002526 */  addiu      $5, $17, 0xE6
/* 10EC1C 0020EB1C 1C8D848F */  lw         $4, -0x72E4($gp)
/* 10EC20 0020EB20 8060050C */  jal        GetGameFlag__9CSaveDataFi
/* 10EC24 0020EB24 00000000 */   nop
/* 10EC28 0020EB28 02004014 */  bnez       $2, .L0020EB34
/* 10EC2C 0020EB2C 00000000 */   nop
/* 10EC30 0020EB30 28860070 */  paddub     $16, $0, $0
.L0020EB34:
/* 10EC34 0020EB34 01003126 */  addiu      $17, $17, 0x1
.L0020EB38:
/* 10EC38 0020EB38 0C00222A */  slti       $2, $17, 0xC
/* 10EC3C 0020EB3C F6FF4014 */  bnez       $2, .L0020EB18
/* 10EC40 0020EB40 00000000 */   nop
/* 10EC44 0020EB44 28160072 */  paddub     $2, $16, $0
.L0020EB48:
/* 10EC48 0020EB48 2000BF7B */  lq         $31, 0x20($sp)
/* 10EC4C 0020EB4C 1000B17B */  lq         $17, 0x10($sp)
/* 10EC50 0020EB50 0000B07B */  lq         $16, 0x0($sp)
/* 10EC54 0020EB54 3000BD27 */  addiu      $sp, $sp, 0x30
/* 10EC58 0020EB58 0800E003 */  jr         $31
/* 10EC5C 0020EB5C 00000000 */   nop
