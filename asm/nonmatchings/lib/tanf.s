.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel tanf
/* 1DA90 0011D990 00600244 */  mfc1       $2, $f12
/* 1DA94 0011D994 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1DA98 0011D998 2D204000 */  daddu      $4, $2, $0
/* 1DA9C 0011D99C FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 1DAA0 0011D9A0 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 1DAA4 0011D9A4 493F023C */  lui        $2, (0x3F490FDA >> 16)
/* 1DAA8 0011D9A8 24208300 */  and        $4, $4, $3
/* 1DAAC 0011D9AC DA0F4234 */  ori        $2, $2, (0x3F490FDA & 0xFFFF)
/* 1DAB0 0011D9B0 2A104400 */  slt        $2, $2, $4
/* 1DAB4 0011D9B4 04004014 */  bnez       $2, .L0011D9C8
/* 1DAB8 0011D9B8 1000BFFF */   sd        $31, 0x10($sp)
/* 1DABC 0011D9BC 00688044 */  mtc1       $0, $f13
/* 1DAC0 0011D9C0 10000010 */  b          .L0011DA04
/* 1DAC4 0011D9C4 01000424 */   addiu     $4, $0, 0x1
.L0011D9C8:
/* 1DAC8 0011D9C8 7F7F023C */  lui        $2, (0x7F7FFFFF >> 16)
/* 1DACC 0011D9CC FFFF4234 */  ori        $2, $2, (0x7F7FFFFF & 0xFFFF)
/* 1DAD0 0011D9D0 2A104400 */  slt        $2, $2, $4
/* 1DAD4 0011D9D4 03004010 */  beqz       $2, .L0011D9E4
/* 1DAD8 0011D9D8 00000000 */   nop
/* 1DADC 0011D9DC 0B000010 */  b          .L0011DA0C
/* 1DAE0 0011D9E0 01600C46 */   sub.s     $f0, $f12, $f12
.L0011D9E4:
/* 1DAE4 0011D9E4 346A040C */  jal        __ieee754_rem_pio2f
/* 1DAE8 0011D9E8 2D20A003 */   daddu     $4, $sp, $0
/* 1DAEC 0011D9EC 01004230 */  andi       $2, $2, 0x1
/* 1DAF0 0011D9F0 01000424 */  addiu      $4, $0, 0x1
/* 1DAF4 0011D9F4 40100200 */  sll        $2, $2, 1
/* 1DAF8 0011D9F8 0000ACC7 */  lwc1       $f12, 0x0($sp)
/* 1DAFC 0011D9FC 0400ADC7 */  lwc1       $f13, 0x4($sp)
/* 1DB00 0011DA00 23208200 */  subu       $4, $4, $2
.L0011DA04:
/* 1DB04 0011DA04 4A72040C */  jal        __kernel_tanf
/* 1DB08 0011DA08 00000000 */   nop
.L0011DA0C:
/* 1DB0C 0011DA0C 1000BFDF */  ld         $31, 0x10($sp)
/* 1DB10 0011DA10 0800E003 */  jr         $31
/* 1DB14 0011DA14 2000BD27 */   addiu     $sp, $sp, 0x20
