.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__13CVisualMDTVu1Fv
/* 035070 00134F70 E0FFBD27 */  addiu       $29, $29, -0x20
/* 035074 00134F74 1000BF7F */  sq          $31, 0x10($29)
/* 035078 00134F78 0000B07F */  sq          $16, 0x0($29)
/* 03507C 00134F7C 28868070 */  paddub      $16, $4, $0
/* 035080 00134F80 B0D3040C */  jal         Initialize__10CVisualVu1Fv
/* 035084 00134F84 00000000 */   nop
/* 035088 00134F88 240000AE */  sw          $0, 0x24($16)
/* 03508C 00134F8C 200000AE */  sw          $0, 0x20($16)
/* 035090 00134F90 2C0000AE */  sw          $0, 0x2C($16)
/* 035094 00134F94 280000AE */  sw          $0, 0x28($16)
/* 035098 00134F98 1000BF7B */  lq          $31, 0x10($29)
/* 03509C 00134F9C 0000B07B */  lq          $16, 0x0($29)
/* 0350A0 00134FA0 2000BD27 */  addiu       $29, $29, 0x20
/* 0350A4 00134FA4 0800E003 */  jr          $31
/* 0350A8 00134FA8 00000000 */   nop
/* 0350AC 00134FAC 00000000 */  nop
