.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SGET_GAME_FLAG__FP12RS_STACKDATAi
/* 095090 00194F90 E0FFBD27 */  addiu       $29, $29, -0x20
/* 095094 00194F94 1000BF7F */  sq          $31, 0x10($29)
/* 095098 00194F98 0000B07F */  sq          $16, 0x0($29)
/* 09509C 00194F9C 02000224 */  addiu       $2, $0, 0x2
/* 0950A0 00194FA0 0400A210 */  beq         $5, $2, .L00194FB4
/* 0950A4 00194FA4 00000000 */   nop
/* 0950A8 00194FA8 28160070 */  paddub      $2, $0, $0
/* 0950AC 00194FAC 0D000010 */  b           .L00194FE4
/* 0950B0 00194FB0 00000000 */   nop
.L00194FB4:
/* 0950B4 00194FB4 08009024 */  addiu       $16, $4, 0x8
/* 0950B8 00194FB8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0950BC 00194FBC 00000000 */   nop
/* 0950C0 00194FC0 1C8D848F */  lw          $4, -0x72E4($28)
/* 0950C4 00194FC4 282E4070 */  paddub      $5, $2, $0
/* 0950C8 00194FC8 8060050C */  jal         GetGameFlag__9CSaveDataFi
/* 0950CC 00194FCC 00000000 */   nop
/* 0950D0 00194FD0 28260072 */  paddub      $4, $16, $0
/* 0950D4 00194FD4 282E4070 */  paddub      $5, $2, $0
/* 0950D8 00194FD8 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 0950DC 00194FDC 00000000 */   nop
/* 0950E0 00194FE0 01000224 */  addiu       $2, $0, 0x1
.L00194FE4:
/* 0950E4 00194FE4 1000BF7B */  lq          $31, 0x10($29)
/* 0950E8 00194FE8 0000B07B */  lq          $16, 0x0($29)
/* 0950EC 00194FEC 2000BD27 */  addiu       $29, $29, 0x20
/* 0950F0 00194FF0 0800E003 */  jr          $31
/* 0950F4 00194FF4 00000000 */   nop
/* 0950F8 00194FF8 00000000 */  nop
/* 0950FC 00194FFC 00000000 */  nop
