.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SeitonShopItemBoard__FP9ITEM_PACK
/* EBEB0 001EBDB0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* EBEB4 001EBDB4 2000BF7F */  sq         $31, 0x20($sp)
/* EBEB8 001EBDB8 1000B17F */  sq         $17, 0x10($sp)
/* EBEBC 001EBDBC 0000B07F */  sq         $16, 0x0($sp)
/* EBEC0 001EBDC0 288E8070 */  paddub     $17, $4, $0
/* EBEC4 001EBDC4 16002012 */  beqz       $17, .L001EBE20
/* EBEC8 001EBDC8 00000000 */   nop
/* EBECC 001EBDCC 28860070 */  paddub     $16, $0, $0
/* EBED0 001EBDD0 10000010 */  b          .L001EBE14
/* EBED4 001EBDD4 00000000 */   nop
.L001EBDD8:
/* EBED8 001EBDD8 28262072 */  paddub     $4, $17, $0
/* EBEDC 001EBDDC 1CAF070C */  jal        SeitonShopItemBoardSub__FP9ITEM_PACK
/* EBEE0 001EBDE0 00000000 */   nop
/* EBEE4 001EBDE4 0E004014 */  bnez       $2, .L001EBE20
/* EBEE8 001EBDE8 00000000 */   nop
/* EBEEC 001EBDEC 1088838F */  lw         $3, -0x77F0($gp)
/* EBEF0 001EBDF0 01006324 */  addiu      $3, $3, 0x1
/* EBEF4 001EBDF4 108883AF */  sw         $3, -0x77F0($gp)
/* EBEF8 001EBDF8 1088838F */  lw         $3, -0x77F0($gp)
/* EBEFC 001EBDFC 09006328 */  slti       $3, $3, 0x9
/* EBF00 001EBE00 03006014 */  bnez       $3, .L001EBE10
/* EBF04 001EBE04 00000000 */   nop
/* EBF08 001EBE08 01000324 */  addiu      $3, $0, 0x1
/* EBF0C 001EBE0C 108883AF */  sw         $3, -0x77F0($gp)
.L001EBE10:
/* EBF10 001EBE10 01001026 */  addiu      $16, $16, 0x1
.L001EBE14:
/* EBF14 001EBE14 0900032A */  slti       $3, $16, 0x9
/* EBF18 001EBE18 EFFF6014 */  bnez       $3, .L001EBDD8
/* EBF1C 001EBE1C 00000000 */   nop
.L001EBE20:
/* EBF20 001EBE20 2000BF7B */  lq         $31, 0x20($sp)
/* EBF24 001EBE24 1000B17B */  lq         $17, 0x10($sp)
/* EBF28 001EBE28 0000B07B */  lq         $16, 0x0($sp)
/* EBF2C 001EBE2C 3000BD27 */  addiu      $sp, $sp, 0x30
/* EBF30 001EBE30 0800E003 */  jr         $31
/* EBF34 001EBE34 00000000 */   nop
/* EBF38 001EBE38 00000000 */  nop
/* EBF3C 001EBE3C 00000000 */  nop
