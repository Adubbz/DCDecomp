.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdReadClock
/* 00BBD0 0010BAD0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 00BBD4 0010BAD4 3000B2FF */  sd          $18, 0x30($29)
/* 00BBD8 0010BAD8 2D908000 */  daddu       $18, $4, $0
/* 00BBDC 0010BADC 5000BFFF */  sd          $31, 0x50($29)
/* 00BBE0 0010BAE0 4000B3FF */  sd          $19, 0x40($29)
/* 00BBE4 0010BAE4 0F000424 */  addiu       $4, $0, 0xF
/* 00BBE8 0010BAE8 2000B1FF */  sd          $17, 0x20($29)
/* 00BBEC 0010BAEC A82B040C */  jal         scmd_prechk
/* 00BBF0 0010BAF0 1000B0FF */   sd         $16, 0x10($29)
/* 00BBF4 0010BAF4 03004014 */  bnez        $2, .L0010BB04
/* 00BBF8 0010BAF8 2500133C */   lui        $19, %hi(CD_debug)
/* 00BBFC 0010BAFC 2B000010 */  b           .L0010BBAC
/* 00BC00 0010BB00 2D100000 */   daddu      $2, $0, $0
.L0010BB04:
/* 00BC04 0010BB04 7002628E */  lw          $2, %lo(CD_debug)($19)
/* 00BC08 0010BB08 03004018 */  blez        $2, .L0010BB18
/* 00BC0C 0010BB0C 2900043C */   lui        $4, %hi(RO_00297218)
/* 00BC10 0010BB10 A611040C */  jal         printf
/* 00BC14 0010BB14 18728424 */   addiu      $4, $4, %lo(RO_00297218)
.L0010BB18:
/* 00BC18 0010BB18 2A00023C */  lui         $2, %hi(scmdrdata)
/* 00BC1C 0010BB1C 2A00043C */  lui         $4, %hi(cdrc)
/* 00BC20 0010BB20 40495024 */  addiu       $16, $2, %lo(scmdrdata)
/* 00BC24 0010BB24 604D8424 */  addiu       $4, $4, %lo(cdrc)
/* 00BC28 0010BB28 0000A0AF */  sw          $0, 0x0($29)
/* 00BC2C 0010BB2C 01000524 */  addiu       $5, $0, 0x1
/* 00BC30 0010BB30 2D300000 */  daddu       $6, $0, $0
/* 00BC34 0010BB34 2D380000 */  daddu       $7, $0, $0
/* 00BC38 0010BB38 2D400000 */  daddu       $8, $0, $0
/* 00BC3C 0010BB3C 2D480002 */  daddu       $9, $16, $0
/* 00BC40 0010BB40 10000A24 */  addiu       $10, $0, 0x10
/* 00BC44 0010BB44 2A5D040C */  jal         sceSifCallRpc
/* 00BC48 0010BB48 2D580000 */   daddu      $11, $0, $0
/* 00BC4C 0010BB4C 06004304 */  bgezl       $2, .L0010BB68
/* 00BC50 0010BB50 04000226 */   addiu      $2, $16, 0x4
/* 00BC54 0010BB54 2500023C */  lui         $2, %hi(scmd_semid)
/* 00BC58 0010BB58 D050040C */  jal         SignalSema
/* 00BC5C 0010BB5C 8402448C */   lw         $4, %lo(scmd_semid)($2)
/* 00BC60 0010BB60 12000010 */  b           .L0010BBAC
/* 00BC64 0010BB64 2D100000 */   daddu      $2, $0, $0
.L0010BB68:
/* 00BC68 0010BB68 0020113C */  lui         $17, (0x20000000 >> 16)
/* 00BC6C 0010BB6C 25105100 */  or          $2, $2, $17
/* 00BC70 0010BB70 07004368 */  ldl         $3, (0x20000007 & 0xFFFF)($2)
/* 00BC74 0010BB74 0000436C */  ldr         $3, (0x20000000 & 0xFFFF)($2)
/* 00BC78 0010BB78 070043B2 */  sdl         $3, 0x7($18)
/* 00BC7C 0010BB7C 000043B6 */  sdr         $3, 0x0($18)
/* 00BC80 0010BB80 7002638E */  lw          $3, %lo(CD_debug)($19)
/* 00BC84 0010BB84 03006018 */  blez        $3, .L0010BB94
/* 00BC88 0010BB88 2900043C */   lui        $4, %hi(RO_00297238)
/* 00BC8C 0010BB8C A611040C */  jal         printf
/* 00BC90 0010BB90 38728424 */   addiu      $4, $4, %lo(RO_00297238)
.L0010BB94:
/* 00BC94 0010BB94 2500023C */  lui         $2, %hi(scmd_semid)
/* 00BC98 0010BB98 25181102 */  or          $3, $16, $17
/* 00BC9C 0010BB9C 8402448C */  lw          $4, %lo(scmd_semid)($2)
/* 00BCA0 0010BBA0 D050040C */  jal         SignalSema
/* 00BCA4 0010BBA4 0000708C */   lw         $16, (0x20000000 & 0xFFFF)($3)
/* 00BCA8 0010BBA8 2D100002 */  daddu       $2, $16, $0
.L0010BBAC:
/* 00BCAC 0010BBAC 5000BFDF */  ld          $31, 0x50($29)
/* 00BCB0 0010BBB0 4000B3DF */  ld          $19, 0x40($29)
/* 00BCB4 0010BBB4 3000B2DF */  ld          $18, 0x30($29)
/* 00BCB8 0010BBB8 2000B1DF */  ld          $17, 0x20($29)
/* 00BCBC 0010BBBC 1000B0DF */  ld          $16, 0x10($29)
/* 00BCC0 0010BBC0 0800E003 */  jr          $31
/* 00BCC4 0010BBC4 6000BD27 */   addiu      $29, $29, 0x60
