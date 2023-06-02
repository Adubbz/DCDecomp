.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CHECK_MES_COMPLETE__FP12RS_STACKDATAi
/* 901C0 001900C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 901C4 001900C4 1000BF7F */  sq         $31, 0x10($sp)
/* 901C8 001900C8 0000B07F */  sq         $16, 0x0($sp)
/* 901CC 001900CC 0200A128 */  slti       $at, $5, 0x2
/* 901D0 001900D0 04002010 */  beqz       $at, .L001900E4
/* 901D4 001900D4 00000000 */   nop
/* 901D8 001900D8 28160070 */  paddub     $2, $0, $0
/* 901DC 001900DC 15000010 */  b          .L00190134
/* 901E0 001900E0 00000000 */   nop
.L001900E4:
/* 901E4 001900E4 08009024 */  addiu      $16, $4, 0x8
/* 901E8 001900E8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 901EC 001900EC 00000000 */   nop
/* 901F0 001900F0 28264070 */  paddub     $4, $2, $0
/* 901F4 001900F4 643E060C */  jal        GetMes__Fi
/* 901F8 001900F8 00000000 */   nop
/* 901FC 001900FC 04004014 */  bnez       $2, .L00190110
/* 90200 00190100 00000000 */   nop
/* 90204 00190104 28160070 */  paddub     $2, $0, $0
/* 90208 00190108 0A000010 */  b          .L00190134
/* 9020C 0019010C 00000000 */   nop
.L00190110:
/* 90210 00190110 28264070 */  paddub     $4, $2, $0
/* 90214 00190114 2038050C */  jal        State__6ClsMesFv
/* 90218 00190118 00000000 */   nop
/* 9021C 0019011C 03004238 */  xori       $2, $2, 0x3
/* 90220 00190120 0100452C */  sltiu      $5, $2, 0x1
/* 90224 00190124 28260072 */  paddub     $4, $16, $0
/* 90228 00190128 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 9022C 0019012C 00000000 */   nop
/* 90230 00190130 01000224 */  addiu      $2, $0, 0x1
.L00190134:
/* 90234 00190134 1000BF7B */  lq         $31, 0x10($sp)
/* 90238 00190138 0000B07B */  lq         $16, 0x0($sp)
/* 9023C 0019013C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 90240 00190140 0800E003 */  jr         $31
/* 90244 00190144 00000000 */   nop
/* 90248 00190148 00000000 */  nop
/* 9024C 0019014C 00000000 */  nop
