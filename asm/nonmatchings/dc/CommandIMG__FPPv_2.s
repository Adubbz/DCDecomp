.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandIMG__FPPv_2
/* 75380 00175280 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 75384 00175284 0000BF7F */  sq         $31, 0x0($sp)
/* 75388 00175288 0800828C */  lw         $2, 0x8($4)
/* 7538C 0017528C 0000458C */  lw         $5, 0x0($2)
/* 75390 00175290 0400868C */  lw         $6, 0x4($4)
/* 75394 00175294 2826A070 */  paddub     $4, $5, $0
/* 75398 00175298 18D4050C */  jal        CommandIMGSub__FiiPc
/* 7539C 0017529C 00000000 */   nop
/* 753A0 001752A0 0000BF7B */  lq         $31, 0x0($sp)
/* 753A4 001752A4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 753A8 001752A8 0800E003 */  jr         $31
/* 753AC 001752AC 00000000 */   nop
