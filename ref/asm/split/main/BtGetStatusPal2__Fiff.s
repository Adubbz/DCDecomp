.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtGetStatusPal2__Fiff
/* 0B0570 001B0470 1C8580C7 */  lwc1        $f0, -0x7AE4($28)
/* 0B0574 001B0474 02000C46 */  mul.s       $f0, $f0, $f12
/* 0B0578 001B0478 36680046 */  c.le.s      $f13, $f0
/* 0B057C 001B047C 00000000 */  nop
/* 0B0580 001B0480 09000145 */  bc1t        .L001B04A8
/* 0B0584 001B0484 00000000 */   nop
/* 0B0588 001B0488 04008014 */  bnez        $4, .L001B049C
/* 0B058C 001B048C 00000000 */   nop
/* 0B0590 001B0490 B8938227 */  addiu       $2, $28, -0x6C48
/* 0B0594 001B0494 02000010 */  b           .L001B04A0
/* 0B0598 001B0498 00000000 */   nop
.L001B049C:
/* 0B059C 001B049C BC938227 */  addiu       $2, $28, -0x6C44
.L001B04A0:
/* 0B05A0 001B04A0 11000010 */  b           .L001B04E8
/* 0B05A4 001B04A4 00000000 */   nop
.L001B04A8:
/* 0B05A8 001B04A8 908280C7 */  lwc1        $f0, -0x7D70($28)
/* 0B05AC 001B04AC 02000C46 */  mul.s       $f0, $f0, $f12
/* 0B05B0 001B04B0 36680046 */  c.le.s      $f13, $f0
/* 0B05B4 001B04B4 00000000 */  nop
/* 0B05B8 001B04B8 0A000045 */  bc1f        .L001B04E4
/* 0B05BC 001B04BC 00000000 */   nop
/* 0B05C0 001B04C0 488280C7 */  lwc1        $f0, -0x7DB8($28)
/* 0B05C4 001B04C4 02000C46 */  mul.s       $f0, $f0, $f12
/* 0B05C8 001B04C8 36680046 */  c.le.s      $f13, $f0
/* 0B05CC 001B04CC 00000000 */  nop
/* 0B05D0 001B04D0 04000145 */  bc1t        .L001B04E4
/* 0B05D4 001B04D4 00000000 */   nop
/* 0B05D8 001B04D8 C0938227 */  addiu       $2, $28, -0x6C40
/* 0B05DC 001B04DC 02000010 */  b           .L001B04E8
/* 0B05E0 001B04E0 00000000 */   nop
.L001B04E4:
/* 0B05E4 001B04E4 C4938227 */  addiu       $2, $28, -0x6C3C
.L001B04E8:
/* 0B05E8 001B04E8 0800E003 */  jr          $31
/* 0B05EC 001B04EC 00000000 */   nop
