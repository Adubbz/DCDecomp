.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndGetVolf__Fif
/* 5AA70 0015A970 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5AA74 0015A974 2000BF7F */  sq         $31, 0x20($sp)
/* 5AA78 0015A978 1000B07F */  sq         $16, 0x10($sp)
/* 5AA7C 0015A97C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 5AA80 0015A980 06650046 */  mov.s      $f20, $f12
/* 5AA84 0015A984 2C68050C */  jal        GetSeInfo__Fi
/* 5AA88 0015A988 00000000 */   nop
/* 5AA8C 0015A98C 28864070 */  paddub     $16, $2, $0
/* 5AA90 0015A990 04000016 */  bnez       $16, .L0015A9A4
/* 5AA94 0015A994 00000000 */   nop
/* 5AA98 0015A998 28160070 */  paddub     $2, $0, $0
/* 5AA9C 0015A99C 1B000010 */  b          .L0015AA0C
/* 5AAA0 0015A9A0 00000000 */   nop
.L0015A9A4:
/* 5AAA4 0015A9A4 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5AAA8 0015A9A8 D80E050C */  jal        GetSeInfTbl__6CSoundFv
/* 5AAAC 0015A9AC 00000000 */   nop
/* 5AAB0 0015A9B0 40000624 */  addiu      $6, $0, 0x40
/* 5AAB4 0015A9B4 04000386 */  lh         $3, 0x4($16)
/* 5AAB8 0015A9B8 05006004 */  bltz       $3, .L0015A9D0
/* 5AABC 0015A9BC 00000000 */   nop
/* 5AAC0 0015A9C0 80180300 */  sll        $3, $3, 2
/* 5AAC4 0015A9C4 21106200 */  addu       $2, $3, $2
/* 5AAC8 0015A9C8 02004684 */  lh         $6, 0x2($2)
/* 5AACC 0015A9CC 00000000 */  nop
.L0015A9D0:
/* 5AAD0 0015A9D0 00008644 */  mtc1       $6, $f0
/* 5AAD4 0015A9D4 00000000 */  nop
/* 5AAD8 0015A9D8 20008046 */  cvt.s.w    $f0, $f0
/* 5AADC 0015A9DC 02031446 */  mul.s      $f12, $f0, $f20
/* 5AAE0 0015A9E0 2C44040C */  jal        fptosi
/* 5AAE4 0015A9E4 00000000 */   nop
/* 5AAE8 0015A9E8 28364070 */  paddub     $6, $2, $0
/* 5AAEC 0015A9EC 0200C104 */  bgez       $6, .L0015A9F8
/* 5AAF0 0015A9F0 00000000 */   nop
/* 5AAF4 0015A9F4 28360070 */  paddub     $6, $0, $0
.L0015A9F8:
/* 5AAF8 0015A9F8 8000C128 */  slti       $at, $6, 0x80
/* 5AAFC 0015A9FC 02002014 */  bnez       $at, .L0015AA08
/* 5AB00 0015AA00 00000000 */   nop
/* 5AB04 0015AA04 7F000624 */  addiu      $6, $0, 0x7F
.L0015AA08:
/* 5AB08 0015AA08 2816C070 */  paddub     $2, $6, $0
.L0015AA0C:
/* 5AB0C 0015AA0C 2000BF7B */  lq         $31, 0x20($sp)
/* 5AB10 0015AA10 1000B07B */  lq         $16, 0x10($sp)
/* 5AB14 0015AA14 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 5AB18 0015AA18 3000BD27 */  addiu      $sp, $sp, 0x30
/* 5AB1C 0015AA1C 0800E003 */  jr         $31
/* 5AB20 0015AA20 00000000 */   nop
/* 5AB24 0015AA24 00000000 */  nop
/* 5AB28 0015AA28 00000000 */  nop
/* 5AB2C 0015AA2C 00000000 */  nop
