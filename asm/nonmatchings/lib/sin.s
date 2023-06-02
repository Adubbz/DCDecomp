.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sin
/* 1D410 0011D310 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1D414 0011D314 2D108000 */  daddu      $2, $4, $0
/* 1D418 0011D318 3F280200 */  dsra32     $5, $2, 0
/* 1D41C 0011D31C FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 1D420 0011D320 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 1D424 0011D324 E93F023C */  lui        $2, (0x3FE921FB >> 16)
/* 1D428 0011D328 2428A300 */  and        $5, $5, $3
/* 1D42C 0011D32C FB214234 */  ori        $2, $2, (0x3FE921FB & 0xFFFF)
/* 1D430 0011D330 2A104500 */  slt        $2, $2, $5
/* 1D434 0011D334 06004014 */  bnez       $2, .L0011D350
/* 1D438 0011D338 1000BFFF */   sd        $31, 0x10($sp)
/* 1D43C 0011D33C 2D280000 */  daddu      $5, $0, $0
/* 1D440 0011D340 E86E040C */  jal        __kernel_sin
/* 1D444 0011D344 2D300000 */   daddu     $6, $0, $0
/* 1D448 0011D348 2C000010 */  b          .L0011D3FC
/* 1D44C 0011D34C 1000BFDF */   ld        $31, 0x10($sp)
.L0011D350:
/* 1D450 0011D350 EF7F023C */  lui        $2, (0x7FEFFFFF >> 16)
/* 1D454 0011D354 FFFF4234 */  ori        $2, $2, (0x7FEFFFFF & 0xFFFF)
/* 1D458 0011D358 2A104500 */  slt        $2, $2, $5
/* 1D45C 0011D35C 24004014 */  bnez       $2, .L0011D3F0
/* 1D460 0011D360 2D288000 */   daddu     $5, $4, $0
/* 1D464 0011D364 6466040C */  jal        __ieee754_rem_pio2
/* 1D468 0011D368 2D28A003 */   daddu     $5, $sp, $0
/* 1D46C 0011D36C 03004330 */  andi       $3, $2, 0x3
/* 1D470 0011D370 01000224 */  addiu      $2, $0, 0x1
/* 1D474 0011D374 10006210 */  beq        $3, $2, .L0011D3B8
/* 1D478 0011D378 02006228 */   slti      $2, $3, 0x2
/* 1D47C 0011D37C 05004010 */  beqz       $2, .L0011D394
/* 1D480 0011D380 02000224 */   addiu     $2, $0, 0x2
/* 1D484 0011D384 07006010 */  beqz       $3, .L0011D3A4
/* 1D488 0011D388 0000A4DF */   ld        $4, 0x0($sp)
/* 1D48C 0011D38C 14000010 */  b          .L0011D3E0
/* 1D490 0011D390 00000000 */   nop
.L0011D394:
/* 1D494 0011D394 0D006210 */  beq        $3, $2, .L0011D3CC
/* 1D498 0011D398 0000A4DF */   ld        $4, 0x0($sp)
/* 1D49C 0011D39C 10000010 */  b          .L0011D3E0
/* 1D4A0 0011D3A0 00000000 */   nop
.L0011D3A4:
/* 1D4A4 0011D3A4 01000624 */  addiu      $6, $0, 0x1
/* 1D4A8 0011D3A8 E86E040C */  jal        __kernel_sin
/* 1D4AC 0011D3AC 0800A5DF */   ld        $5, 0x8($sp)
/* 1D4B0 0011D3B0 12000010 */  b          .L0011D3FC
/* 1D4B4 0011D3B4 1000BFDF */   ld        $31, 0x10($sp)
.L0011D3B8:
/* 1D4B8 0011D3B8 0000A4DF */  ld         $4, 0x0($sp)
/* 1D4BC 0011D3BC 7A6B040C */  jal        __kernel_cos
/* 1D4C0 0011D3C0 0800A5DF */   ld        $5, 0x8($sp)
/* 1D4C4 0011D3C4 0D000010 */  b          .L0011D3FC
/* 1D4C8 0011D3C8 1000BFDF */   ld        $31, 0x10($sp)
.L0011D3CC:
/* 1D4CC 0011D3CC 01000624 */  addiu      $6, $0, 0x1
/* 1D4D0 0011D3D0 E86E040C */  jal        __kernel_sin
/* 1D4D4 0011D3D4 0800A5DF */   ld        $5, 0x8($sp)
/* 1D4D8 0011D3D8 04000010 */  b          .L0011D3EC
/* 1D4DC 0011D3DC 2D284000 */   daddu     $5, $2, $0
.L0011D3E0:
/* 1D4E0 0011D3E0 7A6B040C */  jal        __kernel_cos
/* 1D4E4 0011D3E4 0800A5DF */   ld        $5, 0x8($sp)
/* 1D4E8 0011D3E8 2D284000 */  daddu      $5, $2, $0
.L0011D3EC:
/* 1D4EC 0011D3EC 2D200000 */  daddu      $4, $0, $0
.L0011D3F0:
/* 1D4F0 0011D3F0 843F040C */  jal        dpsub
/* 1D4F4 0011D3F4 00000000 */   nop
/* 1D4F8 0011D3F8 1000BFDF */  ld         $31, 0x10($sp)
.L0011D3FC:
/* 1D4FC 0011D3FC 0800E003 */  jr         $31
/* 1D500 0011D400 2000BD27 */   addiu     $sp, $sp, 0x20
/* 1D504 0011D404 00000000 */  nop
