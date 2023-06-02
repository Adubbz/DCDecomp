.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMcClose
/* 1E438 0011E338 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 1E43C 0011E33C 1000B0FF */  sd         $16, 0x10($sp)
/* 1E440 0011E340 2500103C */  lui        $16, (0x250A38 >> 16)
/* 1E444 0011E344 2000BFFF */  sd         $31, 0x20($sp)
/* 1E448 0011E348 380A028E */  lw         $2, (0x250A38 & 0xFFFF)($16)
/* 1E44C 0011E34C 19004014 */  bnez       $2, .L0011E3B4
/* 1E450 0011E350 2D288000 */   daddu     $5, $4, $0
/* 1E454 0011E354 2B00023C */  lui        $2, %hi(D_002A8640)
/* 1E458 0011E358 40864424 */  addiu      $4, $2, %lo(D_002A8640)
/* 1E45C 0011E35C 2400838C */  lw         $3, 0x24($4)
/* 1E460 0011E360 03006014 */  bnez       $3, .L0011E370
/* 1E464 0011E364 2B00073C */   lui       $7, %hi(D_002A86C0)
/* 1E468 0011E368 12000010 */  b          .L0011E3B4
/* 1E46C 0011E36C 9CFF0224 */   addiu     $2, $0, -0x64
.L0011E370:
/* 1E470 0011E370 2B00093C */  lui        $9, %hi(D_002A9C00)
/* 1E474 0011E374 C086E5AC */  sw         $5, -0x7940($7)
/* 1E478 0011E378 009C2925 */  addiu      $9, $9, %lo(D_002A9C00)
/* 1E47C 0011E37C C086E724 */  addiu      $7, $7, %lo(D_002A86C0)
/* 1E480 0011E380 0000A0AF */  sw         $0, 0x0($sp)
/* 1E484 0011E384 03000524 */  addiu      $5, $0, 0x3
/* 1E488 0011E388 01000624 */  addiu      $6, $0, 0x1
/* 1E48C 0011E38C 30000824 */  addiu      $8, $0, 0x30
/* 1E490 0011E390 04000A24 */  addiu      $10, $0, 0x4
/* 1E494 0011E394 2A5D040C */  jal        sceSifCallRpc
/* 1E498 0011E398 2D580000 */   daddu     $11, $0, $0
/* 1E49C 0011E39C 2D184000 */  daddu      $3, $2, $0
/* 1E4A0 0011E3A0 04006014 */  bnez       $3, .L0011E3B4
/* 1E4A4 0011E3A4 2D106000 */   daddu     $2, $3, $0
/* 1E4A8 0011E3A8 03000224 */  addiu      $2, $0, 0x3
/* 1E4AC 0011E3AC 380A02AE */  sw         $2, (0x250A38 & 0xFFFF)($16)
/* 1E4B0 0011E3B0 2D106000 */  daddu      $2, $3, $0
.L0011E3B4:
/* 1E4B4 0011E3B4 2000BFDF */  ld         $31, 0x20($sp)
/* 1E4B8 0011E3B8 1000B0DF */  ld         $16, 0x10($sp)
/* 1E4BC 0011E3BC 0800E003 */  jr         $31
/* 1E4C0 0011E3C0 3000BD27 */   addiu     $sp, $sp, 0x30
/* 1E4C4 0011E3C4 00000000 */  nop
