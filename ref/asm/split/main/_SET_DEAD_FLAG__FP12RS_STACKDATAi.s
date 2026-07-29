.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_DEAD_FLAG__FP12RS_STACKDATAi
/* 0BD070 001BCF70 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD074 001BCF74 0000BF7F */  sq          $31, 0x0($29)
/* 0BD078 001BCF78 789C848F */  lw          $4, -0x6388($28)
/* 0BD07C 001BCF7C BCFB060C */  jal         SetDead__14CDngStatusDataFv
/* 0BD080 001BCF80 00000000 */   nop
/* 0BD084 001BCF84 01000224 */  addiu       $2, $0, 0x1
/* 0BD088 001BCF88 0000BF7B */  lq          $31, 0x0($29)
/* 0BD08C 001BCF8C 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD090 001BCF90 0800E003 */  jr          $31
/* 0BD094 001BCF94 00000000 */   nop
/* 0BD098 001BCF98 00000000 */  nop
/* 0BD09C 001BCF9C 00000000 */  nop
