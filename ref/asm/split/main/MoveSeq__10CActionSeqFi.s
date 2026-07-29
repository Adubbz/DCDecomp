.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MoveSeq__10CActionSeqFi
/* 055090 00154F90 F0FFBD27 */  addiu       $29, $29, -0x10
/* 055094 00154F94 0000BF7F */  sq          $31, 0x0($29)
/* 055098 00154F98 2836A070 */  paddub      $6, $5, $0
/* 05509C 00154F9C 30008524 */  addiu       $5, $4, 0x30
/* 0550A0 00154FA0 9453050C */  jal         MoveSeq__10CActionSeqFPfi
/* 0550A4 00154FA4 00000000 */   nop
/* 0550A8 00154FA8 0000BF7B */  lq          $31, 0x0($29)
/* 0550AC 00154FAC 1000BD27 */  addiu       $29, $29, 0x10
/* 0550B0 00154FB0 0800E003 */  jr          $31
/* 0550B4 00154FB4 00000000 */   nop
/* 0550B8 00154FB8 00000000 */  nop
/* 0550BC 00154FBC 00000000 */  nop
