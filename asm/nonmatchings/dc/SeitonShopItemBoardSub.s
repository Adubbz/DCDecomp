.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SeitonShopItemBoardSub__FP9ITEM_PACK
/* EBD70 001EBC70 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* EBD74 001EBC74 4000BF7F */  sq         $31, 0x40($sp)
/* EBD78 001EBC78 3000B37F */  sq         $19, 0x30($sp)
/* EBD7C 001EBC7C 2000B27F */  sq         $18, 0x20($sp)
/* EBD80 001EBC80 1000B17F */  sq         $17, 0x10($sp)
/* EBD84 001EBC84 0000B07F */  sq         $16, 0x0($sp)
/* EBD88 001EBC88 289E8070 */  paddub     $19, $4, $0
/* EBD8C 001EBC8C 1088848F */  lw         $4, -0x77F0($gp)
/* EBD90 001EBC90 28860070 */  paddub     $16, $0, $0
/* EBD94 001EBC94 0C000010 */  b          .L001EBCC8
/* EBD98 001EBC98 00000000 */   nop
.L001EBC9C:
/* EBD9C 001EBC9C 80180400 */  sll        $3, $4, 2
/* EBDA0 001EBCA0 2900023C */  lui        $2, %hi(sort_table)
/* EBDA4 001EBCA4 D0274224 */  addiu      $2, $2, %lo(sort_table)
/* EBDA8 001EBCA8 21104300 */  addu       $2, $2, $3
/* EBDAC 001EBCAC 000050AC */  sw         $16, 0x0($2)
/* EBDB0 001EBCB0 01008424 */  addiu      $4, $4, 0x1
/* EBDB4 001EBCB4 09008228 */  slti       $2, $4, 0x9
/* EBDB8 001EBCB8 02004014 */  bnez       $2, .L001EBCC4
/* EBDBC 001EBCBC 00000000 */   nop
/* EBDC0 001EBCC0 28260070 */  paddub     $4, $0, $0
.L001EBCC4:
/* EBDC4 001EBCC4 01001026 */  addiu      $16, $16, 0x1
.L001EBCC8:
/* EBDC8 001EBCC8 0900022A */  slti       $2, $16, 0x9
/* EBDCC 001EBCCC F3FF4014 */  bnez       $2, .L001EBC9C
/* EBDD0 001EBCD0 00000000 */   nop
/* EBDD4 001EBCD4 09000224 */  addiu      $2, $0, 0x9
/* EBDD8 001EBCD8 2900013C */  lui        $at, (0x2927D0 >> 16)
/* EBDDC 001EBCDC D02722AC */  sw         $2, (0x2927D0 & 0xFFFF)($at)
/* EBDE0 001EBCE0 28960070 */  paddub     $18, $0, $0
/* EBDE4 001EBCE4 28860070 */  paddub     $16, $0, $0
/* EBDE8 001EBCE8 21000010 */  b          .L001EBD70
/* EBDEC 001EBCEC 00000000 */   nop
.L001EBCF0:
/* EBDF0 001EBCF0 01001126 */  addiu      $17, $16, 0x1
/* EBDF4 001EBCF4 19000010 */  b          .L001EBD5C
/* EBDF8 001EBCF8 00000000 */   nop
.L001EBCFC:
/* EBDFC 001EBCFC 40101000 */  sll        $2, $16, 1
/* EBE00 001EBD00 21105300 */  addu       $2, $2, $19
/* EBE04 001EBD04 0E004484 */  lh         $4, 0xE($2)
/* EBE08 001EBD08 40101100 */  sll        $2, $17, 1
/* EBE0C 001EBD0C 21105300 */  addu       $2, $2, $19
/* EBE10 001EBD10 0E004584 */  lh         $5, 0xE($2)
/* EBE14 001EBD14 D4AE070C */  jal        CompItem1__Fii
/* EBE18 001EBD18 00000000 */   nop
/* EBE1C 001EBD1C 0E004018 */  blez       $2, .L001EBD58
/* EBE20 001EBD20 00000000 */   nop
/* EBE24 001EBD24 28266072 */  paddub     $4, $19, $0
/* EBE28 001EBD28 282E0072 */  paddub     $5, $16, $0
/* EBE2C 001EBD2C 28362072 */  paddub     $6, $17, $0
/* EBE30 001EBD30 F0C5080C */  jal        SwapItem__FP9ITEM_PACKii
/* EBE34 001EBD34 00000000 */   nop
/* EBE38 001EBD38 9494838F */  lw         $3, -0x6B6C($gp)
/* EBE3C 001EBD3C 80101000 */  sll        $2, $16, 2
/* EBE40 001EBD40 21206200 */  addu       $4, $3, $2
/* EBE44 001EBD44 80101100 */  sll        $2, $17, 2
/* EBE48 001EBD48 21286200 */  addu       $5, $3, $2
/* EBE4C 001EBD4C 44B9080C */  jal        MenuDataSwap__FPiPi
/* EBE50 001EBD50 00000000 */   nop
/* EBE54 001EBD54 01001224 */  addiu      $18, $0, 0x1
.L001EBD58:
/* EBE58 001EBD58 01003126 */  addiu      $17, $17, 0x1
.L001EBD5C:
/* EBE5C 001EBD5C 00006282 */  lb         $2, 0x0($19)
/* EBE60 001EBD60 2A102202 */  slt        $2, $17, $2
/* EBE64 001EBD64 E5FF4014 */  bnez       $2, .L001EBCFC
/* EBE68 001EBD68 00000000 */   nop
/* EBE6C 001EBD6C 01001026 */  addiu      $16, $16, 0x1
.L001EBD70:
/* EBE70 001EBD70 00006282 */  lb         $2, 0x0($19)
/* EBE74 001EBD74 FFFF4224 */  addiu      $2, $2, -0x1
/* EBE78 001EBD78 2A100202 */  slt        $2, $16, $2
/* EBE7C 001EBD7C DCFF4014 */  bnez       $2, .L001EBCF0
/* EBE80 001EBD80 00000000 */   nop
/* EBE84 001EBD84 28164072 */  paddub     $2, $18, $0
/* EBE88 001EBD88 4000BF7B */  lq         $31, 0x40($sp)
/* EBE8C 001EBD8C 3000B37B */  lq         $19, 0x30($sp)
/* EBE90 001EBD90 2000B27B */  lq         $18, 0x20($sp)
/* EBE94 001EBD94 1000B17B */  lq         $17, 0x10($sp)
/* EBE98 001EBD98 0000B07B */  lq         $16, 0x0($sp)
/* EBE9C 001EBD9C 5000BD27 */  addiu      $sp, $sp, 0x50
/* EBEA0 001EBDA0 0800E003 */  jr         $31
/* EBEA4 001EBDA4 00000000 */   nop
/* EBEA8 001EBDA8 00000000 */  nop
/* EBEAC 001EBDAC 00000000 */  nop
