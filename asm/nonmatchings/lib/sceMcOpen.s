.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMcOpen
/* 1E318 0011E218 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 1E31C 0011E21C 6000B5FF */  sd         $21, 0x60($sp)
/* 1E320 0011E220 5000B4FF */  sd         $20, 0x50($sp)
/* 1E324 0011E224 2500153C */  lui        $21, (0x250A38 >> 16)
/* 1E328 0011E228 4000B3FF */  sd         $19, 0x40($sp)
/* 1E32C 0011E22C 2DA0A000 */  daddu      $20, $5, $0
/* 1E330 0011E230 2000B1FF */  sd         $17, 0x20($sp)
/* 1E334 0011E234 2D988000 */  daddu      $19, $4, $0
/* 1E338 0011E238 380AA28E */  lw         $2, (0x250A38 & 0xFFFF)($21)
/* 1E33C 0011E23C 2D28C000 */  daddu      $5, $6, $0
/* 1E340 0011E240 7000BFFF */  sd         $31, 0x70($sp)
/* 1E344 0011E244 2D88E000 */  daddu      $17, $7, $0
/* 1E348 0011E248 3000B2FF */  sd         $18, 0x30($sp)
/* 1E34C 0011E24C 22004014 */  bnez       $2, .L0011E2D8
/* 1E350 0011E250 1000B0FF */   sd        $16, 0x10($sp)
/* 1E354 0011E254 2B00023C */  lui        $2, %hi(D_002A8640)
/* 1E358 0011E258 40865224 */  addiu      $18, $2, %lo(D_002A8640)
/* 1E35C 0011E25C 2400438E */  lw         $3, 0x24($18)
/* 1E360 0011E260 03006014 */  bnez       $3, .L0011E270
/* 1E364 0011E264 2B00103C */   lui       $16, %hi(D_002A8704)
/* 1E368 0011E268 1B000010 */  b          .L0011E2D8
/* 1E36C 0011E26C 9CFF0224 */   addiu     $2, $0, -0x64
.L0011E270:
/* 1E370 0011E270 FF030624 */  addiu      $6, $0, 0x3FF
/* 1E374 0011E274 04871026 */  addiu      $16, $16, %lo(D_002A8704)
/* 1E378 0011E278 5C16040C */  jal        strncpy
/* 1E37C 0011E27C 2D200002 */   daddu     $4, $16, $0
/* 1E380 0011E280 ECFF0326 */  addiu      $3, $16, -0x14
/* 1E384 0011E284 ECFF13AE */  sw         $19, -0x14($16)
/* 1E388 0011E288 080071AC */  sw         $17, 0x8($3)
/* 1E38C 0011E28C 2B00093C */  lui        $9, %hi(D_002A9C00)
/* 1E390 0011E290 040074AC */  sw         $20, 0x4($3)
/* 1E394 0011E294 2D204002 */  daddu      $4, $18, $0
/* 1E398 0011E298 130460A0 */  sb         $0, 0x413($3)
/* 1E39C 0011E29C 2D386000 */  daddu      $7, $3, $0
/* 1E3A0 0011E2A0 009C2925 */  addiu      $9, $9, %lo(D_002A9C00)
/* 1E3A4 0011E2A4 02000524 */  addiu      $5, $0, 0x2
/* 1E3A8 0011E2A8 0000A0AF */  sw         $0, 0x0($sp)
/* 1E3AC 0011E2AC 01000624 */  addiu      $6, $0, 0x1
/* 1E3B0 0011E2B0 14040824 */  addiu      $8, $0, 0x414
/* 1E3B4 0011E2B4 04000A24 */  addiu      $10, $0, 0x4
/* 1E3B8 0011E2B8 2A5D040C */  jal        sceSifCallRpc
/* 1E3BC 0011E2BC 2D580000 */   daddu     $11, $0, $0
/* 1E3C0 0011E2C0 2D184000 */  daddu      $3, $2, $0
/* 1E3C4 0011E2C4 04006014 */  bnez       $3, .L0011E2D8
/* 1E3C8 0011E2C8 2D106000 */   daddu     $2, $3, $0
/* 1E3CC 0011E2CC 02000224 */  addiu      $2, $0, 0x2
/* 1E3D0 0011E2D0 380AA2AE */  sw         $2, (0x250A38 & 0xFFFF)($21)
/* 1E3D4 0011E2D4 2D106000 */  daddu      $2, $3, $0
.L0011E2D8:
/* 1E3D8 0011E2D8 7000BFDF */  ld         $31, 0x70($sp)
/* 1E3DC 0011E2DC 6000B5DF */  ld         $21, 0x60($sp)
/* 1E3E0 0011E2E0 5000B4DF */  ld         $20, 0x50($sp)
/* 1E3E4 0011E2E4 4000B3DF */  ld         $19, 0x40($sp)
/* 1E3E8 0011E2E8 3000B2DF */  ld         $18, 0x30($sp)
/* 1E3EC 0011E2EC 2000B1DF */  ld         $17, 0x20($sp)
/* 1E3F0 0011E2F0 1000B0DF */  ld         $16, 0x10($sp)
/* 1E3F4 0011E2F4 0800E003 */  jr         $31
/* 1E3F8 0011E2F8 8000BD27 */   addiu     $sp, $sp, 0x80
/* 1E3FC 0011E2FC 00000000 */  nop
