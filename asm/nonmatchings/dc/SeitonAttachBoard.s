.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SeitonAttachBoard__FP11ATTACH_LIST
/* 131E90 00231D90 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 131E94 00231D94 2000BF7F */  sq         $31, 0x20($sp)
/* 131E98 00231D98 1000B17F */  sq         $17, 0x10($sp)
/* 131E9C 00231D9C 0000B07F */  sq         $16, 0x0($sp)
/* 131EA0 00231DA0 288E8070 */  paddub     $17, $4, $0
/* 131EA4 00231DA4 04002016 */  bnez       $17, .L00231DB8
/* 131EA8 00231DA8 00000000 */   nop
/* 131EAC 00231DAC 28160070 */  paddub     $2, $0, $0
/* 131EB0 00231DB0 15000010 */  b          .L00231E08
/* 131EB4 00231DB4 00000000 */   nop
.L00231DB8:
/* 131EB8 00231DB8 28860070 */  paddub     $16, $0, $0
/* 131EBC 00231DBC 0F000010 */  b          .L00231DFC
/* 131EC0 00231DC0 00000000 */   nop
.L00231DC4:
/* 131EC4 00231DC4 28262072 */  paddub     $4, $17, $0
/* 131EC8 00231DC8 1CC7080C */  jal        SeitonAttachBoardSub__FP11ATTACH_LIST_2
/* 131ECC 00231DCC 00000000 */   nop
/* 131ED0 00231DD0 0D004014 */  bnez       $2, .L00231E08
/* 131ED4 00231DD4 00000000 */   nop
/* 131ED8 00231DD8 C489838F */  lw         $3, -0x763C($gp)
/* 131EDC 00231DDC 01006324 */  addiu      $3, $3, 0x1
/* 131EE0 00231DE0 C48983AF */  sw         $3, -0x763C($gp)
/* 131EE4 00231DE4 C489838F */  lw         $3, -0x763C($gp)
/* 131EE8 00231DE8 05006328 */  slti       $3, $3, 0x5
/* 131EEC 00231DEC 02006014 */  bnez       $3, .L00231DF8
/* 131EF0 00231DF0 00000000 */   nop
/* 131EF4 00231DF4 C48980AF */  sw         $0, -0x763C($gp)
.L00231DF8:
/* 131EF8 00231DF8 01001026 */  addiu      $16, $16, 0x1
.L00231DFC:
/* 131EFC 00231DFC 0500032A */  slti       $3, $16, 0x5
/* 131F00 00231E00 F0FF6014 */  bnez       $3, .L00231DC4
/* 131F04 00231E04 00000000 */   nop
.L00231E08:
/* 131F08 00231E08 2000BF7B */  lq         $31, 0x20($sp)
/* 131F0C 00231E0C 1000B17B */  lq         $17, 0x10($sp)
/* 131F10 00231E10 0000B07B */  lq         $16, 0x0($sp)
/* 131F14 00231E14 3000BD27 */  addiu      $sp, $sp, 0x30
/* 131F18 00231E18 0800E003 */  jr         $31
/* 131F1C 00231E1C 00000000 */   nop
