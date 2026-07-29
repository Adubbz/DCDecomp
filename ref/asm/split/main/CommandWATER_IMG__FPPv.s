.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandWATER_IMG__FPPv
/* 0752F0 001751F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0752F4 001751F4 0000BF7F */  sq          $31, 0x0($29)
/* 0752F8 001751F8 0400828C */  lw          $2, 0x4($4)
/* 0752FC 001751FC 0000868C */  lw          $6, 0x0($4)
/* 075300 00175200 15000424 */  addiu       $4, $0, 0x15
/* 075304 00175204 0000458C */  lw          $5, 0x0($2)
/* 075308 00175208 18D4050C */  jal         CommandIMGSub__FiiPc
/* 07530C 0017520C 00000000 */   nop
/* 075310 00175210 0000BF7B */  lq          $31, 0x0($29)
/* 075314 00175214 1000BD27 */  addiu       $29, $29, 0x10
/* 075318 00175218 0800E003 */  jr          $31
/* 07531C 0017521C 00000000 */   nop
