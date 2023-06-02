.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel NowGetGameFlagForBtlMenu__Fi
/* 10BFC0 0020BEC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 10BFC4 0020BEC4 1000BF7F */  sq         $31, 0x10($sp)
/* 10BFC8 0020BEC8 0000B07F */  sq         $16, 0x0($sp)
/* 10BFCC 0020BECC 28868070 */  paddub     $16, $4, $0
/* 10BFD0 0020BED0 01000224 */  addiu      $2, $0, 0x1
/* 10BFD4 0020BED4 08000212 */  beq        $16, $2, .L0020BEF8
/* 10BFD8 0020BED8 00000000 */   nop
/* 10BFDC 0020BEDC 05000224 */  addiu      $2, $0, 0x5
/* 10BFE0 0020BEE0 05000212 */  beq        $16, $2, .L0020BEF8
/* 10BFE4 0020BEE4 00000000 */   nop
/* 10BFE8 0020BEE8 1D000012 */  beqz       $16, .L0020BF60
/* 10BFEC 0020BEEC 00000000 */   nop
/* 10BFF0 0020BEF0 1B000010 */  b          .L0020BF60
/* 10BFF4 0020BEF4 00000000 */   nop
.L0020BEF8:
/* 10BFF8 0020BEF8 2C90838F */  lw         $3, -0x6FD4($gp)
/* 10BFFC 0020BEFC 01000224 */  addiu      $2, $0, 0x1
/* 10C000 0020BF00 04006214 */  bne        $3, $2, .L0020BF14
/* 10C004 0020BF04 00000000 */   nop
/* 10C008 0020BF08 02001024 */  addiu      $16, $0, 0x2
/* 10C00C 0020BF0C 14000010 */  b          .L0020BF60
/* 10C010 0020BF10 00000000 */   nop
.L0020BF14:
/* 10C014 0020BF14 D494828F */  lw         $2, -0x6B2C($gp)
/* 10C018 0020BF18 2043428C */  lw         $2, 0x4320($2)
/* 10C01C 0020BF1C 10004014 */  bnez       $2, .L0020BF60
/* 10C020 0020BF20 00000000 */   nop
/* 10C024 0020BF24 1C8D848F */  lw         $4, -0x72E4($gp)
/* 10C028 0020BF28 282E0070 */  paddub     $5, $0, $0
/* 10C02C 0020BF2C 28360070 */  paddub     $6, $0, $0
/* 10C030 0020BF30 1C62050C */  jal        QuestDungeon__9CSaveDataFii
/* 10C034 0020BF34 00000000 */   nop
/* 10C038 0020BF38 04004014 */  bnez       $2, .L0020BF4C
/* 10C03C 0020BF3C 00000000 */   nop
/* 10C040 0020BF40 0B001024 */  addiu      $16, $0, 0xB
/* 10C044 0020BF44 06000010 */  b          .L0020BF60
/* 10C048 0020BF48 00000000 */   nop
.L0020BF4C:
/* 10C04C 0020BF4C D494828F */  lw         $2, -0x6B2C($gp)
/* 10C050 0020BF50 2043428C */  lw         $2, 0x4320($2)
/* 10C054 0020BF54 02004014 */  bnez       $2, .L0020BF60
/* 10C058 0020BF58 00000000 */   nop
/* 10C05C 0020BF5C 0A001024 */  addiu      $16, $0, 0xA
.L0020BF60:
/* 10C060 0020BF60 28160072 */  paddub     $2, $16, $0
/* 10C064 0020BF64 1000BF7B */  lq         $31, 0x10($sp)
/* 10C068 0020BF68 0000B07B */  lq         $16, 0x0($sp)
/* 10C06C 0020BF6C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 10C070 0020BF70 0800E003 */  jr         $31
/* 10C074 0020BF74 00000000 */   nop
/* 10C078 0020BF78 00000000 */  nop
/* 10C07C 0020BF7C 00000000 */  nop
