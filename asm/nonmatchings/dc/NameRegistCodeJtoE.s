.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel NameRegistCodeJtoE__Fi
/* 4CB60 0014CA60 B0FEBD27 */  addiu      $sp, $sp, -0x150
/* 4CB64 0014CA64 2500023C */  lui        $2, %hi(_363)
/* 4CB68 0014CA68 D03D4724 */  addiu      $7, $2, %lo(_363)
/* 4CB6C 0014CA6C 0000A627 */  addiu      $6, $sp, 0x0
/* 4CB70 0014CA70 0A000524 */  addiu      $5, $0, 0xA
.L0014CA74:
/* 4CB74 0014CA74 0000E378 */  lq         $3, 0x0($7)
/* 4CB78 0014CA78 1000E278 */  lq         $2, 0x10($7)
/* 4CB7C 0014CA7C 2000E724 */  addiu      $7, $7, 0x20
/* 4CB80 0014CA80 FFFFA524 */  addiu      $5, $5, -0x1
/* 4CB84 0014CA84 0000C37C */  sq         $3, 0x0($6)
/* 4CB88 0014CA88 1000C27C */  sq         $2, 0x10($6)
/* 4CB8C 0014CA8C 2000C624 */  addiu      $6, $6, 0x20
/* 4CB90 0014CA90 F8FFA01C */  bgtz       $5, .L0014CA74
/* 4CB94 0014CA94 00000000 */   nop
/* 4CB98 0014CA98 0000E2DC */  ld         $2, 0x0($7)
/* 4CB9C 0014CA9C 0000C2FC */  sd         $2, 0x0($6)
/* 4CBA0 0014CAA0 D5008228 */  slti       $2, $4, 0xD5
/* 4CBA4 0014CAA4 09004014 */  bnez       $2, .L0014CACC
/* 4CBA8 0014CAA8 00000000 */   nop
/* 4CBAC 0014CAAC 02018128 */  slti       $at, $4, 0x102
/* 4CBB0 0014CAB0 06002010 */  beqz       $at, .L0014CACC
/* 4CBB4 0014CAB4 00000000 */   nop
/* 4CBB8 0014CAB8 80100400 */  sll        $2, $4, 2
/* 4CBBC 0014CABC 21105D00 */  addu       $2, $2, $sp
/* 4CBC0 0014CAC0 ACFC428C */  lw         $2, -0x354($2)
/* 4CBC4 0014CAC4 14000010 */  b          .L0014CB18
/* 4CBC8 0014CAC8 00000000 */   nop
.L0014CACC:
/* 4CBCC 0014CACC A1008228 */  slti       $2, $4, 0xA1
/* 4CBD0 0014CAD0 07004014 */  bnez       $2, .L0014CAF0
/* 4CBD4 0014CAD4 00000000 */   nop
/* 4CBD8 0014CAD8 BB008128 */  slti       $at, $4, 0xBB
/* 4CBDC 0014CADC 04002010 */  beqz       $at, .L0014CAF0
/* 4CBE0 0014CAE0 00000000 */   nop
/* 4CBE4 0014CAE4 80FC8224 */  addiu      $2, $4, -0x380
/* 4CBE8 0014CAE8 0B000010 */  b          .L0014CB18
/* 4CBEC 0014CAEC 00000000 */   nop
.L0014CAF0:
/* 4CBF0 0014CAF0 BB008228 */  slti       $2, $4, 0xBB
/* 4CBF4 0014CAF4 07004014 */  bnez       $2, .L0014CB14
/* 4CBF8 0014CAF8 00000000 */   nop
/* 4CBFC 0014CAFC D5008128 */  slti       $at, $4, 0xD5
/* 4CC00 0014CB00 04002010 */  beqz       $at, .L0014CB14
/* 4CC04 0014CB04 00000000 */   nop
/* 4CC08 0014CB08 80FC8224 */  addiu      $2, $4, -0x380
/* 4CC0C 0014CB0C 02000010 */  b          .L0014CB18
/* 4CC10 0014CB10 00000000 */   nop
.L0014CB14:
/* 4CC14 0014CB14 59FD0224 */  addiu      $2, $0, -0x2A7
.L0014CB18:
/* 4CC18 0014CB18 5001BD27 */  addiu      $sp, $sp, 0x150
/* 4CC1C 0014CB1C 0800E003 */  jr         $31
/* 4CC20 0014CB20 00000000 */   nop
/* 4CC24 0014CB24 00000000 */  nop
/* 4CC28 0014CB28 00000000 */  nop
/* 4CC2C 0014CB2C 00000000 */  nop
