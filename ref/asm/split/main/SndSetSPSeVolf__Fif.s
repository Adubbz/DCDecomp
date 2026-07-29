.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSetSPSeVolf__Fif
/* 05BA50 0015B950 D0FFBD27 */  addiu       $29, $29, -0x30
/* 05BA54 0015B954 2000BF7F */  sq          $31, 0x20($29)
/* 05BA58 0015B958 1000B07F */  sq          $16, 0x10($29)
/* 05BA5C 0015B95C 0000B4E7 */  swc1        $f20, 0x0($29)
/* 05BA60 0015B960 06650046 */  mov.s       $f20, $f12
/* 05BA64 0015B964 6C6D050C */  jal         GetSPInfo__Fi
/* 05BA68 0015B968 00000000 */   nop
/* 05BA6C 0015B96C 28864070 */  paddub      $16, $2, $0
/* 05BA70 0015B970 1D000012 */  beqz        $16, .L0015B9E8
/* 05BA74 0015B974 00000000 */   nop
/* 05BA78 0015B978 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05BA7C 0015B97C D80E050C */  jal         GetSeInfTbl__6CSoundFv
/* 05BA80 0015B980 00000000 */   nop
/* 05BA84 0015B984 04000386 */  lh          $3, 0x4($16)
/* 05BA88 0015B988 80180300 */  sll         $3, $3, 2
/* 05BA8C 0015B98C 21106200 */  addu        $2, $3, $2
/* 05BA90 0015B990 02004284 */  lh          $2, 0x2($2)
/* 05BA94 0015B994 00008244 */  mtc1        $2, $f0
/* 05BA98 0015B998 00000000 */  nop
/* 05BA9C 0015B99C 20008046 */  cvt.s.w     $f0, $f0
/* 05BAA0 0015B9A0 02031446 */  mul.s       $f12, $f0, $f20
/* 05BAA4 0015B9A4 2C44040C */  jal         fptosi
/* 05BAA8 0015B9A8 00000000 */   nop
/* 05BAAC 0015B9AC 02004104 */  bgez        $2, .L0015B9B8
/* 05BAB0 0015B9B0 00000000 */   nop
/* 05BAB4 0015B9B4 28160070 */  paddub      $2, $0, $0
.L0015B9B8:
/* 05BAB8 0015B9B8 80004128 */  slti        $1, $2, 0x80
/* 05BABC 0015B9BC 02002014 */  bnez        $1, .L0015B9C8
/* 05BAC0 0015B9C0 00000000 */   nop
/* 05BAC4 0015B9C4 7F000224 */  addiu       $2, $0, 0x7F
.L0015B9C8:
/* 05BAC8 0015B9C8 00000682 */  lb          $6, 0x0($16)
/* 05BACC 0015B9CC 01000782 */  lb          $7, 0x1($16)
/* 05BAD0 0015B9D0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05BAD4 0015B9D4 0C000524 */  addiu       $5, $0, 0xC
/* 05BAD8 0015B9D8 28464070 */  paddub      $8, $2, $0
/* 05BADC 0015B9DC 284E0070 */  paddub      $9, $0, $0
/* 05BAE0 0015B9E0 2016050C */  jal         SE_SetVol__6CSoundFiiiii
/* 05BAE4 0015B9E4 00000000 */   nop
.L0015B9E8:
/* 05BAE8 0015B9E8 2000BF7B */  lq          $31, 0x20($29)
/* 05BAEC 0015B9EC 1000B07B */  lq          $16, 0x10($29)
/* 05BAF0 0015B9F0 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 05BAF4 0015B9F4 3000BD27 */  addiu       $29, $29, 0x30
/* 05BAF8 0015B9F8 0800E003 */  jr          $31
/* 05BAFC 0015B9FC 00000000 */   nop
