.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdMmode
/* BA50 0010B950 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* BA54 0010B954 2000B1FF */  sd         $17, 0x20($sp)
/* BA58 0010B958 2D888000 */  daddu      $17, $4, $0
/* BA5C 0010B95C 3000BFFF */  sd         $31, 0x30($sp)
/* BA60 0010B960 1000B0FF */  sd         $16, 0x10($sp)
/* BA64 0010B964 A82B040C */  jal        scmd_prechk
/* BA68 0010B968 22000424 */   addiu     $4, $0, 0x22
/* BA6C 0010B96C 03004014 */  bnez       $2, .L0010B97C
/* BA70 0010B970 2A00023C */   lui       $2, (0x2A4E70 >> 16)
/* BA74 0010B974 20000010 */  b          .L0010B9F8
/* BA78 0010B978 2D100000 */   daddu     $2, $0, $0
.L0010B97C:
/* BA7C 0010B97C 04000524 */  addiu      $5, $0, 0x4
/* BA80 0010B980 704E5024 */  addiu      $16, $2, %lo(D_002A4E70)
/* BA84 0010B984 704E51AC */  sw         $17, (0x2A4E70 & 0xFFFF)($2)
/* BA88 0010B988 E65A040C */  jal        sceSifWriteBackDCache
/* BA8C 0010B98C 2D200002 */   daddu     $4, $16, $0
/* BA90 0010B990 2A00023C */  lui        $2, %hi(D_002A4940)
/* BA94 0010B994 2A00043C */  lui        $4, %hi(D_002A4D60)
/* BA98 0010B998 40495124 */  addiu      $17, $2, %lo(D_002A4940)
/* BA9C 0010B99C 604D8424 */  addiu      $4, $4, %lo(D_002A4D60)
/* BAA0 0010B9A0 2D380002 */  daddu      $7, $16, $0
/* BAA4 0010B9A4 0000A0AF */  sw         $0, 0x0($sp)
/* BAA8 0010B9A8 22000524 */  addiu      $5, $0, 0x22
/* BAAC 0010B9AC 2D300000 */  daddu      $6, $0, $0
/* BAB0 0010B9B0 04000824 */  addiu      $8, $0, 0x4
/* BAB4 0010B9B4 2D482002 */  daddu      $9, $17, $0
/* BAB8 0010B9B8 04000A24 */  addiu      $10, $0, 0x4
/* BABC 0010B9BC 2A5D040C */  jal        sceSifCallRpc
/* BAC0 0010B9C0 2D580000 */   daddu     $11, $0, $0
/* BAC4 0010B9C4 06004104 */  bgez       $2, .L0010B9E0
/* BAC8 0010B9C8 2500033C */   lui       $3, (0x250284 >> 16)
/* BACC 0010B9CC 2500023C */  lui        $2, (0x250284 >> 16)
/* BAD0 0010B9D0 D050040C */  jal        SignalSema
/* BAD4 0010B9D4 8402448C */   lw        $4, (0x250284 & 0xFFFF)($2)
/* BAD8 0010B9D8 07000010 */  b          .L0010B9F8
/* BADC 0010B9DC 2D100000 */   daddu     $2, $0, $0
.L0010B9E0:
/* BAE0 0010B9E0 0020023C */  lui        $2, (0x20000000 >> 16)
/* BAE4 0010B9E4 25102202 */  or         $2, $17, $2
/* BAE8 0010B9E8 8402648C */  lw         $4, (0x250284 & 0xFFFF)($3)
/* BAEC 0010B9EC D050040C */  jal        SignalSema
/* BAF0 0010B9F0 0000508C */   lw        $16, (0x20000000 & 0xFFFF)($2)
/* BAF4 0010B9F4 2D100002 */  daddu      $2, $16, $0
.L0010B9F8:
/* BAF8 0010B9F8 3000BFDF */  ld         $31, 0x30($sp)
/* BAFC 0010B9FC 2000B1DF */  ld         $17, 0x20($sp)
/* BB00 0010BA00 1000B0DF */  ld         $16, 0x10($sp)
/* BB04 0010BA04 0800E003 */  jr         $31
/* BB08 0010BA08 4000BD27 */   addiu     $sp, $sp, 0x40
/* BB0C 0010BA0C 00000000 */  nop
