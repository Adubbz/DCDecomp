.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdFishingLostEsaMes__Fv
/* 073B30 00173A30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 073B34 00173A34 0000BF7F */  sq          $31, 0x0($29)
/* 073B38 00173A38 848F80AF */  sw          $0, -0x707C($28)
/* 073B3C 00173A3C 888F80AF */  sw          $0, -0x7078($28)
/* 073B40 00173A40 D2000424 */  addiu       $4, $0, 0xD2
/* 073B44 00173A44 B4000524 */  addiu       $5, $0, 0xB4
/* 073B48 00173A48 08000624 */  addiu       $6, $0, 0x8
/* 073B4C 00173A4C 283E0070 */  paddub      $7, $0, $0
/* 073B50 00173A50 FFFF0824 */  addiu       $8, $0, -0x1
/* 073B54 00173A54 28CD050C */  jal         EdSetHelpMes__FiiiPii
/* 073B58 00173A58 00000000 */   nop
/* 073B5C 00173A5C 0000BF7B */  lq          $31, 0x0($29)
/* 073B60 00173A60 1000BD27 */  addiu       $29, $29, 0x10
/* 073B64 00173A64 0800E003 */  jr          $31
/* 073B68 00173A68 00000000 */   nop
/* 073B6C 00173A6C 00000000 */  nop
