.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdChangeThreadPriority
/* BB10 0010BA10 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* BB14 0010BA14 2000B1FF */  sd         $17, 0x20($sp)
/* BB18 0010BA18 2D888000 */  daddu      $17, $4, $0
/* BB1C 0010BA1C 3000BFFF */  sd         $31, 0x30($sp)
/* BB20 0010BA20 1000B0FF */  sd         $16, 0x10($sp)
/* BB24 0010BA24 A82B040C */  jal        scmd_prechk
/* BB28 0010BA28 23000424 */   addiu     $4, $0, 0x23
/* BB2C 0010BA2C 03004014 */  bnez       $2, .L0010BA3C
/* BB30 0010BA30 2A00023C */   lui       $2, (0x2A4E80 >> 16)
/* BB34 0010BA34 20000010 */  b          .L0010BAB8
/* BB38 0010BA38 FFFF0224 */   addiu     $2, $0, -0x1
.L0010BA3C:
/* BB3C 0010BA3C 04000524 */  addiu      $5, $0, 0x4
/* BB40 0010BA40 804E5024 */  addiu      $16, $2, %lo(D_002A4E80)
/* BB44 0010BA44 804E51AC */  sw         $17, (0x2A4E80 & 0xFFFF)($2)
/* BB48 0010BA48 E65A040C */  jal        sceSifWriteBackDCache
/* BB4C 0010BA4C 2D200002 */   daddu     $4, $16, $0
/* BB50 0010BA50 2A00023C */  lui        $2, %hi(D_002A4940)
/* BB54 0010BA54 2A00043C */  lui        $4, %hi(D_002A4D60)
/* BB58 0010BA58 40495124 */  addiu      $17, $2, %lo(D_002A4940)
/* BB5C 0010BA5C 604D8424 */  addiu      $4, $4, %lo(D_002A4D60)
/* BB60 0010BA60 2D380002 */  daddu      $7, $16, $0
/* BB64 0010BA64 0000A0AF */  sw         $0, 0x0($sp)
/* BB68 0010BA68 23000524 */  addiu      $5, $0, 0x23
/* BB6C 0010BA6C 2D300000 */  daddu      $6, $0, $0
/* BB70 0010BA70 04000824 */  addiu      $8, $0, 0x4
/* BB74 0010BA74 2D482002 */  daddu      $9, $17, $0
/* BB78 0010BA78 04000A24 */  addiu      $10, $0, 0x4
/* BB7C 0010BA7C 2A5D040C */  jal        sceSifCallRpc
/* BB80 0010BA80 2D580000 */   daddu     $11, $0, $0
/* BB84 0010BA84 06004104 */  bgez       $2, .L0010BAA0
/* BB88 0010BA88 2500033C */   lui       $3, (0x250284 >> 16)
/* BB8C 0010BA8C 2500023C */  lui        $2, (0x250284 >> 16)
/* BB90 0010BA90 D050040C */  jal        SignalSema
/* BB94 0010BA94 8402448C */   lw        $4, (0x250284 & 0xFFFF)($2)
/* BB98 0010BA98 07000010 */  b          .L0010BAB8
/* BB9C 0010BA9C FFFF0224 */   addiu     $2, $0, -0x1
.L0010BAA0:
/* BBA0 0010BAA0 0020023C */  lui        $2, (0x20000000 >> 16)
/* BBA4 0010BAA4 25102202 */  or         $2, $17, $2
/* BBA8 0010BAA8 8402648C */  lw         $4, (0x250284 & 0xFFFF)($3)
/* BBAC 0010BAAC D050040C */  jal        SignalSema
/* BBB0 0010BAB0 0000508C */   lw        $16, (0x20000000 & 0xFFFF)($2)
/* BBB4 0010BAB4 2D100002 */  daddu      $2, $16, $0
.L0010BAB8:
/* BBB8 0010BAB8 3000BFDF */  ld         $31, 0x30($sp)
/* BBBC 0010BABC 2000B1DF */  ld         $17, 0x20($sp)
/* BBC0 0010BAC0 1000B0DF */  ld         $16, 0x10($sp)
/* BBC4 0010BAC4 0800E003 */  jr         $31
/* BBC8 0010BAC8 4000BD27 */   addiu     $sp, $sp, 0x40
/* BBCC 0010BACC 00000000 */  nop
