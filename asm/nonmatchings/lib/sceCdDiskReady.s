.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdDiskReady
/* B3F8 0010B2F8 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* B3FC 0010B2FC 7000B6FF */  sd         $22, 0x70($sp)
/* B400 0010B300 2500163C */  lui        $22, (0x250270 >> 16)
/* B404 0010B304 3000B2FF */  sd         $18, 0x30($sp)
/* B408 0010B308 7002C28E */  lw         $2, (0x250270 & 0xFFFF)($22)
/* B40C 0010B30C 2D908000 */  daddu      $18, $4, $0
/* B410 0010B310 9000BFFF */  sd         $31, 0x90($sp)
/* B414 0010B314 8000B7FF */  sd         $23, 0x80($sp)
/* B418 0010B318 6000B5FF */  sd         $21, 0x60($sp)
/* B41C 0010B31C 5000B4FF */  sd         $20, 0x50($sp)
/* B420 0010B320 4000B3FF */  sd         $19, 0x40($sp)
/* B424 0010B324 2000B1FF */  sd         $17, 0x20($sp)
/* B428 0010B328 04004018 */  blez       $2, .L0010B33C
/* B42C 0010B32C 1000B0FF */   sd        $16, 0x10($sp)
/* B430 0010B330 2900043C */  lui        $4, %hi(D_002971C0)
/* B434 0010B334 A611040C */  jal        printf
/* B438 0010B338 C0718424 */   addiu     $4, $4, %lo(D_002971C0)
.L0010B33C:
/* B43C 0010B33C 4E26040C */  jal        cmd_sem_init
/* B440 0010B340 2500133C */   lui       $19, (0x250284 >> 16)
/* B444 0010B344 8402648E */  lw         $4, (0x250284 & 0xFFFF)($19)
/* B448 0010B348 DC50040C */  jal        PollSema
/* B44C 0010B34C 00000000 */   nop
/* B450 0010B350 8402638E */  lw         $3, (0x250284 & 0xFFFF)($19)
/* B454 0010B354 5B006214 */  bne        $3, $2, .L0010B4C4
/* B458 0010B358 06000224 */   addiu     $2, $0, 0x6
/* B45C 0010B35C 8E2B040C */  jal        sceCdSyncS
/* B460 0010B360 01000424 */   addiu     $4, $0, 0x1
/* B464 0010B364 45004014 */  bnez       $2, .L0010B47C
/* B468 0010B368 2D200000 */   daddu     $4, $0, $0
/* B46C 0010B36C 125B040C */  jal        sceSifInitRpc
/* B470 0010B370 2500113C */   lui       $17, (0x2502A8 >> 16)
/* B474 0010B374 A802228E */  lw         $2, (0x2502A8 & 0xFFFF)($17)
/* B478 0010B378 2C004104 */  bgez       $2, .L0010B42C
/* B47C 0010B37C 2A00153C */   lui       $21, %hi(D_002A4DB0)
/* B480 0010B380 2A00143C */  lui        $20, (0x2A4E60 >> 16)
/* B484 0010B384 0B000010 */  b          .L0010B3B4
/* B488 0010B388 2A00173C */   lui       $23, (0x2A0000 >> 16)
/* B48C 0010B38C 00000000 */  nop
.L0010B390:
/* B490 0010B390 FFFF0324 */  addiu      $3, $0, -0x1
/* B494 0010B394 00000000 */  nop
.L0010B398:
/* B498 0010B398 FFFF4224 */  addiu      $2, $2, %lo(D_FFFFF)
/* B49C 0010B39C 00000000 */  nop
/* B4A0 0010B3A0 00000000 */  nop
/* B4A4 0010B3A4 00000000 */  nop
/* B4A8 0010B3A8 00000000 */  nop
/* B4AC 0010B3AC FAFF4314 */  bne        $2, $3, .L0010B398
/* B4B0 0010B3B0 00000000 */   nop
.L0010B3B4:
/* B4B4 0010B3B4 B04DB026 */  addiu      $16, $21, %lo(D_002A4DB0)
.L0010B3B8:
/* B4B8 0010B3B8 0080053C */  lui        $5, (0x8000059A >> 16)
/* B4BC 0010B3BC 2D200002 */  daddu      $4, $16, $0
/* B4C0 0010B3C0 9A05A534 */  ori        $5, $5, (0x8000059A & 0xFFFF)
/* B4C4 0010B3C4 B65C040C */  jal        sceSifBindRpc
/* B4C8 0010B3C8 2D300000 */   daddu     $6, $0, $0
/* B4CC 0010B3CC 13004304 */  bgezl      $2, .L0010B41C
/* B4D0 0010B3D0 2400028E */   lw        $2, 0x24($16)
/* B4D4 0010B3D4 7002C28E */  lw         $2, (0x250270 & 0xFFFF)($22)
/* B4D8 0010B3D8 05004018 */  blez       $2, .L0010B3F0
/* B4DC 0010B3DC 1000023C */   lui       $2, %hi(D_FFFFF)
/* B4E0 0010B3E0 2900043C */  lui        $4, %hi(D_002971D0)
/* B4E4 0010B3E4 A611040C */  jal        printf
/* B4E8 0010B3E8 D0718424 */   addiu     $4, $4, %lo(D_002971D0)
/* B4EC 0010B3EC 1000023C */  lui        $2, %hi(D_FFFFF)
.L0010B3F0:
/* B4F0 0010B3F0 FFFF0324 */  addiu      $3, $0, -0x1
/* B4F4 0010B3F4 00000000 */  nop
.L0010B3F8:
/* B4F8 0010B3F8 FFFF4224 */  addiu      $2, $2, %lo(D_FFFFF)
/* B4FC 0010B3FC 00000000 */  nop
/* B500 0010B400 00000000 */  nop
/* B504 0010B404 00000000 */  nop
/* B508 0010B408 00000000 */  nop
/* B50C 0010B40C FAFF4314 */  bne        $2, $3, .L0010B3F8
/* B510 0010B410 00000000 */   nop
/* B514 0010B414 E8FF0010 */  b          .L0010B3B8
/* B518 0010B418 B04DB026 */   addiu     $16, $21, %lo(D_002A4DB0)
.L0010B41C:
/* B51C 0010B41C DCFF4010 */  beqz       $2, .L0010B390
/* B520 0010B420 1000023C */   lui       $2, %hi(D_FFFFF)
/* B524 0010B424 03000010 */  b          .L0010B434
/* B528 0010B428 A80220AE */   sw        $0, (0x2502A8 & 0xFFFF)($17)
.L0010B42C:
/* B52C 0010B42C 2A00143C */  lui        $20, (0x2A4E60 >> 16)
/* B530 0010B430 2A00173C */  lui        $23, %hi(D_002A4940)
.L0010B434:
/* B534 0010B434 604E9026 */  addiu      $16, $20, %lo(D_002A4E60)
/* B538 0010B438 604E92AE */  sw         $18, (0x2A4E60 & 0xFFFF)($20)
/* B53C 0010B43C 2D200002 */  daddu      $4, $16, $0
/* B540 0010B440 E65A040C */  jal        sceSifWriteBackDCache
/* B544 0010B444 04000524 */   addiu     $5, $0, 0x4
/* B548 0010B448 4049F126 */  addiu      $17, $23, %lo(D_002A4940)
/* B54C 0010B44C B04DA426 */  addiu      $4, $21, %lo(D_002A4DB0)
/* B550 0010B450 2D380002 */  daddu      $7, $16, $0
/* B554 0010B454 0000A0AF */  sw         $0, 0x0($sp)
/* B558 0010B458 2D280000 */  daddu      $5, $0, $0
/* B55C 0010B45C 2D300000 */  daddu      $6, $0, $0
/* B560 0010B460 04000824 */  addiu      $8, $0, 0x4
/* B564 0010B464 2D482002 */  daddu      $9, $17, $0
/* B568 0010B468 04000A24 */  addiu      $10, $0, 0x4
/* B56C 0010B46C 2A5D040C */  jal        sceSifCallRpc
/* B570 0010B470 2D580000 */   daddu     $11, $0, $0
/* B574 0010B474 09004304 */  bgezl      $2, .L0010B49C
/* B578 0010B478 7002C28E */   lw        $2, (0x250270 & 0xFFFF)($22)
.L0010B47C:
/* B57C 0010B47C 8402648E */  lw         $4, (0x250284 & 0xFFFF)($19)
/* B580 0010B480 D050040C */  jal        SignalSema
/* B584 0010B484 00000000 */   nop
/* B588 0010B488 0800443A */  xori       $4, $18, 0x8
/* B58C 0010B48C FFFF0324 */  addiu      $3, $0, -0x1
/* B590 0010B490 06000224 */  addiu      $2, $0, 0x6
/* B594 0010B494 0B000010 */  b          .L0010B4C4
/* B598 0010B498 0A106400 */   movz      $2, $3, $4
.L0010B49C:
/* B59C 0010B49C 03004018 */  blez       $2, .L0010B4AC
/* B5A0 0010B4A0 2900043C */   lui       $4, %hi(D_002971F0)
/* B5A4 0010B4A4 A611040C */  jal        printf
/* B5A8 0010B4A8 F0718424 */   addiu     $4, $4, %lo(D_002971F0)
.L0010B4AC:
/* B5AC 0010B4AC 8402648E */  lw         $4, (0x250284 & 0xFFFF)($19)
/* B5B0 0010B4B0 D050040C */  jal        SignalSema
/* B5B4 0010B4B4 00000000 */   nop
/* B5B8 0010B4B8 0020033C */  lui        $3, (0x20000000 >> 16)
/* B5BC 0010B4BC 25182302 */  or         $3, $17, $3
/* B5C0 0010B4C0 0000628C */  lw         $2, (0x20000000 & 0xFFFF)($3)
.L0010B4C4:
/* B5C4 0010B4C4 9000BFDF */  ld         $31, 0x90($sp)
/* B5C8 0010B4C8 8000B7DF */  ld         $23, 0x80($sp)
/* B5CC 0010B4CC 7000B6DF */  ld         $22, 0x70($sp)
/* B5D0 0010B4D0 6000B5DF */  ld         $21, 0x60($sp)
/* B5D4 0010B4D4 5000B4DF */  ld         $20, 0x50($sp)
/* B5D8 0010B4D8 4000B3DF */  ld         $19, 0x40($sp)
/* B5DC 0010B4DC 3000B2DF */  ld         $18, 0x30($sp)
/* B5E0 0010B4E0 2000B1DF */  ld         $17, 0x20($sp)
/* B5E4 0010B4E4 1000B0DF */  ld         $16, 0x10($sp)
/* B5E8 0010B4E8 0800E003 */  jr         $31
/* B5EC 0010B4EC A000BD27 */   addiu     $sp, $sp, 0xA0
