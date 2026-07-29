.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__10CVisualVu1Fv
/* 034FC0 00134EC0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 034FC4 00134EC4 1000BF7F */  sq          $31, 0x10($29)
/* 034FC8 00134EC8 0000B07F */  sq          $16, 0x0($29)
/* 034FCC 00134ECC 28868070 */  paddub      $16, $4, $0
/* 034FD0 00134ED0 D4D2040C */  jal         Initialize__7CVisualFv
/* 034FD4 00134ED4 00000000 */   nop
/* 034FD8 00134ED8 180000AE */  sw          $0, 0x18($16)
/* 034FDC 00134EDC 1C0000AE */  sw          $0, 0x1C($16)
/* 034FE0 00134EE0 100000AE */  sw          $0, 0x10($16)
/* 034FE4 00134EE4 140000AE */  sw          $0, 0x14($16)
/* 034FE8 00134EE8 1000BF7B */  lq          $31, 0x10($29)
/* 034FEC 00134EEC 0000B07B */  lq          $16, 0x0($29)
/* 034FF0 00134EF0 2000BD27 */  addiu       $29, $29, 0x20
/* 034FF4 00134EF4 0800E003 */  jr          $31
/* 034FF8 00134EF8 00000000 */   nop
/* 034FFC 00134EFC 00000000 */  nop
