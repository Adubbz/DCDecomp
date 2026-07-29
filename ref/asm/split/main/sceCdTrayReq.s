.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdTrayReq
/* 00BEC8 0010BDC8 B0FFBD27 */  addiu       $29, $29, -0x50
/* 00BECC 0010BDCC 2000B1FF */  sd          $17, 0x20($29)
/* 00BED0 0010BDD0 3000B2FF */  sd          $18, 0x30($29)
/* 00BED4 0010BDD4 2D888000 */  daddu       $17, $4, $0
/* 00BED8 0010BDD8 4000BFFF */  sd          $31, 0x40($29)
/* 00BEDC 0010BDDC 2D90A000 */  daddu       $18, $5, $0
/* 00BEE0 0010BDE0 1000B0FF */  sd          $16, 0x10($29)
/* 00BEE4 0010BDE4 A82B040C */  jal         scmd_prechk
/* 00BEE8 0010BDE8 1A000424 */   addiu      $4, $0, 0x1A
/* 00BEEC 0010BDEC 03004014 */  bnez        $2, .L0010BDFC
/* 00BEF0 0010BDF0 2A00023C */   lui        $2, %hi(TrayReq)
/* 00BEF4 0010BDF4 27000010 */  b           .L0010BE94
/* 00BEF8 0010BDF8 FFFF0224 */   addiu      $2, $0, -0x1
.L0010BDFC:
/* 00BEFC 0010BDFC 04000524 */  addiu       $5, $0, 0x4
/* 00BF00 0010BE00 204F5024 */  addiu       $16, $2, %lo(TrayReq)
/* 00BF04 0010BE04 204F51AC */  sw          $17, %lo(TrayReq)($2)
/* 00BF08 0010BE08 E65A040C */  jal         sceSifWriteBackDCache
/* 00BF0C 0010BE0C 2D200002 */   daddu      $4, $16, $0
/* 00BF10 0010BE10 2A00023C */  lui         $2, %hi(scmdrdata)
/* 00BF14 0010BE14 2A00043C */  lui         $4, %hi(cdrc)
/* 00BF18 0010BE18 40495124 */  addiu       $17, $2, %lo(scmdrdata)
/* 00BF1C 0010BE1C 604D8424 */  addiu       $4, $4, %lo(cdrc)
/* 00BF20 0010BE20 2D380002 */  daddu       $7, $16, $0
/* 00BF24 0010BE24 0000A0AF */  sw          $0, 0x0($29)
/* 00BF28 0010BE28 05000524 */  addiu       $5, $0, 0x5
/* 00BF2C 0010BE2C 2D300000 */  daddu       $6, $0, $0
/* 00BF30 0010BE30 04000824 */  addiu       $8, $0, 0x4
/* 00BF34 0010BE34 2D482002 */  daddu       $9, $17, $0
/* 00BF38 0010BE38 08000A24 */  addiu       $10, $0, 0x8
/* 00BF3C 0010BE3C 2A5D040C */  jal         sceSifCallRpc
/* 00BF40 0010BE40 2D580000 */   daddu      $11, $0, $0
/* 00BF44 0010BE44 06004104 */  bgez        $2, .L0010BE60
/* 00BF48 0010BE48 2500023C */   lui        $2, %hi(scmd_semid)
/* 00BF4C 0010BE4C 8402448C */  lw          $4, %lo(scmd_semid)($2)
/* 00BF50 0010BE50 D050040C */  jal         SignalSema
/* 00BF54 0010BE54 00000000 */   nop
/* 00BF58 0010BE58 0E000010 */  b           .L0010BE94
/* 00BF5C 0010BE5C FFFF0224 */   addiu      $2, $0, -0x1
.L0010BE60:
/* 00BF60 0010BE60 05004012 */  beqz        $18, .L0010BE78
/* 00BF64 0010BE64 04002226 */   addiu      $2, $17, 0x4
/* 00BF68 0010BE68 0020033C */  lui         $3, (0x20000000 >> 16)
/* 00BF6C 0010BE6C 25104300 */  or          $2, $2, $3
/* 00BF70 0010BE70 0000448C */  lw          $4, (0x20000000 & 0xFFFF)($2)
/* 00BF74 0010BE74 000044AE */  sw          $4, 0x0($18)
.L0010BE78:
/* 00BF78 0010BE78 2500033C */  lui         $3, %hi(scmd_semid)
/* 00BF7C 0010BE7C 0020023C */  lui         $2, (0x20000000 >> 16)
/* 00BF80 0010BE80 25102202 */  or          $2, $17, $2
/* 00BF84 0010BE84 8402648C */  lw          $4, %lo(scmd_semid)($3)
/* 00BF88 0010BE88 D050040C */  jal         SignalSema
/* 00BF8C 0010BE8C 0000508C */   lw         $16, (0x20000000 & 0xFFFF)($2)
/* 00BF90 0010BE90 2D100002 */  daddu       $2, $16, $0
.L0010BE94:
/* 00BF94 0010BE94 4000BFDF */  ld          $31, 0x40($29)
/* 00BF98 0010BE98 3000B2DF */  ld          $18, 0x30($29)
/* 00BF9C 0010BE9C 2000B1DF */  ld          $17, 0x20($29)
/* 00BFA0 0010BEA0 1000B0DF */  ld          $16, 0x10($29)
/* 00BFA4 0010BEA4 0800E003 */  jr          $31
/* 00BFA8 0010BEA8 5000BD27 */   addiu      $29, $29, 0x50
/* 00BFAC 0010BEAC 00000000 */  nop
