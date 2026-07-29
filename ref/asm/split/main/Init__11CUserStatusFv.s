.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Init__11CUserStatusFv
/* 0BEEE0 001BEDE0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0BEEE4 001BEDE4 1000BF7F */  sq          $31, 0x10($29)
/* 0BEEE8 001BEDE8 0000B07F */  sq          $16, 0x0($29)
/* 0BEEEC 001BEDEC 28868070 */  paddub      $16, $4, $0
/* 0BEEF0 001BEDF0 281E0070 */  paddub      $3, $0, $0
/* 0BEEF4 001BEDF4 07000010 */  b           .L001BEE14
/* 0BEEF8 001BEDF8 00000000 */   nop
.L001BEDFC:
/* 0BEEFC 001BEDFC 80100300 */  sll         $2, $3, 2
/* 0BEF00 001BEE00 21105000 */  addu        $2, $2, $16
/* 0BEF04 001BEE04 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BEF08 001BEE08 21084100 */  addu        $1, $2, $1
/* 0BEF0C 001BEE0C F08A20AC */  sw          $0, -0x7510($1)
/* 0BEF10 001BEE10 01006324 */  addiu       $3, $3, 0x1
.L001BEE14:
/* 0BEF14 001BEE14 06006228 */  slti        $2, $3, 0x6
/* 0BEF18 001BEE18 F8FF4014 */  bnez        $2, .L001BEDFC
/* 0BEF1C 001BEE1C 00000000 */   nop
/* 0BEF20 001BEE20 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BEF24 001BEE24 21080102 */  addu        $1, $16, $1
/* 0BEF28 001BEE28 088B20AC */  sw          $0, -0x74F8($1)
/* 0BEF2C 001BEE2C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BEF30 001BEE30 21080102 */  addu        $1, $16, $1
/* 0BEF34 001BEE34 0C8B20AC */  sw          $0, -0x74F4($1)
/* 0BEF38 001BEE38 FFFF0224 */  addiu       $2, $0, -0x1
/* 0BEF3C 001BEE3C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BEF40 001BEE40 21080102 */  addu        $1, $16, $1
/* 0BEF44 001BEE44 108B22AC */  sw          $2, -0x74F0($1)
/* 0BEF48 001BEE48 28260072 */  paddub      $4, $16, $0
/* 0BEF4C 001BEE4C C8F6060C */  jal         ClearEventFlag__11CUserStatusFv
/* 0BEF50 001BEE50 00000000 */   nop
/* 0BEF54 001BEE54 28260070 */  paddub      $4, $0, $0
/* 0BEF58 001BEE58 07000010 */  b           .L001BEE78
/* 0BEF5C 001BEE5C 00000000 */   nop
.L001BEE60:
/* 0BEF60 001BEE60 40180400 */  sll         $3, $4, 1
/* 0BEF64 001BEE64 21187000 */  addu        $3, $3, $16
/* 0BEF68 001BEE68 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BEF6C 001BEE6C 21086100 */  addu        $1, $3, $1
/* 0BEF70 001BEE70 688A20A4 */  sh          $0, -0x7598($1)
/* 0BEF74 001BEE74 01008424 */  addiu       $4, $4, 0x1
.L001BEE78:
/* 0BEF78 001BEE78 06008328 */  slti        $3, $4, 0x6
/* 0BEF7C 001BEE7C F8FF6014 */  bnez        $3, .L001BEE60
/* 0BEF80 001BEE80 00000000 */   nop
/* 0BEF84 001BEE84 28260070 */  paddub      $4, $0, $0
/* 0BEF88 001BEE88 0F000010 */  b           .L001BEEC8
/* 0BEF8C 001BEE8C 00000000 */   nop
.L001BEE90:
/* 0BEF90 001BEE90 80180400 */  sll         $3, $4, 2
/* 0BEF94 001BEE94 21187000 */  addu        $3, $3, $16
/* 0BEF98 001BEE98 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BEF9C 001BEE9C 21086100 */  addu        $1, $3, $1
/* 0BEFA0 001BEEA0 8C8A20AC */  sw          $0, -0x7574($1)
/* 0BEFA4 001BEEA4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BEFA8 001BEEA8 21086100 */  addu        $1, $3, $1
/* 0BEFAC 001BEEAC 748A20AC */  sw          $0, -0x758C($1)
/* 0BEFB0 001BEEB0 40180400 */  sll         $3, $4, 1
/* 0BEFB4 001BEEB4 21187000 */  addu        $3, $3, $16
/* 0BEFB8 001BEEB8 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BEFBC 001BEEBC 21086100 */  addu        $1, $3, $1
/* 0BEFC0 001BEEC0 E28A20A4 */  sh          $0, -0x751E($1)
/* 0BEFC4 001BEEC4 01008424 */  addiu       $4, $4, 0x1
.L001BEEC8:
/* 0BEFC8 001BEEC8 06008328 */  slti        $3, $4, 0x6
/* 0BEFCC 001BEECC F0FF6014 */  bnez        $3, .L001BEE90
/* 0BEFD0 001BEED0 00000000 */   nop
/* 0BEFD4 001BEED4 1000BF7B */  lq          $31, 0x10($29)
/* 0BEFD8 001BEED8 0000B07B */  lq          $16, 0x0($29)
/* 0BEFDC 001BEEDC 2000BD27 */  addiu       $29, $29, 0x20
/* 0BEFE0 001BEEE0 0800E003 */  jr          $31
/* 0BEFE4 001BEEE4 00000000 */   nop
/* 0BEFE8 001BEEE8 00000000 */  nop
/* 0BEFEC 001BEEEC 00000000 */  nop
