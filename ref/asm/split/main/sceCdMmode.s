.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdMmode
/* 00BA50 0010B950 C0FFBD27 */  addiu       $29, $29, -0x40
/* 00BA54 0010B954 2000B1FF */  sd          $17, 0x20($29)
/* 00BA58 0010B958 2D888000 */  daddu       $17, $4, $0
/* 00BA5C 0010B95C 3000BFFF */  sd          $31, 0x30($29)
/* 00BA60 0010B960 1000B0FF */  sd          $16, 0x10($29)
/* 00BA64 0010B964 A82B040C */  jal         scmd_prechk
/* 00BA68 0010B968 22000424 */   addiu      $4, $0, 0x22
/* 00BA6C 0010B96C 03004014 */  bnez        $2, .L0010B97C
/* 00BA70 0010B970 2A00023C */   lui        $2, %hi(_mmode)
/* 00BA74 0010B974 20000010 */  b           .L0010B9F8
/* 00BA78 0010B978 2D100000 */   daddu      $2, $0, $0
.L0010B97C:
/* 00BA7C 0010B97C 04000524 */  addiu       $5, $0, 0x4
/* 00BA80 0010B980 704E5024 */  addiu       $16, $2, %lo(_mmode)
/* 00BA84 0010B984 704E51AC */  sw          $17, %lo(_mmode)($2)
/* 00BA88 0010B988 E65A040C */  jal         sceSifWriteBackDCache
/* 00BA8C 0010B98C 2D200002 */   daddu      $4, $16, $0
/* 00BA90 0010B990 2A00023C */  lui         $2, %hi(scmdrdata)
/* 00BA94 0010B994 2A00043C */  lui         $4, %hi(cdrc)
/* 00BA98 0010B998 40495124 */  addiu       $17, $2, %lo(scmdrdata)
/* 00BA9C 0010B99C 604D8424 */  addiu       $4, $4, %lo(cdrc)
/* 00BAA0 0010B9A0 2D380002 */  daddu       $7, $16, $0
/* 00BAA4 0010B9A4 0000A0AF */  sw          $0, 0x0($29)
/* 00BAA8 0010B9A8 22000524 */  addiu       $5, $0, 0x22
/* 00BAAC 0010B9AC 2D300000 */  daddu       $6, $0, $0
/* 00BAB0 0010B9B0 04000824 */  addiu       $8, $0, 0x4
/* 00BAB4 0010B9B4 2D482002 */  daddu       $9, $17, $0
/* 00BAB8 0010B9B8 04000A24 */  addiu       $10, $0, 0x4
/* 00BABC 0010B9BC 2A5D040C */  jal         sceSifCallRpc
/* 00BAC0 0010B9C0 2D580000 */   daddu      $11, $0, $0
/* 00BAC4 0010B9C4 06004104 */  bgez        $2, .L0010B9E0
/* 00BAC8 0010B9C8 2500033C */   lui        $3, %hi(scmd_semid)
/* 00BACC 0010B9CC 2500023C */  lui         $2, %hi(scmd_semid)
/* 00BAD0 0010B9D0 D050040C */  jal         SignalSema
/* 00BAD4 0010B9D4 8402448C */   lw         $4, %lo(scmd_semid)($2)
/* 00BAD8 0010B9D8 07000010 */  b           .L0010B9F8
/* 00BADC 0010B9DC 2D100000 */   daddu      $2, $0, $0
.L0010B9E0:
/* 00BAE0 0010B9E0 0020023C */  lui         $2, (0x20000000 >> 16)
/* 00BAE4 0010B9E4 25102202 */  or          $2, $17, $2
/* 00BAE8 0010B9E8 8402648C */  lw          $4, %lo(scmd_semid)($3)
/* 00BAEC 0010B9EC D050040C */  jal         SignalSema
/* 00BAF0 0010B9F0 0000508C */   lw         $16, (0x20000000 & 0xFFFF)($2)
/* 00BAF4 0010B9F4 2D100002 */  daddu       $2, $16, $0
.L0010B9F8:
/* 00BAF8 0010B9F8 3000BFDF */  ld          $31, 0x30($29)
/* 00BAFC 0010B9FC 2000B1DF */  ld          $17, 0x20($29)
/* 00BB00 0010BA00 1000B0DF */  ld          $16, 0x10($29)
/* 00BB04 0010BA04 0800E003 */  jr          $31
/* 00BB08 0010BA08 4000BD27 */   addiu      $29, $29, 0x40
/* 00BB0C 0010BA0C 00000000 */  nop
