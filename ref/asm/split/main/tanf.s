.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel tanf
/* 01DA90 0011D990 00600244 */  mfc1        $2, $f12
/* 01DA94 0011D994 E0FFBD27 */  addiu       $29, $29, -0x20
/* 01DA98 0011D998 2D204000 */  daddu       $4, $2, $0
/* 01DA9C 0011D99C FF7F033C */  lui         $3, (0x7FFFFFFF >> 16)
/* 01DAA0 0011D9A0 FFFF6334 */  ori         $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 01DAA4 0011D9A4 493F023C */  lui         $2, (0x3F490FDA >> 16)
/* 01DAA8 0011D9A8 24208300 */  and         $4, $4, $3
/* 01DAAC 0011D9AC DA0F4234 */  ori         $2, $2, (0x3F490FDA & 0xFFFF)
/* 01DAB0 0011D9B0 2A104400 */  slt         $2, $2, $4
/* 01DAB4 0011D9B4 04004014 */  bnez        $2, .L0011D9C8
/* 01DAB8 0011D9B8 1000BFFF */   sd         $31, 0x10($29)
/* 01DABC 0011D9BC 00688044 */  mtc1        $0, $f13
/* 01DAC0 0011D9C0 10000010 */  b           .L0011DA04
/* 01DAC4 0011D9C4 01000424 */   addiu      $4, $0, 0x1
.L0011D9C8:
/* 01DAC8 0011D9C8 7F7F023C */  lui         $2, (0x7F7FFFFF >> 16)
/* 01DACC 0011D9CC FFFF4234 */  ori         $2, $2, (0x7F7FFFFF & 0xFFFF)
/* 01DAD0 0011D9D0 2A104400 */  slt         $2, $2, $4
/* 01DAD4 0011D9D4 03004010 */  beqz        $2, .L0011D9E4
/* 01DAD8 0011D9D8 00000000 */   nop
/* 01DADC 0011D9DC 0B000010 */  b           .L0011DA0C
/* 01DAE0 0011D9E0 01600C46 */   sub.s      $f0, $f12, $f12
.L0011D9E4:
/* 01DAE4 0011D9E4 346A040C */  jal         __ieee754_rem_pio2f
/* 01DAE8 0011D9E8 2D20A003 */   daddu      $4, $29, $0
/* 01DAEC 0011D9EC 01004230 */  andi        $2, $2, 0x1
/* 01DAF0 0011D9F0 01000424 */  addiu       $4, $0, 0x1
/* 01DAF4 0011D9F4 40100200 */  sll         $2, $2, 1
/* 01DAF8 0011D9F8 0000ACC7 */  lwc1        $f12, 0x0($29)
/* 01DAFC 0011D9FC 0400ADC7 */  lwc1        $f13, 0x4($29)
/* 01DB00 0011DA00 23208200 */  subu        $4, $4, $2
.L0011DA04:
/* 01DB04 0011DA04 4A72040C */  jal         __kernel_tanf
/* 01DB08 0011DA08 00000000 */   nop
.L0011DA0C:
/* 01DB0C 0011DA0C 1000BFDF */  ld          $31, 0x10($29)
/* 01DB10 0011DA10 0800E003 */  jr          $31
/* 01DB14 0011DA14 2000BD27 */   addiu      $29, $29, 0x20
