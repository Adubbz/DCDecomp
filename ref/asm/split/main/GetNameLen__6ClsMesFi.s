.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetNameLen__6ClsMesFi
/* 04CCD0 0014CBD0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 04CCD4 0014CBD4 0000BF7F */  sq          $31, 0x0($29)
/* 04CCD8 0014CBD8 0400A104 */  bgez        $5, .L0014CBEC
/* 04CCDC 0014CBDC 00000000 */   nop
/* 04CCE0 0014CBE0 FFFF0224 */  addiu       $2, $0, -0x1
/* 04CCE4 0014CBE4 1A000010 */  b           .L0014CC50
/* 04CCE8 0014CBE8 00000000 */   nop
.L0014CBEC:
/* 04CCEC 0014CBEC 0600A228 */  slti        $2, $5, 0x6
/* 04CCF0 0014CBF0 04004014 */  bnez        $2, .L0014CC04
/* 04CCF4 0014CBF4 00000000 */   nop
/* 04CCF8 0014CBF8 FFFF0224 */  addiu       $2, $0, -0x1
/* 04CCFC 0014CBFC 14000010 */  b           .L0014CC50
/* 04CD00 0014CC00 00000000 */   nop
.L0014CC04:
/* 04CD04 0014CC04 1C8D848F */  lw          $4, -0x72E4($28)
/* 04CD08 0014CC08 D45E050C */  jal         GetCharaName__9CSaveDataFi
/* 04CD0C 0014CC0C 00000000 */   nop
/* 04CD10 0014CC10 28260070 */  paddub      $4, $0, $0
/* 04CD14 0014CC14 0A000010 */  b           .L0014CC40
/* 04CD18 0014CC18 00000000 */   nop
.L0014CC1C:
/* 04CD1C 0014CC1C 40180400 */  sll         $3, $4, 1
/* 04CD20 0014CC20 21184300 */  addu        $3, $2, $3
/* 04CD24 0014CC24 00006394 */  lhu         $3, 0x0($3)
/* 04CD28 0014CC28 04006014 */  bnez        $3, .L0014CC3C
/* 04CD2C 0014CC2C 00000000 */   nop
/* 04CD30 0014CC30 28168070 */  paddub      $2, $4, $0
/* 04CD34 0014CC34 06000010 */  b           .L0014CC50
/* 04CD38 0014CC38 00000000 */   nop
.L0014CC3C:
/* 04CD3C 0014CC3C 01008424 */  addiu       $4, $4, 0x1
.L0014CC40:
/* 04CD40 0014CC40 0B008328 */  slti        $3, $4, 0xB
/* 04CD44 0014CC44 F5FF6014 */  bnez        $3, .L0014CC1C
/* 04CD48 0014CC48 00000000 */   nop
/* 04CD4C 0014CC4C FFFF0224 */  addiu       $2, $0, -0x1
.L0014CC50:
/* 04CD50 0014CC50 0000BF7B */  lq          $31, 0x0($29)
/* 04CD54 0014CC54 1000BD27 */  addiu       $29, $29, 0x10
/* 04CD58 0014CC58 0800E003 */  jr          $31
/* 04CD5C 0014CC5C 00000000 */   nop
