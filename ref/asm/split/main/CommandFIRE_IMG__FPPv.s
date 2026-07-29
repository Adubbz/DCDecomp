.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandFIRE_IMG__FPPv
/* 075320 00175220 F0FFBD27 */  addiu       $29, $29, -0x10
/* 075324 00175224 0000BF7F */  sq          $31, 0x0($29)
/* 075328 00175228 0400828C */  lw          $2, 0x4($4)
/* 07532C 0017522C 0000868C */  lw          $6, 0x0($4)
/* 075330 00175230 18000424 */  addiu       $4, $0, 0x18
/* 075334 00175234 0000458C */  lw          $5, 0x0($2)
/* 075338 00175238 18D4050C */  jal         CommandIMGSub__FiiPc
/* 07533C 0017523C 00000000 */   nop
/* 075340 00175240 0000BF7B */  lq          $31, 0x0($29)
/* 075344 00175244 1000BD27 */  addiu       $29, $29, 0x10
/* 075348 00175248 0800E003 */  jr          $31
/* 07534C 0017524C 00000000 */   nop
