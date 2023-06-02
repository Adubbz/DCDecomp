.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearRotSeq__10CActionSeqFv
/* 55260 00155160 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 55264 00155164 0000BF7F */  sq         $31, 0x0($sp)
/* 55268 00155168 4053050C */  jal        NextMoveSeq__10CActionSeqFv
/* 5526C 0015516C 00000000 */   nop
/* 55270 00155170 04004010 */  beqz       $2, .L00155184
/* 55274 00155174 00000000 */   nop
/* 55278 00155178 07000324 */  addiu      $3, $0, 0x7
/* 5527C 0015517C 000043AC */  sw         $3, 0x0($2)
/* 55280 00155180 040040AC */  sw         $0, 0x4($2)
.L00155184:
/* 55284 00155184 0000BF7B */  lq         $31, 0x0($sp)
/* 55288 00155188 1000BD27 */  addiu      $sp, $sp, 0x10
/* 5528C 0015518C 0800E003 */  jr         $31
/* 55290 00155190 00000000 */   nop
/* 55294 00155194 00000000 */  nop
/* 55298 00155198 00000000 */  nop
/* 5529C 0015519C 00000000 */  nop
