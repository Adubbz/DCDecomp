.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SeitonShopItemBoardSub__FP9ITEM_PACK
/* 0EBD70 001EBC70 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0EBD74 001EBC74 4000BF7F */  sq          $31, 0x40($29)
/* 0EBD78 001EBC78 3000B37F */  sq          $19, 0x30($29)
/* 0EBD7C 001EBC7C 2000B27F */  sq          $18, 0x20($29)
/* 0EBD80 001EBC80 1000B17F */  sq          $17, 0x10($29)
/* 0EBD84 001EBC84 0000B07F */  sq          $16, 0x0($29)
/* 0EBD88 001EBC88 289E8070 */  paddub      $19, $4, $0
/* 0EBD8C 001EBC8C 1088848F */  lw          $4, -0x77F0($28)
/* 0EBD90 001EBC90 28860070 */  paddub      $16, $0, $0
/* 0EBD94 001EBC94 0C000010 */  b           .L001EBCC8
/* 0EBD98 001EBC98 00000000 */   nop
.L001EBC9C:
/* 0EBD9C 001EBC9C 80180400 */  sll         $3, $4, 2
/* 0EBDA0 001EBCA0 2900023C */  lui         $2, %hi(sort_table)
/* 0EBDA4 001EBCA4 D0274224 */  addiu       $2, $2, %lo(sort_table)
/* 0EBDA8 001EBCA8 21104300 */  addu        $2, $2, $3
/* 0EBDAC 001EBCAC 000050AC */  sw          $16, 0x0($2)
/* 0EBDB0 001EBCB0 01008424 */  addiu       $4, $4, 0x1
/* 0EBDB4 001EBCB4 09008228 */  slti        $2, $4, 0x9
/* 0EBDB8 001EBCB8 02004014 */  bnez        $2, .L001EBCC4
/* 0EBDBC 001EBCBC 00000000 */   nop
/* 0EBDC0 001EBCC0 28260070 */  paddub      $4, $0, $0
.L001EBCC4:
/* 0EBDC4 001EBCC4 01001026 */  addiu       $16, $16, 0x1
.L001EBCC8:
/* 0EBDC8 001EBCC8 0900022A */  slti        $2, $16, 0x9
/* 0EBDCC 001EBCCC F3FF4014 */  bnez        $2, .L001EBC9C
/* 0EBDD0 001EBCD0 00000000 */   nop
/* 0EBDD4 001EBCD4 09000224 */  addiu       $2, $0, 0x9
/* 0EBDD8 001EBCD8 2900013C */  lui         $1, %hi(sort_table)
/* 0EBDDC 001EBCDC D02722AC */  sw          $2, %lo(sort_table)($1)
/* 0EBDE0 001EBCE0 28960070 */  paddub      $18, $0, $0
/* 0EBDE4 001EBCE4 28860070 */  paddub      $16, $0, $0
/* 0EBDE8 001EBCE8 21000010 */  b           .L001EBD70
/* 0EBDEC 001EBCEC 00000000 */   nop
.L001EBCF0:
/* 0EBDF0 001EBCF0 01001126 */  addiu       $17, $16, 0x1
/* 0EBDF4 001EBCF4 19000010 */  b           .L001EBD5C
/* 0EBDF8 001EBCF8 00000000 */   nop
.L001EBCFC:
/* 0EBDFC 001EBCFC 40101000 */  sll         $2, $16, 1
/* 0EBE00 001EBD00 21105300 */  addu        $2, $2, $19
/* 0EBE04 001EBD04 0E004484 */  lh          $4, 0xE($2)
/* 0EBE08 001EBD08 40101100 */  sll         $2, $17, 1
/* 0EBE0C 001EBD0C 21105300 */  addu        $2, $2, $19
/* 0EBE10 001EBD10 0E004584 */  lh          $5, 0xE($2)
/* 0EBE14 001EBD14 D4AE070C */  jal         CompItem1__Fii
/* 0EBE18 001EBD18 00000000 */   nop
/* 0EBE1C 001EBD1C 0E004018 */  blez        $2, .L001EBD58
/* 0EBE20 001EBD20 00000000 */   nop
/* 0EBE24 001EBD24 28266072 */  paddub      $4, $19, $0
/* 0EBE28 001EBD28 282E0072 */  paddub      $5, $16, $0
/* 0EBE2C 001EBD2C 28362072 */  paddub      $6, $17, $0
/* 0EBE30 001EBD30 F0C5080C */  jal         SwapItem__FP9ITEM_PACKii
/* 0EBE34 001EBD34 00000000 */   nop
/* 0EBE38 001EBD38 9494838F */  lw          $3, -0x6B6C($28)
/* 0EBE3C 001EBD3C 80101000 */  sll         $2, $16, 2
/* 0EBE40 001EBD40 21206200 */  addu        $4, $3, $2
/* 0EBE44 001EBD44 80101100 */  sll         $2, $17, 2
/* 0EBE48 001EBD48 21286200 */  addu        $5, $3, $2
/* 0EBE4C 001EBD4C 44B9080C */  jal         MenuDataSwap__FPiPi
/* 0EBE50 001EBD50 00000000 */   nop
/* 0EBE54 001EBD54 01001224 */  addiu       $18, $0, 0x1
.L001EBD58:
/* 0EBE58 001EBD58 01003126 */  addiu       $17, $17, 0x1
.L001EBD5C:
/* 0EBE5C 001EBD5C 00006282 */  lb          $2, 0x0($19)
/* 0EBE60 001EBD60 2A102202 */  slt         $2, $17, $2
/* 0EBE64 001EBD64 E5FF4014 */  bnez        $2, .L001EBCFC
/* 0EBE68 001EBD68 00000000 */   nop
/* 0EBE6C 001EBD6C 01001026 */  addiu       $16, $16, 0x1
.L001EBD70:
/* 0EBE70 001EBD70 00006282 */  lb          $2, 0x0($19)
/* 0EBE74 001EBD74 FFFF4224 */  addiu       $2, $2, -0x1
/* 0EBE78 001EBD78 2A100202 */  slt         $2, $16, $2
/* 0EBE7C 001EBD7C DCFF4014 */  bnez        $2, .L001EBCF0
/* 0EBE80 001EBD80 00000000 */   nop
/* 0EBE84 001EBD84 28164072 */  paddub      $2, $18, $0
/* 0EBE88 001EBD88 4000BF7B */  lq          $31, 0x40($29)
/* 0EBE8C 001EBD8C 3000B37B */  lq          $19, 0x30($29)
/* 0EBE90 001EBD90 2000B27B */  lq          $18, 0x20($29)
/* 0EBE94 001EBD94 1000B17B */  lq          $17, 0x10($29)
/* 0EBE98 001EBD98 0000B07B */  lq          $16, 0x0($29)
/* 0EBE9C 001EBD9C 5000BD27 */  addiu       $29, $29, 0x50
/* 0EBEA0 001EBDA0 0800E003 */  jr          $31
/* 0EBEA4 001EBDA4 00000000 */   nop
/* 0EBEA8 001EBDA8 00000000 */  nop
/* 0EBEAC 001EBDAC 00000000 */  nop
