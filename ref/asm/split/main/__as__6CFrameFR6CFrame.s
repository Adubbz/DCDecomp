.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __as__6CFrameFR6CFrame
/* 028FB0 00128EB0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 028FB4 00128EB4 1000BF7F */  sq          $31, 0x10($29)
/* 028FB8 00128EB8 0000B07F */  sq          $16, 0x0($29)
/* 028FBC 00128EBC 28868070 */  paddub      $16, $4, $0
/* 028FC0 00128EC0 60020624 */  addiu       $6, $0, 0x260
/* 028FC4 00128EC4 EC0C040C */  jal         memcpy
/* 028FC8 00128EC8 00000000 */   nop
/* 028FCC 00128ECC 3C0100AE */  sw          $0, 0x13C($16)
/* 028FD0 00128ED0 380100AE */  sw          $0, 0x138($16)
/* 028FD4 00128ED4 100100AE */  sw          $0, 0x110($16)
/* 028FD8 00128ED8 400200AE */  sw          $0, 0x240($16)
/* 028FDC 00128EDC 440200AE */  sw          $0, 0x244($16)
/* 028FE0 00128EE0 28160072 */  paddub      $2, $16, $0
/* 028FE4 00128EE4 1000BF7B */  lq          $31, 0x10($29)
/* 028FE8 00128EE8 0000B07B */  lq          $16, 0x0($29)
/* 028FEC 00128EEC 2000BD27 */  addiu       $29, $29, 0x20
/* 028FF0 00128EF0 0800E003 */  jr          $31
/* 028FF4 00128EF4 00000000 */   nop
/* 028FF8 00128EF8 00000000 */  nop
/* 028FFC 00128EFC 00000000 */  nop
