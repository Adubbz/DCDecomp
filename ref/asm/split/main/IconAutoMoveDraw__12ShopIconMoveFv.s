.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel IconAutoMoveDraw__12ShopIconMoveFv
/* 0E6F00 001E6E00 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0E6F04 001E6E04 4000BF7F */  sq          $31, 0x40($29)
/* 0E6F08 001E6E08 3000B37F */  sq          $19, 0x30($29)
/* 0E6F0C 001E6E0C 2000B27F */  sq          $18, 0x20($29)
/* 0E6F10 001E6E10 1000B17F */  sq          $17, 0x10($29)
/* 0E6F14 001E6E14 0000B07F */  sq          $16, 0x0($29)
/* 0E6F18 001E6E18 28868070 */  paddub      $16, $4, $0
/* 0E6F1C 001E6E1C 10008484 */  lh          $4, 0x10($4)
/* 0E6F20 001E6E20 51008328 */  slti        $3, $4, 0x51
/* 0E6F24 001E6E24 28006014 */  bnez        $3, .L001E6EC8
/* 0E6F28 001E6E28 00000000 */   nop
/* 0E6F2C 001E6E2C 88C7080C */  jal         WhatIsKindofItem__Fi
/* 0E6F30 001E6E30 00000000 */   nop
/* 0E6F34 001E6E34 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0E6F38 001E6E38 DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0E6F3C 001E6E3C 22006214 */  bne         $3, $2, .L001E6EC8
/* 0E6F40 001E6E40 00000000 */   nop
/* 0E6F44 001E6E44 28960070 */  paddub      $18, $0, $0
/* 0E6F48 001E6E48 10001386 */  lh          $19, 0x10($16)
/* 0E6F4C 001E6E4C 5A000224 */  addiu       $2, $0, 0x5A
/* 0E6F50 001E6E50 03006216 */  bne         $19, $2, .L001E6E60
/* 0E6F54 001E6E54 00000000 */   nop
/* 0E6F58 001E6E58 16001286 */  lh          $18, 0x16($16)
/* 0E6F5C 001E6E5C 00000000 */  nop
.L001E6E60:
/* 0E6F60 001E6E60 5B00622A */  slti        $2, $19, 0x5B
/* 0E6F64 001E6E64 08004014 */  bnez        $2, .L001E6E88
/* 0E6F68 001E6E68 00000000 */   nop
/* 0E6F6C 001E6E6C 5F00612A */  slti        $1, $19, 0x5F
/* 0E6F70 001E6E70 05002010 */  beqz        $1, .L001E6E88
/* 0E6F74 001E6E74 00000000 */   nop
/* 0E6F78 001E6E78 40101300 */  sll         $2, $19, 1
/* 0E6F7C 001E6E7C 21105000 */  addu        $2, $2, $16
/* 0E6F80 001E6E80 66FF5284 */  lh          $18, -0x9A($2)
/* 0E6F84 001E6E84 00000000 */  nop
.L001E6E88:
/* 0E6F88 001E6E88 08000CC6 */  lwc1        $f12, 0x8($16)
/* 0E6F8C 001E6E8C 2C44040C */  jal         fptosi
/* 0E6F90 001E6E90 00000000 */   nop
/* 0E6F94 001E6E94 288E4070 */  paddub      $17, $2, $0
/* 0E6F98 001E6E98 0C000CC6 */  lwc1        $f12, 0xC($16)
/* 0E6F9C 001E6E9C 2C44040C */  jal         fptosi
/* 0E6FA0 001E6EA0 00000000 */   nop
/* 0E6FA4 001E6EA4 28266072 */  paddub      $4, $19, $0
/* 0E6FA8 001E6EA8 282E2072 */  paddub      $5, $17, $0
/* 0E6FAC 001E6EAC 28364070 */  paddub      $6, $2, $0
/* 0E6FB0 001E6EB0 283E0070 */  paddub      $7, $0, $0
/* 0E6FB4 001E6EB4 80020824 */  addiu       $8, $0, 0x280
/* 0E6FB8 001E6EB8 80000924 */  addiu       $9, $0, 0x80
/* 0E6FBC 001E6EBC 28564072 */  paddub      $10, $18, $0
/* 0E6FC0 001E6EC0 68B5080C */  jal         DrawIconParts__Fiiiiiii
/* 0E6FC4 001E6EC4 00000000 */   nop
.L001E6EC8:
/* 0E6FC8 001E6EC8 4000BF7B */  lq          $31, 0x40($29)
/* 0E6FCC 001E6ECC 3000B37B */  lq          $19, 0x30($29)
/* 0E6FD0 001E6ED0 2000B27B */  lq          $18, 0x20($29)
/* 0E6FD4 001E6ED4 1000B17B */  lq          $17, 0x10($29)
/* 0E6FD8 001E6ED8 0000B07B */  lq          $16, 0x0($29)
/* 0E6FDC 001E6EDC 5000BD27 */  addiu       $29, $29, 0x50
/* 0E6FE0 001E6EE0 0800E003 */  jr          $31
/* 0E6FE4 001E6EE4 00000000 */   nop
/* 0E6FE8 001E6EE8 00000000 */  nop
/* 0E6FEC 001E6EEC 00000000 */  nop
