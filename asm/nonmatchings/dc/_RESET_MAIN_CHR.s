.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _RESET_MAIN_CHR__FP12RS_STACKDATAi
/* BCFE0 001BCEE0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BCFE4 001BCEE4 0000BF7F */  sq         $31, 0x0($sp)
/* BCFE8 001BCEE8 D501013C */  lui        $at, (0x1D567E8 >> 16)
/* BCFEC 001BCEEC E867248C */  lw         $4, (0x1D567E8 & 0xFFFF)($at)
/* BCFF0 001BCEF0 FFFF0224 */  addiu      $2, $0, -0x1
/* BCFF4 001BCEF4 04008214 */  bne        $4, $2, .L001BCF08
/* BCFF8 001BCEF8 00000000 */   nop
/* BCFFC 001BCEFC 01000224 */  addiu      $2, $0, 0x1
/* BD000 001BCF00 07000010 */  b          .L001BCF20
/* BD004 001BCF04 00000000 */   nop
.L001BCF08:
/* BD008 001BCF08 282E0070 */  paddub     $5, $0, $0
/* BD00C 001BCF0C 0C44070C */  jal        selectChrUnit__Fii
/* BD010 001BCF10 00000000 */   nop
/* BD014 001BCF14 FFFF0324 */  addiu      $3, $0, -0x1
/* BD018 001BCF18 D501013C */  lui        $at, (0x1D567E8 >> 16)
/* BD01C 001BCF1C E86723AC */  sw         $3, (0x1D567E8 & 0xFFFF)($at)
.L001BCF20:
/* BD020 001BCF20 0000BF7B */  lq         $31, 0x0($sp)
/* BD024 001BCF24 1000BD27 */  addiu      $sp, $sp, 0x10
/* BD028 001BCF28 0800E003 */  jr         $31
/* BD02C 001BCF2C 00000000 */   nop
