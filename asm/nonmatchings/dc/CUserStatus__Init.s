.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Init__11CUserStatusFv
/* BEEE0 001BEDE0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* BEEE4 001BEDE4 1000BF7F */  sq         $31, 0x10($sp)
/* BEEE8 001BEDE8 0000B07F */  sq         $16, 0x0($sp)
/* BEEEC 001BEDEC 28868070 */  paddub     $16, $4, $0
/* BEEF0 001BEDF0 281E0070 */  paddub     $3, $0, $0
/* BEEF4 001BEDF4 07000010 */  b          .L001BEE14
/* BEEF8 001BEDF8 00000000 */   nop
.L001BEDFC:
/* BEEFC 001BEDFC 80100300 */  sll        $2, $3, 2
/* BEF00 001BEE00 21105000 */  addu       $2, $2, $16
/* BEF04 001BEE04 0100013C */  lui        $at, (0x10000 >> 16)
/* BEF08 001BEE08 21084100 */  addu       $at, $2, $at
/* BEF0C 001BEE0C F08A20AC */  sw         $0, -0x7510($at)
/* BEF10 001BEE10 01006324 */  addiu      $3, $3, 0x1
.L001BEE14:
/* BEF14 001BEE14 06006228 */  slti       $2, $3, 0x6
/* BEF18 001BEE18 F8FF4014 */  bnez       $2, .L001BEDFC
/* BEF1C 001BEE1C 00000000 */   nop
/* BEF20 001BEE20 0100013C */  lui        $at, (0x10000 >> 16)
/* BEF24 001BEE24 21080102 */  addu       $at, $16, $at
/* BEF28 001BEE28 088B20AC */  sw         $0, -0x74F8($at)
/* BEF2C 001BEE2C 0100013C */  lui        $at, (0x10000 >> 16)
/* BEF30 001BEE30 21080102 */  addu       $at, $16, $at
/* BEF34 001BEE34 0C8B20AC */  sw         $0, -0x74F4($at)
/* BEF38 001BEE38 FFFF0224 */  addiu      $2, $0, -0x1
/* BEF3C 001BEE3C 0100013C */  lui        $at, (0x10000 >> 16)
/* BEF40 001BEE40 21080102 */  addu       $at, $16, $at
/* BEF44 001BEE44 108B22AC */  sw         $2, -0x74F0($at)
/* BEF48 001BEE48 28260072 */  paddub     $4, $16, $0
/* BEF4C 001BEE4C C8F6060C */  jal        ClearEventFlag__11CUserStatusFv
/* BEF50 001BEE50 00000000 */   nop
/* BEF54 001BEE54 28260070 */  paddub     $4, $0, $0
/* BEF58 001BEE58 07000010 */  b          .L001BEE78
/* BEF5C 001BEE5C 00000000 */   nop
.L001BEE60:
/* BEF60 001BEE60 40180400 */  sll        $3, $4, 1
/* BEF64 001BEE64 21187000 */  addu       $3, $3, $16
/* BEF68 001BEE68 0100013C */  lui        $at, (0x10000 >> 16)
/* BEF6C 001BEE6C 21086100 */  addu       $at, $3, $at
/* BEF70 001BEE70 688A20A4 */  sh         $0, -0x7598($at)
/* BEF74 001BEE74 01008424 */  addiu      $4, $4, 0x1
.L001BEE78:
/* BEF78 001BEE78 06008328 */  slti       $3, $4, 0x6
/* BEF7C 001BEE7C F8FF6014 */  bnez       $3, .L001BEE60
/* BEF80 001BEE80 00000000 */   nop
/* BEF84 001BEE84 28260070 */  paddub     $4, $0, $0
/* BEF88 001BEE88 0F000010 */  b          .L001BEEC8
/* BEF8C 001BEE8C 00000000 */   nop
.L001BEE90:
/* BEF90 001BEE90 80180400 */  sll        $3, $4, 2
/* BEF94 001BEE94 21187000 */  addu       $3, $3, $16
/* BEF98 001BEE98 0100013C */  lui        $at, (0x10000 >> 16)
/* BEF9C 001BEE9C 21086100 */  addu       $at, $3, $at
/* BEFA0 001BEEA0 8C8A20AC */  sw         $0, -0x7574($at)
/* BEFA4 001BEEA4 0100013C */  lui        $at, (0x10000 >> 16)
/* BEFA8 001BEEA8 21086100 */  addu       $at, $3, $at
/* BEFAC 001BEEAC 748A20AC */  sw         $0, -0x758C($at)
/* BEFB0 001BEEB0 40180400 */  sll        $3, $4, 1
/* BEFB4 001BEEB4 21187000 */  addu       $3, $3, $16
/* BEFB8 001BEEB8 0100013C */  lui        $at, (0x10000 >> 16)
/* BEFBC 001BEEBC 21086100 */  addu       $at, $3, $at
/* BEFC0 001BEEC0 E28A20A4 */  sh         $0, -0x751E($at)
/* BEFC4 001BEEC4 01008424 */  addiu      $4, $4, 0x1
.L001BEEC8:
/* BEFC8 001BEEC8 06008328 */  slti       $3, $4, 0x6
/* BEFCC 001BEECC F0FF6014 */  bnez       $3, .L001BEE90
/* BEFD0 001BEED0 00000000 */   nop
/* BEFD4 001BEED4 1000BF7B */  lq         $31, 0x10($sp)
/* BEFD8 001BEED8 0000B07B */  lq         $16, 0x0($sp)
/* BEFDC 001BEEDC 2000BD27 */  addiu      $sp, $sp, 0x20
/* BEFE0 001BEEE0 0800E003 */  jr         $31
/* BEFE4 001BEEE4 00000000 */   nop
/* BEFE8 001BEEE8 00000000 */  nop
/* BEFEC 001BEEEC 00000000 */  nop
