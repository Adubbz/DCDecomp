.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetNextLife__11CUserStatusFisf
/* 0BEA00 001BE900 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0BEA04 001BE904 3000BF7F */  sq          $31, 0x30($29)
/* 0BEA08 001BE908 2000B27F */  sq          $18, 0x20($29)
/* 0BEA0C 001BE90C 1000B17F */  sq          $17, 0x10($29)
/* 0BEA10 001BE910 0000B07F */  sq          $16, 0x0($29)
/* 0BEA14 001BE914 40480500 */  sll         $9, $5, 1
/* 0BEA18 001BE918 21382401 */  addu        $7, $9, $4
/* 0BEA1C 001BE91C 700AF024 */  addiu       $16, $7, 0xA70
/* 0BEA20 001BE920 F87F1026 */  addiu       $16, $16, 0x7FF8
/* 0BEA24 001BE924 00000386 */  lh          $3, 0x0($16)
/* 0BEA28 001BE928 06006010 */  beqz        $3, .L001BE944
/* 0BEA2C 001BE92C 00000000 */   nop
/* 0BEA30 001BE930 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BEA34 001BE934 2108E100 */  addu        $1, $7, $1
/* 0BEA38 001BE938 5C8A2384 */  lh          $3, -0x75A4($1)
/* 0BEA3C 001BE93C 1200E3A4 */  sh          $3, 0x12($7)
/* 0BEA40 001BE940 000000A6 */  sh          $0, 0x0($16)
.L001BE944:
/* 0BEA44 001BE944 3C1C0600 */  dsll32      $3, $6, 16
/* 0BEA48 001BE948 3F1C0300 */  dsra32      $3, $3, 16
/* 0BEA4C 001BE94C 0200601C */  bgtz        $3, .L001BE958
/* 0BEA50 001BE950 00000000 */   nop
/* 0BEA54 001BE954 28360070 */  paddub      $6, $0, $0
.L001BE958:
/* 0BEA58 001BE958 3C440600 */  dsll32      $8, $6, 16
/* 0BEA5C 001BE95C 3F440800 */  dsra32      $8, $8, 16
/* 0BEA60 001BE960 21182401 */  addu        $3, $9, $4
/* 0BEA64 001BE964 06006784 */  lh          $7, 0x6($3)
/* 0BEA68 001BE968 2A180701 */  slt         $3, $8, $7
/* 0BEA6C 001BE96C 03006014 */  bnez        $3, .L001BE97C
/* 0BEA70 001BE970 00000000 */   nop
/* 0BEA74 001BE974 3C340700 */  dsll32      $6, $7, 16
/* 0BEA78 001BE978 3F340600 */  dsra32      $6, $6, 16
.L001BE97C:
/* 0BEA7C 001BE97C 00008044 */  mtc1        $0, $f0
/* 0BEA80 001BE980 00000000 */  nop
/* 0BEA84 001BE984 32000C46 */  c.eq.s      $f0, $f12
/* 0BEA88 001BE988 00000000 */  nop
/* 0BEA8C 001BE98C 05000045 */  bc1f        .L001BE9A4
/* 0BEA90 001BE990 00000000 */   nop
/* 0BEA94 001BE994 21182401 */  addu        $3, $9, $4
/* 0BEA98 001BE998 120066A4 */  sh          $6, 0x12($3)
/* 0BEA9C 001BE99C 22000010 */  b           .L001BEA28
/* 0BEAA0 001BE9A0 00000000 */   nop
.L001BE9A4:
/* 0BEAA4 001BE9A4 21102401 */  addu        $2, $9, $4
/* 0BEAA8 001BE9A8 640A5124 */  addiu       $17, $2, 0xA64
/* 0BEAAC 001BE9AC F87F3126 */  addiu       $17, $17, 0x7FF8
/* 0BEAB0 001BE9B0 000026A6 */  sh          $6, 0x0($17)
/* 0BEAB4 001BE9B4 12005224 */  addiu       $18, $2, 0x12
/* 0BEAB8 001BE9B8 12004384 */  lh          $3, 0x12($2)
/* 0BEABC 001BE9BC 00002286 */  lh          $2, 0x0($17)
/* 0BEAC0 001BE9C0 23104300 */  subu        $2, $2, $3
/* 0BEAC4 001BE9C4 00008244 */  mtc1        $2, $f0
/* 0BEAC8 001BE9C8 00000000 */  nop
/* 0BEACC 001BE9CC 60008046 */  cvt.s.w     $f1, $f0
/* 0BEAD0 001BE9D0 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0BEAD4 001BE9D4 00008244 */  mtc1        $2, $f0
/* 0BEAD8 001BE9D8 00000000 */  nop
/* 0BEADC 001BE9DC 03080046 */  div.s       $f0, $f1, $f0
/* 0BEAE0 001BE9E0 02630046 */  mul.s       $f12, $f12, $f0
/* 0BEAE4 001BE9E4 2C44040C */  jal         fptosi
/* 0BEAE8 001BE9E8 00000000 */   nop
/* 0BEAEC 001BE9EC 000002A6 */  sh          $2, 0x0($16)
/* 0BEAF0 001BE9F0 00000386 */  lh          $3, 0x0($16)
/* 0BEAF4 001BE9F4 0C006014 */  bnez        $3, .L001BEA28
/* 0BEAF8 001BE9F8 00000000 */   nop
/* 0BEAFC 001BE9FC 00002486 */  lh          $4, 0x0($17)
/* 0BEB00 001BEA00 00004386 */  lh          $3, 0x0($18)
/* 0BEB04 001BEA04 23188300 */  subu        $3, $4, $3
/* 0BEB08 001BEA08 05006104 */  bgez        $3, .L001BEA20
/* 0BEB0C 001BEA0C 00000000 */   nop
/* 0BEB10 001BEA10 FFFF0324 */  addiu       $3, $0, -0x1
/* 0BEB14 001BEA14 000003A6 */  sh          $3, 0x0($16)
/* 0BEB18 001BEA18 03000010 */  b           .L001BEA28
/* 0BEB1C 001BEA1C 00000000 */   nop
.L001BEA20:
/* 0BEB20 001BEA20 01000324 */  addiu       $3, $0, 0x1
/* 0BEB24 001BEA24 000003A6 */  sh          $3, 0x0($16)
.L001BEA28:
/* 0BEB28 001BEA28 3000BF7B */  lq          $31, 0x30($29)
/* 0BEB2C 001BEA2C 2000B27B */  lq          $18, 0x20($29)
/* 0BEB30 001BEA30 1000B17B */  lq          $17, 0x10($29)
/* 0BEB34 001BEA34 0000B07B */  lq          $16, 0x0($29)
/* 0BEB38 001BEA38 4000BD27 */  addiu       $29, $29, 0x40
/* 0BEB3C 001BEA3C 0800E003 */  jr          $31
/* 0BEB40 001BEA40 00000000 */   nop
/* 0BEB44 001BEA44 00000000 */  nop
/* 0BEB48 001BEA48 00000000 */  nop
/* 0BEB4C 001BEA4C 00000000 */  nop
