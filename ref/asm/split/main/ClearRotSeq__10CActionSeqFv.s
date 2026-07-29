.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ClearRotSeq__10CActionSeqFv
/* 055260 00155160 F0FFBD27 */  addiu       $29, $29, -0x10
/* 055264 00155164 0000BF7F */  sq          $31, 0x0($29)
/* 055268 00155168 4053050C */  jal         NextMoveSeq__10CActionSeqFv
/* 05526C 0015516C 00000000 */   nop
/* 055270 00155170 04004010 */  beqz        $2, .L00155184
/* 055274 00155174 00000000 */   nop
/* 055278 00155178 07000324 */  addiu       $3, $0, 0x7
/* 05527C 0015517C 000043AC */  sw          $3, 0x0($2)
/* 055280 00155180 040040AC */  sw          $0, 0x4($2)
.L00155184:
/* 055284 00155184 0000BF7B */  lq          $31, 0x0($29)
/* 055288 00155188 1000BD27 */  addiu       $29, $29, 0x10
/* 05528C 0015518C 0800E003 */  jr          $31
/* 055290 00155190 00000000 */   nop
/* 055294 00155194 00000000 */  nop
/* 055298 00155198 00000000 */  nop
/* 05529C 0015519C 00000000 */  nop
