.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _RESET_MAIN_CHR__FP12RS_STACKDATAi
/* 0BCFE0 001BCEE0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BCFE4 001BCEE4 0000BF7F */  sq          $31, 0x0($29)
/* 0BCFE8 001BCEE8 D501013C */  lui         $1, %hi(BtEventInfo + 0xA8)
/* 0BCFEC 001BCEEC E867248C */  lw          $4, %lo(BtEventInfo + 0xA8)($1)
/* 0BCFF0 001BCEF0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0BCFF4 001BCEF4 04008214 */  bne         $4, $2, .L001BCF08
/* 0BCFF8 001BCEF8 00000000 */   nop
/* 0BCFFC 001BCEFC 01000224 */  addiu       $2, $0, 0x1
/* 0BD000 001BCF00 07000010 */  b           .L001BCF20
/* 0BD004 001BCF04 00000000 */   nop
.L001BCF08:
/* 0BD008 001BCF08 282E0070 */  paddub      $5, $0, $0
/* 0BD00C 001BCF0C 0C44070C */  jal         selectChrUnit__Fii
/* 0BD010 001BCF10 00000000 */   nop
/* 0BD014 001BCF14 FFFF0324 */  addiu       $3, $0, -0x1
/* 0BD018 001BCF18 D501013C */  lui         $1, %hi(BtEventInfo + 0xA8)
/* 0BD01C 001BCF1C E86723AC */  sw          $3, %lo(BtEventInfo + 0xA8)($1)
.L001BCF20:
/* 0BD020 001BCF20 0000BF7B */  lq          $31, 0x0($29)
/* 0BD024 001BCF24 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD028 001BCF28 0800E003 */  jr          $31
/* 0BD02C 001BCF2C 00000000 */   nop
