.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel WaterSplash_Init__Fv
/* 0AF460 001AF360 149D80AF */  sw          $0, -0x62EC($28)
/* 0AF464 001AF364 D501013C */  lui         $1, %hi(CheckWaterInfo + 0x20)
/* 0AF468 001AF368 F06420AC */  sw          $0, %lo(CheckWaterInfo + 0x20)($1)
/* 0AF46C 001AF36C 282E0070 */  paddub      $5, $0, $0
/* 0AF470 001AF370 07000010 */  b           .L001AF390
/* 0AF474 001AF374 00000000 */   nop
.L001AF378:
/* 0AF478 001AF378 40210500 */  sll         $4, $5, 5
/* 0AF47C 001AF37C D501033C */  lui         $3, %hi(WaterWaveLing + 0x14)
/* 0AF480 001AF380 14656324 */  addiu       $3, $3, %lo(WaterWaveLing + 0x14)
/* 0AF484 001AF384 21186400 */  addu        $3, $3, $4
/* 0AF488 001AF388 000060AC */  sw          $0, 0x0($3)
/* 0AF48C 001AF38C 0100A524 */  addiu       $5, $5, 0x1
.L001AF390:
/* 0AF490 001AF390 0600A328 */  slti        $3, $5, 0x6
/* 0AF494 001AF394 F8FF6014 */  bnez        $3, .L001AF378
/* 0AF498 001AF398 00000000 */   nop
/* 0AF49C 001AF39C 949380AF */  sw          $0, -0x6C6C($28)
/* 0AF4A0 001AF3A0 0800E003 */  jr          $31
/* 0AF4A4 001AF3A4 00000000 */   nop
/* 0AF4A8 001AF3A8 00000000 */  nop
/* 0AF4AC 001AF3AC 00000000 */  nop
