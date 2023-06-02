.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandFLER_IMG__FPPv
/* 75350 00175250 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 75354 00175254 0000BF7F */  sq         $31, 0x0($sp)
/* 75358 00175258 0400828C */  lw         $2, 0x4($4)
/* 7535C 0017525C 0000868C */  lw         $6, 0x0($4)
/* 75360 00175260 17000424 */  addiu      $4, $0, 0x17
/* 75364 00175264 0000458C */  lw         $5, 0x0($2)
/* 75368 00175268 18D4050C */  jal        CommandIMGSub__FiiPc
/* 7536C 0017526C 00000000 */   nop
/* 75370 00175270 0000BF7B */  lq         $31, 0x0($sp)
/* 75374 00175274 1000BD27 */  addiu      $sp, $sp, 0x10
/* 75378 00175278 0800E003 */  jr         $31
/* 7537C 0017527C 00000000 */   nop
