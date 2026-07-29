.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__10CMapObjectFv
/* 057A10 00157910 E0FFBD27 */  addiu       $29, $29, -0x20
/* 057A14 00157914 1000BF7F */  sq          $31, 0x10($29)
/* 057A18 00157918 0000B07F */  sq          $16, 0x0($29)
/* 057A1C 0015791C 28868070 */  paddub      $16, $4, $0
/* 057A20 00157920 282E0070 */  paddub      $5, $0, $0
/* 057A24 00157924 185D050C */  jal         Initialize__12CObjectFrameFP9CFrameVu1
/* 057A28 00157928 00000000 */   nop
/* 057A2C 0015792C FFFF0324 */  addiu       $3, $0, -0x1
/* 057A30 00157930 E80003AE */  sw          $3, 0xE8($16)
/* 057A34 00157934 E40003AE */  sw          $3, 0xE4($16)
/* 057A38 00157938 D40000AE */  sw          $0, 0xD4($16)
/* 057A3C 0015793C D80000AE */  sw          $0, 0xD8($16)
/* 057A40 00157940 D00000AE */  sw          $0, 0xD0($16)
/* 057A44 00157944 DC0000AE */  sw          $0, 0xDC($16)
/* 057A48 00157948 00C1033C */  lui         $3, (0xC1000000 >> 16)
/* 057A4C 0015794C E00003AE */  sw          $3, 0xE0($16)
/* 057A50 00157950 1000BF7B */  lq          $31, 0x10($29)
/* 057A54 00157954 0000B07B */  lq          $16, 0x0($29)
/* 057A58 00157958 2000BD27 */  addiu       $29, $29, 0x20
/* 057A5C 0015795C 0800E003 */  jr          $31
/* 057A60 00157960 00000000 */   nop
/* 057A64 00157964 00000000 */  nop
/* 057A68 00157968 00000000 */  nop
/* 057A6C 0015796C 00000000 */  nop
