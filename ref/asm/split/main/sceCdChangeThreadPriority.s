.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdChangeThreadPriority
/* 00BB10 0010BA10 C0FFBD27 */  addiu       $29, $29, -0x40
/* 00BB14 0010BA14 2000B1FF */  sd          $17, 0x20($29)
/* 00BB18 0010BA18 2D888000 */  daddu       $17, $4, $0
/* 00BB1C 0010BA1C 3000BFFF */  sd          $31, 0x30($29)
/* 00BB20 0010BA20 1000B0FF */  sd          $16, 0x10($29)
/* 00BB24 0010BA24 A82B040C */  jal         scmd_prechk
/* 00BB28 0010BA28 23000424 */   addiu      $4, $0, 0x23
/* 00BB2C 0010BA2C 03004014 */  bnez        $2, .L0010BA3C
/* 00BB30 0010BA30 2A00023C */   lui        $2, %hi(_prio)
/* 00BB34 0010BA34 20000010 */  b           .L0010BAB8
/* 00BB38 0010BA38 FFFF0224 */   addiu      $2, $0, -0x1
.L0010BA3C:
/* 00BB3C 0010BA3C 04000524 */  addiu       $5, $0, 0x4
/* 00BB40 0010BA40 804E5024 */  addiu       $16, $2, %lo(_prio)
/* 00BB44 0010BA44 804E51AC */  sw          $17, %lo(_prio)($2)
/* 00BB48 0010BA48 E65A040C */  jal         sceSifWriteBackDCache
/* 00BB4C 0010BA4C 2D200002 */   daddu      $4, $16, $0
/* 00BB50 0010BA50 2A00023C */  lui         $2, %hi(scmdrdata)
/* 00BB54 0010BA54 2A00043C */  lui         $4, %hi(cdrc)
/* 00BB58 0010BA58 40495124 */  addiu       $17, $2, %lo(scmdrdata)
/* 00BB5C 0010BA5C 604D8424 */  addiu       $4, $4, %lo(cdrc)
/* 00BB60 0010BA60 2D380002 */  daddu       $7, $16, $0
/* 00BB64 0010BA64 0000A0AF */  sw          $0, 0x0($29)
/* 00BB68 0010BA68 23000524 */  addiu       $5, $0, 0x23
/* 00BB6C 0010BA6C 2D300000 */  daddu       $6, $0, $0
/* 00BB70 0010BA70 04000824 */  addiu       $8, $0, 0x4
/* 00BB74 0010BA74 2D482002 */  daddu       $9, $17, $0
/* 00BB78 0010BA78 04000A24 */  addiu       $10, $0, 0x4
/* 00BB7C 0010BA7C 2A5D040C */  jal         sceSifCallRpc
/* 00BB80 0010BA80 2D580000 */   daddu      $11, $0, $0
/* 00BB84 0010BA84 06004104 */  bgez        $2, .L0010BAA0
/* 00BB88 0010BA88 2500033C */   lui        $3, %hi(scmd_semid)
/* 00BB8C 0010BA8C 2500023C */  lui         $2, %hi(scmd_semid)
/* 00BB90 0010BA90 D050040C */  jal         SignalSema
/* 00BB94 0010BA94 8402448C */   lw         $4, %lo(scmd_semid)($2)
/* 00BB98 0010BA98 07000010 */  b           .L0010BAB8
/* 00BB9C 0010BA9C FFFF0224 */   addiu      $2, $0, -0x1
.L0010BAA0:
/* 00BBA0 0010BAA0 0020023C */  lui         $2, (0x20000000 >> 16)
/* 00BBA4 0010BAA4 25102202 */  or          $2, $17, $2
/* 00BBA8 0010BAA8 8402648C */  lw          $4, %lo(scmd_semid)($3)
/* 00BBAC 0010BAAC D050040C */  jal         SignalSema
/* 00BBB0 0010BAB0 0000508C */   lw         $16, (0x20000000 & 0xFFFF)($2)
/* 00BBB4 0010BAB4 2D100002 */  daddu       $2, $16, $0
.L0010BAB8:
/* 00BBB8 0010BAB8 3000BFDF */  ld          $31, 0x30($29)
/* 00BBBC 0010BABC 2000B1DF */  ld          $17, 0x20($29)
/* 00BBC0 0010BAC0 1000B0DF */  ld          $16, 0x10($29)
/* 00BBC4 0010BAC4 0800E003 */  jr          $31
/* 00BBC8 0010BAC8 4000BD27 */   addiu      $29, $29, 0x40
/* 00BBCC 0010BACC 00000000 */  nop
