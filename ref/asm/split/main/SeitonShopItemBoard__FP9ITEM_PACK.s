.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SeitonShopItemBoard__FP9ITEM_PACK
/* 0EBEB0 001EBDB0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0EBEB4 001EBDB4 2000BF7F */  sq          $31, 0x20($29)
/* 0EBEB8 001EBDB8 1000B17F */  sq          $17, 0x10($29)
/* 0EBEBC 001EBDBC 0000B07F */  sq          $16, 0x0($29)
/* 0EBEC0 001EBDC0 288E8070 */  paddub      $17, $4, $0
/* 0EBEC4 001EBDC4 16002012 */  beqz        $17, .L001EBE20
/* 0EBEC8 001EBDC8 00000000 */   nop
/* 0EBECC 001EBDCC 28860070 */  paddub      $16, $0, $0
/* 0EBED0 001EBDD0 10000010 */  b           .L001EBE14
/* 0EBED4 001EBDD4 00000000 */   nop
.L001EBDD8:
/* 0EBED8 001EBDD8 28262072 */  paddub      $4, $17, $0
/* 0EBEDC 001EBDDC 1CAF070C */  jal         SeitonShopItemBoardSub__FP9ITEM_PACK
/* 0EBEE0 001EBDE0 00000000 */   nop
/* 0EBEE4 001EBDE4 0E004014 */  bnez        $2, .L001EBE20
/* 0EBEE8 001EBDE8 00000000 */   nop
/* 0EBEEC 001EBDEC 1088838F */  lw          $3, -0x77F0($28)
/* 0EBEF0 001EBDF0 01006324 */  addiu       $3, $3, 0x1
/* 0EBEF4 001EBDF4 108883AF */  sw          $3, -0x77F0($28)
/* 0EBEF8 001EBDF8 1088838F */  lw          $3, -0x77F0($28)
/* 0EBEFC 001EBDFC 09006328 */  slti        $3, $3, 0x9
/* 0EBF00 001EBE00 03006014 */  bnez        $3, .L001EBE10
/* 0EBF04 001EBE04 00000000 */   nop
/* 0EBF08 001EBE08 01000324 */  addiu       $3, $0, 0x1
/* 0EBF0C 001EBE0C 108883AF */  sw          $3, -0x77F0($28)
.L001EBE10:
/* 0EBF10 001EBE10 01001026 */  addiu       $16, $16, 0x1
.L001EBE14:
/* 0EBF14 001EBE14 0900032A */  slti        $3, $16, 0x9
/* 0EBF18 001EBE18 EFFF6014 */  bnez        $3, .L001EBDD8
/* 0EBF1C 001EBE1C 00000000 */   nop
.L001EBE20:
/* 0EBF20 001EBE20 2000BF7B */  lq          $31, 0x20($29)
/* 0EBF24 001EBE24 1000B17B */  lq          $17, 0x10($29)
/* 0EBF28 001EBE28 0000B07B */  lq          $16, 0x0($29)
/* 0EBF2C 001EBE2C 3000BD27 */  addiu       $29, $29, 0x30
/* 0EBF30 001EBE30 0800E003 */  jr          $31
/* 0EBF34 001EBE34 00000000 */   nop
/* 0EBF38 001EBE38 00000000 */  nop
/* 0EBF3C 001EBE3C 00000000 */  nop
