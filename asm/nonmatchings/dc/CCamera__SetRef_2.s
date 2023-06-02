.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRef__7CCameraFPf
/* 24410 00124310 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 24414 00124314 0000BF7F */  sq         $31, 0x0($sp)
/* 24418 00124318 2816A070 */  paddub     $2, $5, $0
/* 2441C 0012431C 282E0070 */  paddub     $5, $0, $0
/* 24420 00124320 00004CC4 */  lwc1       $f12, 0x0($2)
/* 24424 00124324 04004DC4 */  lwc1       $f13, 0x4($2)
/* 24428 00124328 08004EC4 */  lwc1       $f14, 0x8($2)
/* 2442C 0012432C BC90040C */  jal        SetRef__7CCameraFP6CFramefff
/* 24430 00124330 00000000 */   nop
/* 24434 00124334 0000BF7B */  lq         $31, 0x0($sp)
/* 24438 00124338 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2443C 0012433C 0800E003 */  jr         $31
/* 24440 00124340 00000000 */   nop
/* 24444 00124344 00000000 */  nop
/* 24448 00124348 00000000 */  nop
/* 2444C 0012434C 00000000 */  nop
