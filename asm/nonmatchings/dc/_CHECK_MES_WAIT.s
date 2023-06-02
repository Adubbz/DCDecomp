.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CHECK_MES_WAIT__FP12RS_STACKDATAi
/* 90250 00190150 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 90254 00190154 1000BF7F */  sq         $31, 0x10($sp)
/* 90258 00190158 0000B07F */  sq         $16, 0x0($sp)
/* 9025C 0019015C 0200A128 */  slti       $at, $5, 0x2
/* 90260 00190160 04002010 */  beqz       $at, .L00190174
/* 90264 00190164 00000000 */   nop
/* 90268 00190168 28160070 */  paddub     $2, $0, $0
/* 9026C 0019016C 15000010 */  b          .L001901C4
/* 90270 00190170 00000000 */   nop
.L00190174:
/* 90274 00190174 08009024 */  addiu      $16, $4, 0x8
/* 90278 00190178 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9027C 0019017C 00000000 */   nop
/* 90280 00190180 28264070 */  paddub     $4, $2, $0
/* 90284 00190184 643E060C */  jal        GetMes__Fi
/* 90288 00190188 00000000 */   nop
/* 9028C 0019018C 04004014 */  bnez       $2, .L001901A0
/* 90290 00190190 00000000 */   nop
/* 90294 00190194 28160070 */  paddub     $2, $0, $0
/* 90298 00190198 0A000010 */  b          .L001901C4
/* 9029C 0019019C 00000000 */   nop
.L001901A0:
/* 902A0 001901A0 28264070 */  paddub     $4, $2, $0
/* 902A4 001901A4 2038050C */  jal        State__6ClsMesFv
/* 902A8 001901A8 00000000 */   nop
/* 902AC 001901AC 05004238 */  xori       $2, $2, 0x5
/* 902B0 001901B0 0100452C */  sltiu      $5, $2, 0x1
/* 902B4 001901B4 28260072 */  paddub     $4, $16, $0
/* 902B8 001901B8 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 902BC 001901BC 00000000 */   nop
/* 902C0 001901C0 01000224 */  addiu      $2, $0, 0x1
.L001901C4:
/* 902C4 001901C4 1000BF7B */  lq         $31, 0x10($sp)
/* 902C8 001901C8 0000B07B */  lq         $16, 0x0($sp)
/* 902CC 001901CC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 902D0 001901D0 0800E003 */  jr         $31
/* 902D4 001901D4 00000000 */   nop
/* 902D8 001901D8 00000000 */  nop
/* 902DC 001901DC 00000000 */  nop