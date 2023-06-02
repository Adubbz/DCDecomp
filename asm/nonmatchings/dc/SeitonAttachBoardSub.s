.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SeitonAttachBoardSub__FP11ATTACH_LIST
/* 13FEF0 0023FDF0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 13FEF4 0023FDF4 6000BF7F */  sq         $31, 0x60($sp)
/* 13FEF8 0023FDF8 5000B57F */  sq         $21, 0x50($sp)
/* 13FEFC 0023FDFC 4000B47F */  sq         $20, 0x40($sp)
/* 13FF00 0023FE00 3000B37F */  sq         $19, 0x30($sp)
/* 13FF04 0023FE04 2000B27F */  sq         $18, 0x20($sp)
/* 13FF08 0023FE08 1000B17F */  sq         $17, 0x10($sp)
/* 13FF0C 0023FE0C 0000B07F */  sq         $16, 0x0($sp)
/* 13FF10 0023FE10 288E8070 */  paddub     $17, $4, $0
/* 13FF14 0023FE14 2C8A848F */  lw         $4, -0x75D4($gp)
/* 13FF18 0023FE18 28860070 */  paddub     $16, $0, $0
/* 13FF1C 0023FE1C 0C000010 */  b          .L0023FE50
/* 13FF20 0023FE20 00000000 */   nop
.L0023FE24:
/* 13FF24 0023FE24 80180400 */  sll        $3, $4, 2
/* 13FF28 0023FE28 2900023C */  lui        $2, %hi(asort_table_3)
/* 13FF2C 0023FE2C 20604224 */  addiu      $2, $2, %lo(asort_table_3)
/* 13FF30 0023FE30 21104300 */  addu       $2, $2, $3
/* 13FF34 0023FE34 000050AC */  sw         $16, 0x0($2)
/* 13FF38 0023FE38 01008424 */  addiu      $4, $4, 0x1
/* 13FF3C 0023FE3C 05008228 */  slti       $2, $4, 0x5
/* 13FF40 0023FE40 02004014 */  bnez       $2, .L0023FE4C
/* 13FF44 0023FE44 00000000 */   nop
/* 13FF48 0023FE48 28260070 */  paddub     $4, $0, $0
.L0023FE4C:
/* 13FF4C 0023FE4C 01001026 */  addiu      $16, $16, 0x1
.L0023FE50:
/* 13FF50 0023FE50 0500022A */  slti       $2, $16, 0x5
/* 13FF54 0023FE54 F3FF4014 */  bnez       $2, .L0023FE24
/* 13FF58 0023FE58 00000000 */   nop
/* 13FF5C 0023FE5C 05000224 */  addiu      $2, $0, 0x5
/* 13FF60 0023FE60 2900013C */  lui        $at, (0x296020 >> 16)
/* 13FF64 0023FE64 206022AC */  sw         $2, (0x296020 & 0xFFFF)($at)
/* 13FF68 0023FE68 289E0070 */  paddub     $19, $0, $0
/* 13FF6C 0023FE6C 28860070 */  paddub     $16, $0, $0
/* 13FF70 0023FE70 18000010 */  b          .L0023FED4
/* 13FF74 0023FE74 00000000 */   nop
.L0023FE78:
/* 13FF78 0023FE78 01001226 */  addiu      $18, $16, 0x1
/* 13FF7C 0023FE7C 11000010 */  b          .L0023FEC4
/* 13FF80 0023FE80 00000000 */   nop
.L0023FE84:
/* 13FF84 0023FE84 40111000 */  sll        $2, $16, 5
/* 13FF88 0023FE88 21A82202 */  addu       $21, $17, $2
/* 13FF8C 0023FE8C 40111200 */  sll        $2, $18, 5
/* 13FF90 0023FE90 21A02202 */  addu       $20, $17, $2
/* 13FF94 0023FE94 2826A072 */  paddub     $4, $21, $0
/* 13FF98 0023FE98 282E8072 */  paddub     $5, $20, $0
/* 13FF9C 0023FE9C 3CFF080C */  jal        CompChargeAttach__FP11ATTACH_LISTP11ATTACH_LIST
/* 13FFA0 0023FEA0 00000000 */   nop
/* 13FFA4 0023FEA4 06004018 */  blez       $2, .L0023FEC0
/* 13FFA8 0023FEA8 00000000 */   nop
/* 13FFAC 0023FEAC 2826A072 */  paddub     $4, $21, $0
/* 13FFB0 0023FEB0 282E8072 */  paddub     $5, $20, $0
/* 13FFB4 0023FEB4 74B9080C */  jal        MenuDataSwap__FP11ATTACH_LISTP11ATTACH_LIST
/* 13FFB8 0023FEB8 00000000 */   nop
/* 13FFBC 0023FEBC 01001324 */  addiu      $19, $0, 0x1
.L0023FEC0:
/* 13FFC0 0023FEC0 01005226 */  addiu      $18, $18, 0x1
.L0023FEC4:
/* 13FFC4 0023FEC4 1E00422A */  slti       $2, $18, 0x1E
/* 13FFC8 0023FEC8 EEFF4014 */  bnez       $2, .L0023FE84
/* 13FFCC 0023FECC 00000000 */   nop
/* 13FFD0 0023FED0 01001026 */  addiu      $16, $16, 0x1
.L0023FED4:
/* 13FFD4 0023FED4 1D00022A */  slti       $2, $16, 0x1D
/* 13FFD8 0023FED8 E7FF4014 */  bnez       $2, .L0023FE78
/* 13FFDC 0023FEDC 00000000 */   nop
/* 13FFE0 0023FEE0 28166072 */  paddub     $2, $19, $0
/* 13FFE4 0023FEE4 6000BF7B */  lq         $31, 0x60($sp)
/* 13FFE8 0023FEE8 5000B57B */  lq         $21, 0x50($sp)
/* 13FFEC 0023FEEC 4000B47B */  lq         $20, 0x40($sp)
/* 13FFF0 0023FEF0 3000B37B */  lq         $19, 0x30($sp)
/* 13FFF4 0023FEF4 2000B27B */  lq         $18, 0x20($sp)
/* 13FFF8 0023FEF8 1000B17B */  lq         $17, 0x10($sp)
/* 13FFFC 0023FEFC 0000B07B */  lq         $16, 0x0($sp)
/* 140000 0023FF00 7000BD27 */  addiu      $sp, $sp, 0x70
/* 140004 0023FF04 0800E003 */  jr         $31
/* 140008 0023FF08 00000000 */   nop
/* 14000C 0023FF0C 00000000 */  nop
