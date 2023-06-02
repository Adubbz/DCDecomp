.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel In__5FaderFv
/* 1452F0 002451F0 0000828C */  lw         $2, 0x0($4)
/* 1452F4 002451F4 80004128 */  slti       $at, $2, 0x80
/* 1452F8 002451F8 0C002010 */  beqz       $at, .L0024522C
/* 1452FC 002451FC 00000000 */   nop
/* 145300 00245200 04004224 */  addiu      $2, $2, 0x4
/* 145304 00245204 000082AC */  sw         $2, 0x0($4)
/* 145308 00245208 0000828C */  lw         $2, 0x0($4)
/* 14530C 0024520C 81004128 */  slti       $at, $2, 0x81
/* 145310 00245210 03002014 */  bnez       $at, .L00245220
/* 145314 00245214 00000000 */   nop
/* 145318 00245218 80000224 */  addiu      $2, $0, 0x80
/* 14531C 0024521C 000082AC */  sw         $2, 0x0($4)
.L00245220:
/* 145320 00245220 28160070 */  paddub     $2, $0, $0
/* 145324 00245224 02000010 */  b          .L00245230
/* 145328 00245228 00000000 */   nop
.L0024522C:
/* 14532C 0024522C 01000224 */  addiu      $2, $0, 0x1
.L00245230:
/* 145330 00245230 0800E003 */  jr         $31
/* 145334 00245234 00000000 */   nop
/* 145338 00245238 00000000 */  nop
/* 14533C 0024523C 00000000 */  nop
