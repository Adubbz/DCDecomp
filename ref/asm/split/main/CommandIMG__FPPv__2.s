.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandIMG__FPPv__2
/* 075380 00175280 F0FFBD27 */  addiu       $29, $29, -0x10
/* 075384 00175284 0000BF7F */  sq          $31, 0x0($29)
/* 075388 00175288 0800828C */  lw          $2, 0x8($4)
/* 07538C 0017528C 0000458C */  lw          $5, 0x0($2)
/* 075390 00175290 0400868C */  lw          $6, 0x4($4)
/* 075394 00175294 2826A070 */  paddub      $4, $5, $0
/* 075398 00175298 18D4050C */  jal         CommandIMGSub__FiiPc
/* 07539C 0017529C 00000000 */   nop
/* 0753A0 001752A0 0000BF7B */  lq          $31, 0x0($29)
/* 0753A4 001752A4 1000BD27 */  addiu       $29, $29, 0x10
/* 0753A8 001752A8 0800E003 */  jr          $31
/* 0753AC 001752AC 00000000 */   nop
