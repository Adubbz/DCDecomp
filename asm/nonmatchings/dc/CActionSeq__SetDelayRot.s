.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetDelayRot__10CActionSeqFi
/* 55340 00155240 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 55344 00155244 1000BF7F */  sq         $31, 0x10($sp)
/* 55348 00155248 0000B07F */  sq         $16, 0x0($sp)
/* 5534C 0015524C 2886A070 */  paddub     $16, $5, $0
/* 55350 00155250 4053050C */  jal        NextMoveSeq__10CActionSeqFv
/* 55354 00155254 00000000 */   nop
/* 55358 00155258 04004010 */  beqz       $2, .L0015526C
/* 5535C 0015525C 00000000 */   nop
/* 55360 00155260 0B000324 */  addiu      $3, $0, 0xB
/* 55364 00155264 000043AC */  sw         $3, 0x0($2)
/* 55368 00155268 040050AC */  sw         $16, 0x4($2)
.L0015526C:
/* 5536C 0015526C 1000BF7B */  lq         $31, 0x10($sp)
/* 55370 00155270 0000B07B */  lq         $16, 0x0($sp)
/* 55374 00155274 2000BD27 */  addiu      $sp, $sp, 0x20
/* 55378 00155278 0800E003 */  jr         $31
/* 5537C 0015527C 00000000 */   nop
