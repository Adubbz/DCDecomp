.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SGET_MAP_FLAG__FP12RS_STACKDATAi
/* 952C0 001951C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 952C4 001951C4 1000BF7F */  sq         $31, 0x10($sp)
/* 952C8 001951C8 0000B07F */  sq         $16, 0x0($sp)
/* 952CC 001951CC 08009024 */  addiu      $16, $4, 0x8
/* 952D0 001951D0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 952D4 001951D4 00000000 */   nop
/* 952D8 001951D8 28264070 */  paddub     $4, $2, $0
/* 952DC 001951DC 14E0050C */  jal        EdGetMapFlag__Fi
/* 952E0 001951E0 00000000 */   nop
/* 952E4 001951E4 2B100200 */  sltu       $2, $0, $2
/* 952E8 001951E8 01004238 */  xori       $2, $2, 0x1
/* 952EC 001951EC FF004530 */  andi       $5, $2, 0xFF
/* 952F0 001951F0 28260072 */  paddub     $4, $16, $0
/* 952F4 001951F4 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 952F8 001951F8 00000000 */   nop
/* 952FC 001951FC 01000224 */  addiu      $2, $0, 0x1
/* 95300 00195200 1000BF7B */  lq         $31, 0x10($sp)
/* 95304 00195204 0000B07B */  lq         $16, 0x0($sp)
/* 95308 00195208 2000BD27 */  addiu      $sp, $sp, 0x20
/* 9530C 0019520C 0800E003 */  jr         $31
/* 95310 00195210 00000000 */   nop
/* 95314 00195214 00000000 */  nop
/* 95318 00195218 00000000 */  nop
/* 9531C 0019521C 00000000 */  nop
