.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SearchItemIndexNo__14CDngStatusDataFi
/* BDA40 001BD940 8400A228 */  slti       $2, $5, 0x84
/* BDA44 001BD944 12004014 */  bnez       $2, .L001BD990
/* BDA48 001BD948 00000000 */   nop
/* BDA4C 001BD94C 0101A128 */  slti       $at, $5, 0x101
/* BDA50 001BD950 0F002010 */  beqz       $at, .L001BD990
/* BDA54 001BD954 00000000 */   nop
/* BDA58 001BD958 28160070 */  paddub     $2, $0, $0
/* BDA5C 001BD95C 09000010 */  b          .L001BD984
/* BDA60 001BD960 00000000 */   nop
.L001BD964:
/* BDA64 001BD964 40180200 */  sll        $3, $2, 1
/* BDA68 001BD968 21186400 */  addu       $3, $3, $4
/* BDA6C 001BD96C 62436384 */  lh         $3, 0x4362($3)
/* BDA70 001BD970 03006514 */  bne        $3, $5, .L001BD980
/* BDA74 001BD974 00000000 */   nop
/* BDA78 001BD978 4F000010 */  b          .L001BDAB8
/* BDA7C 001BD97C 00000000 */   nop
.L001BD980:
/* BDA80 001BD980 01004224 */  addiu      $2, $2, 0x1
.L001BD984:
/* BDA84 001BD984 03004328 */  slti       $3, $2, 0x3
/* BDA88 001BD988 F6FF6014 */  bnez       $3, .L001BD964
/* BDA8C 001BD98C 00000000 */   nop
.L001BD990:
/* BDA90 001BD990 8400A228 */  slti       $2, $5, 0x84
/* BDA94 001BD994 13004014 */  bnez       $2, .L001BD9E4
/* BDA98 001BD998 00000000 */   nop
/* BDA9C 001BD99C 0101A128 */  slti       $at, $5, 0x101
/* BDAA0 001BD9A0 10002010 */  beqz       $at, .L001BD9E4
/* BDAA4 001BD9A4 00000000 */   nop
/* BDAA8 001BD9A8 28160070 */  paddub     $2, $0, $0
/* BDAAC 001BD9AC 09000010 */  b          .L001BD9D4
/* BDAB0 001BD9B0 00000000 */   nop
.L001BD9B4:
/* BDAB4 001BD9B4 40180200 */  sll        $3, $2, 1
/* BDAB8 001BD9B8 21186400 */  addu       $3, $3, $4
/* BDABC 001BD9BC 6E436384 */  lh         $3, 0x436E($3)
/* BDAC0 001BD9C0 03006514 */  bne        $3, $5, .L001BD9D0
/* BDAC4 001BD9C4 00000000 */   nop
/* BDAC8 001BD9C8 3B000010 */  b          .L001BDAB8
/* BDACC 001BD9CC 00000000 */   nop
.L001BD9D0:
/* BDAD0 001BD9D0 01004224 */  addiu      $2, $2, 0x1
.L001BD9D4:
/* BDAD4 001BD9D4 60438380 */  lb         $3, 0x4360($4)
/* BDAD8 001BD9D8 2A184300 */  slt        $3, $2, $3
/* BDADC 001BD9DC F5FF6014 */  bnez       $3, .L001BD9B4
/* BDAE0 001BD9E0 00000000 */   nop
.L001BD9E4:
/* BDAE4 001BD9E4 5100A228 */  slti       $2, $5, 0x51
/* BDAE8 001BD9E8 14004014 */  bnez       $2, .L001BDA3C
/* BDAEC 001BD9EC 00000000 */   nop
/* BDAF0 001BD9F0 8400A128 */  slti       $at, $5, 0x84
/* BDAF4 001BD9F4 11002010 */  beqz       $at, .L001BDA3C
/* BDAF8 001BD9F8 00000000 */   nop
/* BDAFC 001BD9FC 28160070 */  paddub     $2, $0, $0
/* BDB00 001BDA00 0B000010 */  b          .L001BDA30
/* BDB04 001BDA04 00000000 */   nop
.L001BDA08:
/* BDB08 001BDA08 40190200 */  sll        $3, $2, 5
/* BDB0C 001BDA0C 21186400 */  addu       $3, $3, $4
/* BDB10 001BDA10 0100013C */  lui        $at, (0x10000 >> 16)
/* BDB14 001BDA14 21086100 */  addu       $at, $3, $at
/* BDB18 001BDA18 FC842384 */  lh         $3, -0x7B04($at)
/* BDB1C 001BDA1C 03006514 */  bne        $3, $5, .L001BDA2C
/* BDB20 001BDA20 00000000 */   nop
/* BDB24 001BDA24 24000010 */  b          .L001BDAB8
/* BDB28 001BDA28 00000000 */   nop
.L001BDA2C:
/* BDB2C 001BDA2C 01004224 */  addiu      $2, $2, 0x1
.L001BDA30:
/* BDB30 001BDA30 28004328 */  slti       $3, $2, 0x28
/* BDB34 001BDA34 F4FF6014 */  bnez       $3, .L001BDA08
/* BDB38 001BDA38 00000000 */   nop
.L001BDA3C:
/* BDB3C 001BDA3C 0101A228 */  slti       $2, $5, 0x101
/* BDB40 001BDA40 1C004014 */  bnez       $2, .L001BDAB4
/* BDB44 001BDA44 00000000 */   nop
/* BDB48 001BDA48 283E0070 */  paddub     $7, $0, $0
/* BDB4C 001BDA4C 15000010 */  b          .L001BDAA4
/* BDB50 001BDA50 00000000 */   nop
.L001BDA54:
/* BDB54 001BDA54 28160070 */  paddub     $2, $0, $0
/* BDB58 001BDA58 0E000010 */  b          .L001BDA94
/* BDB5C 001BDA5C 00000000 */   nop
.L001BDA60:
/* BDB60 001BDA60 A80A0324 */  addiu      $3, $0, 0xAA8
/* BDB64 001BDA64 1818E300 */  mult       $3, $7, $3
/* BDB68 001BDA68 21306400 */  addu       $6, $3, $4
/* BDB6C 001BDA6C 40190200 */  sll        $3, $2, 5
/* BDB70 001BDA70 23186200 */  subu       $3, $3, $2
/* BDB74 001BDA74 C0180300 */  sll        $3, $3, 3
/* BDB78 001BDA78 21186600 */  addu       $3, $3, $6
/* BDB7C 001BDA7C 0C456384 */  lh         $3, 0x450C($3)
/* BDB80 001BDA80 03006514 */  bne        $3, $5, .L001BDA90
/* BDB84 001BDA84 00000000 */   nop
/* BDB88 001BDA88 0B000010 */  b          .L001BDAB8
/* BDB8C 001BDA8C 00000000 */   nop
.L001BDA90:
/* BDB90 001BDA90 01004224 */  addiu      $2, $2, 0x1
.L001BDA94:
/* BDB94 001BDA94 0A004328 */  slti       $3, $2, 0xA
/* BDB98 001BDA98 F1FF6014 */  bnez       $3, .L001BDA60
/* BDB9C 001BDA9C 00000000 */   nop
/* BDBA0 001BDAA0 0100E724 */  addiu      $7, $7, 0x1
.L001BDAA4:
/* BDBA4 001BDAA4 05008280 */  lb         $2, 0x5($4)
/* BDBA8 001BDAA8 2A10E200 */  slt        $2, $7, $2
/* BDBAC 001BDAAC E9FF4014 */  bnez       $2, .L001BDA54
/* BDBB0 001BDAB0 00000000 */   nop
.L001BDAB4:
/* BDBB4 001BDAB4 FFFF0224 */  addiu      $2, $0, -0x1
.L001BDAB8:
/* BDBB8 001BDAB8 0800E003 */  jr         $31
/* BDBBC 001BDABC 00000000 */   nop