.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel NameRegistCodeJtoE__Fi
/* 04CB60 0014CA60 B0FEBD27 */  addiu       $29, $29, -0x150
/* 04CB64 0014CA64 2500023C */  lui         $2, %hi(LIT_363)
/* 04CB68 0014CA68 D03D4724 */  addiu       $7, $2, %lo(LIT_363)
/* 04CB6C 0014CA6C 0000A627 */  addiu       $6, $29, 0x0
/* 04CB70 0014CA70 0A000524 */  addiu       $5, $0, 0xA
.L0014CA74:
/* 04CB74 0014CA74 0000E378 */  lq          $3, 0x0($7)
/* 04CB78 0014CA78 1000E278 */  lq          $2, 0x10($7)
/* 04CB7C 0014CA7C 2000E724 */  addiu       $7, $7, 0x20
/* 04CB80 0014CA80 FFFFA524 */  addiu       $5, $5, -0x1
/* 04CB84 0014CA84 0000C37C */  sq          $3, 0x0($6)
/* 04CB88 0014CA88 1000C27C */  sq          $2, 0x10($6)
/* 04CB8C 0014CA8C 2000C624 */  addiu       $6, $6, 0x20
/* 04CB90 0014CA90 F8FFA01C */  bgtz        $5, .L0014CA74
/* 04CB94 0014CA94 00000000 */   nop
/* 04CB98 0014CA98 0000E2DC */  ld          $2, 0x0($7)
/* 04CB9C 0014CA9C 0000C2FC */  sd          $2, 0x0($6)
/* 04CBA0 0014CAA0 D5008228 */  slti        $2, $4, 0xD5
/* 04CBA4 0014CAA4 09004014 */  bnez        $2, .L0014CACC
/* 04CBA8 0014CAA8 00000000 */   nop
/* 04CBAC 0014CAAC 02018128 */  slti        $1, $4, 0x102
/* 04CBB0 0014CAB0 06002010 */  beqz        $1, .L0014CACC
/* 04CBB4 0014CAB4 00000000 */   nop
/* 04CBB8 0014CAB8 80100400 */  sll         $2, $4, 2
/* 04CBBC 0014CABC 21105D00 */  addu        $2, $2, $29
/* 04CBC0 0014CAC0 ACFC428C */  lw          $2, -0x354($2)
/* 04CBC4 0014CAC4 14000010 */  b           .L0014CB18
/* 04CBC8 0014CAC8 00000000 */   nop
.L0014CACC:
/* 04CBCC 0014CACC A1008228 */  slti        $2, $4, 0xA1
/* 04CBD0 0014CAD0 07004014 */  bnez        $2, .L0014CAF0
/* 04CBD4 0014CAD4 00000000 */   nop
/* 04CBD8 0014CAD8 BB008128 */  slti        $1, $4, 0xBB
/* 04CBDC 0014CADC 04002010 */  beqz        $1, .L0014CAF0
/* 04CBE0 0014CAE0 00000000 */   nop
/* 04CBE4 0014CAE4 80FC8224 */  addiu       $2, $4, -0x380
/* 04CBE8 0014CAE8 0B000010 */  b           .L0014CB18
/* 04CBEC 0014CAEC 00000000 */   nop
.L0014CAF0:
/* 04CBF0 0014CAF0 BB008228 */  slti        $2, $4, 0xBB
/* 04CBF4 0014CAF4 07004014 */  bnez        $2, .L0014CB14
/* 04CBF8 0014CAF8 00000000 */   nop
/* 04CBFC 0014CAFC D5008128 */  slti        $1, $4, 0xD5
/* 04CC00 0014CB00 04002010 */  beqz        $1, .L0014CB14
/* 04CC04 0014CB04 00000000 */   nop
/* 04CC08 0014CB08 80FC8224 */  addiu       $2, $4, -0x380
/* 04CC0C 0014CB0C 02000010 */  b           .L0014CB18
/* 04CC10 0014CB10 00000000 */   nop
.L0014CB14:
/* 04CC14 0014CB14 59FD0224 */  addiu       $2, $0, -0x2A7
.L0014CB18:
/* 04CC18 0014CB18 5001BD27 */  addiu       $29, $29, 0x150
/* 04CC1C 0014CB1C 0800E003 */  jr          $31
/* 04CC20 0014CB20 00000000 */   nop
/* 04CC24 0014CB24 00000000 */  nop
/* 04CC28 0014CB28 00000000 */  nop
/* 04CC2C 0014CB2C 00000000 */  nop
