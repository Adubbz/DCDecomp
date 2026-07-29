.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandGRD_IMG__FPPv
/* 075200 00175100 F0FFBD27 */  addiu       $29, $29, -0x10
/* 075204 00175104 0000BF7F */  sq          $31, 0x0($29)
/* 075208 00175108 0400828C */  lw          $2, 0x4($4)
/* 07520C 0017510C 0000868C */  lw          $6, 0x0($4)
/* 075210 00175110 01000424 */  addiu       $4, $0, 0x1
/* 075214 00175114 0000458C */  lw          $5, 0x0($2)
/* 075218 00175118 18D4050C */  jal         CommandIMGSub__FiiPc
/* 07521C 0017511C 00000000 */   nop
/* 075220 00175120 0000BF7B */  lq          $31, 0x0($29)
/* 075224 00175124 1000BD27 */  addiu       $29, $29, 0x10
/* 075228 00175128 0800E003 */  jr          $31
/* 07522C 0017512C 00000000 */   nop
