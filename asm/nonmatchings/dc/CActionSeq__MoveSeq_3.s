.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MoveSeq__10CActionSeqFi
/* 55090 00154F90 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 55094 00154F94 0000BF7F */  sq         $31, 0x0($sp)
/* 55098 00154F98 2836A070 */  paddub     $6, $5, $0
/* 5509C 00154F9C 30008524 */  addiu      $5, $4, 0x30
/* 550A0 00154FA0 9453050C */  jal        MoveSeq__10CActionSeqFPfi
/* 550A4 00154FA4 00000000 */   nop
/* 550A8 00154FA8 0000BF7B */  lq         $31, 0x0($sp)
/* 550AC 00154FAC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 550B0 00154FB0 0800E003 */  jr         $31
/* 550B4 00154FB4 00000000 */   nop
/* 550B8 00154FB8 00000000 */  nop
/* 550BC 00154FBC 00000000 */  nop
