.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandFLER_IMG__FPPv
/* 075350 00175250 F0FFBD27 */  addiu       $29, $29, -0x10
/* 075354 00175254 0000BF7F */  sq          $31, 0x0($29)
/* 075358 00175258 0400828C */  lw          $2, 0x4($4)
/* 07535C 0017525C 0000868C */  lw          $6, 0x0($4)
/* 075360 00175260 17000424 */  addiu       $4, $0, 0x17
/* 075364 00175264 0000458C */  lw          $5, 0x0($2)
/* 075368 00175268 18D4050C */  jal         CommandIMGSub__FiiPc
/* 07536C 0017526C 00000000 */   nop
/* 075370 00175270 0000BF7B */  lq          $31, 0x0($29)
/* 075374 00175274 1000BD27 */  addiu       $29, $29, 0x10
/* 075378 00175278 0800E003 */  jr          $31
/* 07537C 0017527C 00000000 */   nop
