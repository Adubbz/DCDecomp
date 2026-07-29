.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdStopSoundSrc__Fv
/* 071BD0 00171AD0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 071BD4 00171AD4 2000BF7F */  sq          $31, 0x20($29)
/* 071BD8 00171AD8 1000B17F */  sq          $17, 0x10($29)
/* 071BDC 00171ADC 0000B07F */  sq          $16, 0x0($29)
/* 071BE0 00171AE0 28860070 */  paddub      $16, $0, $0
/* 071BE4 00171AE4 0E000010 */  b           .L00171B20
/* 071BE8 00171AE8 00000000 */   nop
.L00171AEC:
/* 071BEC 00171AEC 80181000 */  sll         $3, $16, 2
/* 071BF0 00171AF0 D201023C */  lui         $2, %hi(now_play_se)
/* 071BF4 00171AF4 40994224 */  addiu       $2, $2, %lo(now_play_se)
/* 071BF8 00171AF8 21884300 */  addu        $17, $2, $3
/* 071BFC 00171AFC 0000248E */  lw          $4, 0x0($17)
/* 071C00 00171B00 06008004 */  bltz        $4, .L00171B1C
/* 071C04 00171B04 00000000 */   nop
/* 071C08 00171B08 282E0070 */  paddub      $5, $0, $0
/* 071C0C 00171B0C 2C6A050C */  jal         SndSeStop__Fii
/* 071C10 00171B10 00000000 */   nop
/* 071C14 00171B14 FFFF0224 */  addiu       $2, $0, -0x1
/* 071C18 00171B18 000022AE */  sw          $2, 0x0($17)
.L00171B1C:
/* 071C1C 00171B1C 01001026 */  addiu       $16, $16, 0x1
.L00171B20:
/* 071C20 00171B20 0400022A */  slti        $2, $16, 0x4
/* 071C24 00171B24 F1FF4014 */  bnez        $2, .L00171AEC
/* 071C28 00171B28 00000000 */   nop
/* 071C2C 00171B2C 36000424 */  addiu       $4, $0, 0x36
/* 071C30 00171B30 282E0070 */  paddub      $5, $0, $0
/* 071C34 00171B34 2C6A050C */  jal         SndSeStop__Fii
/* 071C38 00171B38 00000000 */   nop
/* 071C3C 00171B3C 34000424 */  addiu       $4, $0, 0x34
/* 071C40 00171B40 282E0070 */  paddub      $5, $0, $0
/* 071C44 00171B44 2C6A050C */  jal         SndSeStop__Fii
/* 071C48 00171B48 00000000 */   nop
/* 071C4C 00171B4C 2000BF7B */  lq          $31, 0x20($29)
/* 071C50 00171B50 1000B17B */  lq          $17, 0x10($29)
/* 071C54 00171B54 0000B07B */  lq          $16, 0x0($29)
/* 071C58 00171B58 3000BD27 */  addiu       $29, $29, 0x30
/* 071C5C 00171B5C 0800E003 */  jr          $31
/* 071C60 00171B60 00000000 */   nop
/* 071C64 00171B64 00000000 */  nop
/* 071C68 00171B68 00000000 */  nop
/* 071C6C 00171B6C 00000000 */  nop
