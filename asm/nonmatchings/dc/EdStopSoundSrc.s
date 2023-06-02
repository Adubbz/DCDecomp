.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdStopSoundSrc__Fv
/* 71BD0 00171AD0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 71BD4 00171AD4 2000BF7F */  sq         $31, 0x20($sp)
/* 71BD8 00171AD8 1000B17F */  sq         $17, 0x10($sp)
/* 71BDC 00171ADC 0000B07F */  sq         $16, 0x0($sp)
/* 71BE0 00171AE0 28860070 */  paddub     $16, $0, $0
/* 71BE4 00171AE4 0E000010 */  b          .L00171B20
/* 71BE8 00171AE8 00000000 */   nop
.L00171AEC:
/* 71BEC 00171AEC 80181000 */  sll        $3, $16, 2
/* 71BF0 00171AF0 D201023C */  lui        $2, %hi(now_play_se)
/* 71BF4 00171AF4 40994224 */  addiu      $2, $2, %lo(now_play_se)
/* 71BF8 00171AF8 21884300 */  addu       $17, $2, $3
/* 71BFC 00171AFC 0000248E */  lw         $4, 0x0($17)
/* 71C00 00171B00 06008004 */  bltz       $4, .L00171B1C
/* 71C04 00171B04 00000000 */   nop
/* 71C08 00171B08 282E0070 */  paddub     $5, $0, $0
/* 71C0C 00171B0C 2C6A050C */  jal        SndSeStop__Fii
/* 71C10 00171B10 00000000 */   nop
/* 71C14 00171B14 FFFF0224 */  addiu      $2, $0, -0x1
/* 71C18 00171B18 000022AE */  sw         $2, 0x0($17)
.L00171B1C:
/* 71C1C 00171B1C 01001026 */  addiu      $16, $16, 0x1
.L00171B20:
/* 71C20 00171B20 0400022A */  slti       $2, $16, 0x4
/* 71C24 00171B24 F1FF4014 */  bnez       $2, .L00171AEC
/* 71C28 00171B28 00000000 */   nop
/* 71C2C 00171B2C 36000424 */  addiu      $4, $0, 0x36
/* 71C30 00171B30 282E0070 */  paddub     $5, $0, $0
/* 71C34 00171B34 2C6A050C */  jal        SndSeStop__Fii
/* 71C38 00171B38 00000000 */   nop
/* 71C3C 00171B3C 34000424 */  addiu      $4, $0, 0x34
/* 71C40 00171B40 282E0070 */  paddub     $5, $0, $0
/* 71C44 00171B44 2C6A050C */  jal        SndSeStop__Fii
/* 71C48 00171B48 00000000 */   nop
/* 71C4C 00171B4C 2000BF7B */  lq         $31, 0x20($sp)
/* 71C50 00171B50 1000B17B */  lq         $17, 0x10($sp)
/* 71C54 00171B54 0000B07B */  lq         $16, 0x0($sp)
/* 71C58 00171B58 3000BD27 */  addiu      $sp, $sp, 0x30
/* 71C5C 00171B5C 0800E003 */  jr         $31
/* 71C60 00171B60 00000000 */   nop
/* 71C64 00171B64 00000000 */  nop
/* 71C68 00171B68 00000000 */  nop
/* 71C6C 00171B6C 00000000 */  nop
