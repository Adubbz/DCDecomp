.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SeitonItemBoard__FP9ITEM_PACK
/* 131B40 00231A40 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 131B44 00231A44 2000BF7F */  sq         $31, 0x20($sp)
/* 131B48 00231A48 1000B17F */  sq         $17, 0x10($sp)
/* 131B4C 00231A4C 0000B07F */  sq         $16, 0x0($sp)
/* 131B50 00231A50 288E8070 */  paddub     $17, $4, $0
/* 131B54 00231A54 16002012 */  beqz       $17, .L00231AB0
/* 131B58 00231A58 00000000 */   nop
/* 131B5C 00231A5C 28860070 */  paddub     $16, $0, $0
/* 131B60 00231A60 10000010 */  b          .L00231AA4
/* 131B64 00231A64 00000000 */   nop
.L00231A68:
/* 131B68 00231A68 28262072 */  paddub     $4, $17, $0
/* 131B6C 00231A6C 48C6080C */  jal        SeitonItemBoardSub__FP9ITEM_PACK
/* 131B70 00231A70 00000000 */   nop
/* 131B74 00231A74 0E004014 */  bnez       $2, .L00231AB0
/* 131B78 00231A78 00000000 */   nop
/* 131B7C 00231A7C C089838F */  lw         $3, -0x7640($gp)
/* 131B80 00231A80 01006324 */  addiu      $3, $3, 0x1
/* 131B84 00231A84 C08983AF */  sw         $3, -0x7640($gp)
/* 131B88 00231A88 C089838F */  lw         $3, -0x7640($gp)
/* 131B8C 00231A8C 09006328 */  slti       $3, $3, 0x9
/* 131B90 00231A90 03006014 */  bnez       $3, .L00231AA0
/* 131B94 00231A94 00000000 */   nop
/* 131B98 00231A98 01000324 */  addiu      $3, $0, 0x1
/* 131B9C 00231A9C C08983AF */  sw         $3, -0x7640($gp)
.L00231AA0:
/* 131BA0 00231AA0 01001026 */  addiu      $16, $16, 0x1
.L00231AA4:
/* 131BA4 00231AA4 0900032A */  slti       $3, $16, 0x9
/* 131BA8 00231AA8 EFFF6014 */  bnez       $3, .L00231A68
/* 131BAC 00231AAC 00000000 */   nop
.L00231AB0:
/* 131BB0 00231AB0 2000BF7B */  lq         $31, 0x20($sp)
/* 131BB4 00231AB4 1000B17B */  lq         $17, 0x10($sp)
/* 131BB8 00231AB8 0000B07B */  lq         $16, 0x0($sp)
/* 131BBC 00231ABC 3000BD27 */  addiu      $sp, $sp, 0x30
/* 131BC0 00231AC0 0800E003 */  jr         $31
/* 131BC4 00231AC4 00000000 */   nop
/* 131BC8 00231AC8 00000000 */  nop
/* 131BCC 00231ACC 00000000 */  nop
