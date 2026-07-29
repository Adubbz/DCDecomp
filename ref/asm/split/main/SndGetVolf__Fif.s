.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndGetVolf__Fif
/* 05AA70 0015A970 D0FFBD27 */  addiu       $29, $29, -0x30
/* 05AA74 0015A974 2000BF7F */  sq          $31, 0x20($29)
/* 05AA78 0015A978 1000B07F */  sq          $16, 0x10($29)
/* 05AA7C 0015A97C 0000B4E7 */  swc1        $f20, 0x0($29)
/* 05AA80 0015A980 06650046 */  mov.s       $f20, $f12
/* 05AA84 0015A984 2C68050C */  jal         GetSeInfo__Fi
/* 05AA88 0015A988 00000000 */   nop
/* 05AA8C 0015A98C 28864070 */  paddub      $16, $2, $0
/* 05AA90 0015A990 04000016 */  bnez        $16, .L0015A9A4
/* 05AA94 0015A994 00000000 */   nop
/* 05AA98 0015A998 28160070 */  paddub      $2, $0, $0
/* 05AA9C 0015A99C 1B000010 */  b           .L0015AA0C
/* 05AAA0 0015A9A0 00000000 */   nop
.L0015A9A4:
/* 05AAA4 0015A9A4 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05AAA8 0015A9A8 D80E050C */  jal         GetSeInfTbl__6CSoundFv
/* 05AAAC 0015A9AC 00000000 */   nop
/* 05AAB0 0015A9B0 40000624 */  addiu       $6, $0, 0x40
/* 05AAB4 0015A9B4 04000386 */  lh          $3, 0x4($16)
/* 05AAB8 0015A9B8 05006004 */  bltz        $3, .L0015A9D0
/* 05AABC 0015A9BC 00000000 */   nop
/* 05AAC0 0015A9C0 80180300 */  sll         $3, $3, 2
/* 05AAC4 0015A9C4 21106200 */  addu        $2, $3, $2
/* 05AAC8 0015A9C8 02004684 */  lh          $6, 0x2($2)
/* 05AACC 0015A9CC 00000000 */  nop
.L0015A9D0:
/* 05AAD0 0015A9D0 00008644 */  mtc1        $6, $f0
/* 05AAD4 0015A9D4 00000000 */  nop
/* 05AAD8 0015A9D8 20008046 */  cvt.s.w     $f0, $f0
/* 05AADC 0015A9DC 02031446 */  mul.s       $f12, $f0, $f20
/* 05AAE0 0015A9E0 2C44040C */  jal         fptosi
/* 05AAE4 0015A9E4 00000000 */   nop
/* 05AAE8 0015A9E8 28364070 */  paddub      $6, $2, $0
/* 05AAEC 0015A9EC 0200C104 */  bgez        $6, .L0015A9F8
/* 05AAF0 0015A9F0 00000000 */   nop
/* 05AAF4 0015A9F4 28360070 */  paddub      $6, $0, $0
.L0015A9F8:
/* 05AAF8 0015A9F8 8000C128 */  slti        $1, $6, 0x80
/* 05AAFC 0015A9FC 02002014 */  bnez        $1, .L0015AA08
/* 05AB00 0015AA00 00000000 */   nop
/* 05AB04 0015AA04 7F000624 */  addiu       $6, $0, 0x7F
.L0015AA08:
/* 05AB08 0015AA08 2816C070 */  paddub      $2, $6, $0
.L0015AA0C:
/* 05AB0C 0015AA0C 2000BF7B */  lq          $31, 0x20($29)
/* 05AB10 0015AA10 1000B07B */  lq          $16, 0x10($29)
/* 05AB14 0015AA14 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 05AB18 0015AA18 3000BD27 */  addiu       $29, $29, 0x30
/* 05AB1C 0015AA1C 0800E003 */  jr          $31
/* 05AB20 0015AA20 00000000 */   nop
/* 05AB24 0015AA24 00000000 */  nop
/* 05AB28 0015AA28 00000000 */  nop
/* 05AB2C 0015AA2C 00000000 */  nop
