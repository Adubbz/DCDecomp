.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetDelayRot__10CActionSeqFi
/* 055340 00155240 E0FFBD27 */  addiu       $29, $29, -0x20
/* 055344 00155244 1000BF7F */  sq          $31, 0x10($29)
/* 055348 00155248 0000B07F */  sq          $16, 0x0($29)
/* 05534C 0015524C 2886A070 */  paddub      $16, $5, $0
/* 055350 00155250 4053050C */  jal         NextMoveSeq__10CActionSeqFv
/* 055354 00155254 00000000 */   nop
/* 055358 00155258 04004010 */  beqz        $2, .L0015526C
/* 05535C 0015525C 00000000 */   nop
/* 055360 00155260 0B000324 */  addiu       $3, $0, 0xB
/* 055364 00155264 000043AC */  sw          $3, 0x0($2)
/* 055368 00155268 040050AC */  sw          $16, 0x4($2)
.L0015526C:
/* 05536C 0015526C 1000BF7B */  lq          $31, 0x10($29)
/* 055370 00155270 0000B07B */  lq          $16, 0x0($29)
/* 055374 00155274 2000BD27 */  addiu       $29, $29, 0x20
/* 055378 00155278 0800E003 */  jr          $31
/* 05537C 0015527C 00000000 */   nop
