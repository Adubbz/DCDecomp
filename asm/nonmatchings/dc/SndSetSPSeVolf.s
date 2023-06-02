.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSetSPSeVolf__Fif
/* 5BA50 0015B950 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5BA54 0015B954 2000BF7F */  sq         $31, 0x20($sp)
/* 5BA58 0015B958 1000B07F */  sq         $16, 0x10($sp)
/* 5BA5C 0015B95C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 5BA60 0015B960 06650046 */  mov.s      $f20, $f12
/* 5BA64 0015B964 6C6D050C */  jal        GetSPInfo__Fi
/* 5BA68 0015B968 00000000 */   nop
/* 5BA6C 0015B96C 28864070 */  paddub     $16, $2, $0
/* 5BA70 0015B970 1D000012 */  beqz       $16, .L0015B9E8
/* 5BA74 0015B974 00000000 */   nop
/* 5BA78 0015B978 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5BA7C 0015B97C D80E050C */  jal        GetSeInfTbl__6CSoundFv
/* 5BA80 0015B980 00000000 */   nop
/* 5BA84 0015B984 04000386 */  lh         $3, 0x4($16)
/* 5BA88 0015B988 80180300 */  sll        $3, $3, 2
/* 5BA8C 0015B98C 21106200 */  addu       $2, $3, $2
/* 5BA90 0015B990 02004284 */  lh         $2, 0x2($2)
/* 5BA94 0015B994 00008244 */  mtc1       $2, $f0
/* 5BA98 0015B998 00000000 */  nop
/* 5BA9C 0015B99C 20008046 */  cvt.s.w    $f0, $f0
/* 5BAA0 0015B9A0 02031446 */  mul.s      $f12, $f0, $f20
/* 5BAA4 0015B9A4 2C44040C */  jal        fptosi
/* 5BAA8 0015B9A8 00000000 */   nop
/* 5BAAC 0015B9AC 02004104 */  bgez       $2, .L0015B9B8
/* 5BAB0 0015B9B0 00000000 */   nop
/* 5BAB4 0015B9B4 28160070 */  paddub     $2, $0, $0
.L0015B9B8:
/* 5BAB8 0015B9B8 80004128 */  slti       $at, $2, 0x80
/* 5BABC 0015B9BC 02002014 */  bnez       $at, .L0015B9C8
/* 5BAC0 0015B9C0 00000000 */   nop
/* 5BAC4 0015B9C4 7F000224 */  addiu      $2, $0, 0x7F
.L0015B9C8:
/* 5BAC8 0015B9C8 00000682 */  lb         $6, 0x0($16)
/* 5BACC 0015B9CC 01000782 */  lb         $7, 0x1($16)
/* 5BAD0 0015B9D0 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5BAD4 0015B9D4 0C000524 */  addiu      $5, $0, 0xC
/* 5BAD8 0015B9D8 28464070 */  paddub     $8, $2, $0
/* 5BADC 0015B9DC 284E0070 */  paddub     $9, $0, $0
/* 5BAE0 0015B9E0 2016050C */  jal        SE_SetVol__6CSoundFiiiii
/* 5BAE4 0015B9E4 00000000 */   nop
.L0015B9E8:
/* 5BAE8 0015B9E8 2000BF7B */  lq         $31, 0x20($sp)
/* 5BAEC 0015B9EC 1000B07B */  lq         $16, 0x10($sp)
/* 5BAF0 0015B9F0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 5BAF4 0015B9F4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 5BAF8 0015B9F8 0800E003 */  jr         $31
/* 5BAFC 0015B9FC 00000000 */   nop
