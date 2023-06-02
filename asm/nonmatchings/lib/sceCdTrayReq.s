.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdTrayReq
/* BEC8 0010BDC8 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* BECC 0010BDCC 2000B1FF */  sd         $17, 0x20($sp)
/* BED0 0010BDD0 3000B2FF */  sd         $18, 0x30($sp)
/* BED4 0010BDD4 2D888000 */  daddu      $17, $4, $0
/* BED8 0010BDD8 4000BFFF */  sd         $31, 0x40($sp)
/* BEDC 0010BDDC 2D90A000 */  daddu      $18, $5, $0
/* BEE0 0010BDE0 1000B0FF */  sd         $16, 0x10($sp)
/* BEE4 0010BDE4 A82B040C */  jal        scmd_prechk
/* BEE8 0010BDE8 1A000424 */   addiu     $4, $0, 0x1A
/* BEEC 0010BDEC 03004014 */  bnez       $2, .L0010BDFC
/* BEF0 0010BDF0 2A00023C */   lui       $2, (0x2A4F20 >> 16)
/* BEF4 0010BDF4 27000010 */  b          .L0010BE94
/* BEF8 0010BDF8 FFFF0224 */   addiu     $2, $0, -0x1
.L0010BDFC:
/* BEFC 0010BDFC 04000524 */  addiu      $5, $0, 0x4
/* BF00 0010BE00 204F5024 */  addiu      $16, $2, %lo(D_002A4F20)
/* BF04 0010BE04 204F51AC */  sw         $17, (0x2A4F20 & 0xFFFF)($2)
/* BF08 0010BE08 E65A040C */  jal        sceSifWriteBackDCache
/* BF0C 0010BE0C 2D200002 */   daddu     $4, $16, $0
/* BF10 0010BE10 2A00023C */  lui        $2, %hi(D_002A4940)
/* BF14 0010BE14 2A00043C */  lui        $4, %hi(D_002A4D60)
/* BF18 0010BE18 40495124 */  addiu      $17, $2, %lo(D_002A4940)
/* BF1C 0010BE1C 604D8424 */  addiu      $4, $4, %lo(D_002A4D60)
/* BF20 0010BE20 2D380002 */  daddu      $7, $16, $0
/* BF24 0010BE24 0000A0AF */  sw         $0, 0x0($sp)
/* BF28 0010BE28 05000524 */  addiu      $5, $0, 0x5
/* BF2C 0010BE2C 2D300000 */  daddu      $6, $0, $0
/* BF30 0010BE30 04000824 */  addiu      $8, $0, 0x4
/* BF34 0010BE34 2D482002 */  daddu      $9, $17, $0
/* BF38 0010BE38 08000A24 */  addiu      $10, $0, 0x8
/* BF3C 0010BE3C 2A5D040C */  jal        sceSifCallRpc
/* BF40 0010BE40 2D580000 */   daddu     $11, $0, $0
/* BF44 0010BE44 06004104 */  bgez       $2, .L0010BE60
/* BF48 0010BE48 2500023C */   lui       $2, (0x250284 >> 16)
/* BF4C 0010BE4C 8402448C */  lw         $4, (0x250284 & 0xFFFF)($2)
/* BF50 0010BE50 D050040C */  jal        SignalSema
/* BF54 0010BE54 00000000 */   nop
/* BF58 0010BE58 0E000010 */  b          .L0010BE94
/* BF5C 0010BE5C FFFF0224 */   addiu     $2, $0, -0x1
.L0010BE60:
/* BF60 0010BE60 05004012 */  beqz       $18, .L0010BE78
/* BF64 0010BE64 04002226 */   addiu     $2, $17, 0x4
/* BF68 0010BE68 0020033C */  lui        $3, (0x20000000 >> 16)
/* BF6C 0010BE6C 25104300 */  or         $2, $2, $3
/* BF70 0010BE70 0000448C */  lw         $4, (0x20000000 & 0xFFFF)($2)
/* BF74 0010BE74 000044AE */  sw         $4, 0x0($18)
.L0010BE78:
/* BF78 0010BE78 2500033C */  lui        $3, (0x250284 >> 16)
/* BF7C 0010BE7C 0020023C */  lui        $2, (0x20000000 >> 16)
/* BF80 0010BE80 25102202 */  or         $2, $17, $2
/* BF84 0010BE84 8402648C */  lw         $4, (0x250284 & 0xFFFF)($3)
/* BF88 0010BE88 D050040C */  jal        SignalSema
/* BF8C 0010BE8C 0000508C */   lw        $16, (0x20000000 & 0xFFFF)($2)
/* BF90 0010BE90 2D100002 */  daddu      $2, $16, $0
.L0010BE94:
/* BF94 0010BE94 4000BFDF */  ld         $31, 0x40($sp)
/* BF98 0010BE98 3000B2DF */  ld         $18, 0x30($sp)
/* BF9C 0010BE9C 2000B1DF */  ld         $17, 0x20($sp)
/* BFA0 0010BEA0 1000B0DF */  ld         $16, 0x10($sp)
/* BFA4 0010BEA4 0800E003 */  jr         $31
/* BFA8 0010BEA8 5000BD27 */   addiu     $sp, $sp, 0x50
/* BFAC 0010BEAC 00000000 */  nop
