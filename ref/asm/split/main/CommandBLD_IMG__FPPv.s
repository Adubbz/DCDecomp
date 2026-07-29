.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandBLD_IMG__FPPv
/* 075230 00175130 F0FFBD27 */  addiu       $29, $29, -0x10
/* 075234 00175134 0000BF7F */  sq          $31, 0x0($29)
/* 075238 00175138 0400828C */  lw          $2, 0x4($4)
/* 07523C 0017513C 0000868C */  lw          $6, 0x0($4)
/* 075240 00175140 02000424 */  addiu       $4, $0, 0x2
/* 075244 00175144 0000458C */  lw          $5, 0x0($2)
/* 075248 00175148 18D4050C */  jal         CommandIMGSub__FiiPc
/* 07524C 0017514C 00000000 */   nop
/* 075250 00175150 0000BF7B */  lq          $31, 0x0($29)
/* 075254 00175154 1000BD27 */  addiu       $29, $29, 0x10
/* 075258 00175158 0800E003 */  jr          $31
/* 07525C 0017515C 00000000 */   nop
