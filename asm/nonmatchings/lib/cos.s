.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel cos
/* 1D0D0 0011CFD0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1D0D4 0011CFD4 2D108000 */  daddu      $2, $4, $0
/* 1D0D8 0011CFD8 3F280200 */  dsra32     $5, $2, 0
/* 1D0DC 0011CFDC FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 1D0E0 0011CFE0 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 1D0E4 0011CFE4 E93F023C */  lui        $2, (0x3FE921FB >> 16)
/* 1D0E8 0011CFE8 2428A300 */  and        $5, $5, $3
/* 1D0EC 0011CFEC FB214234 */  ori        $2, $2, (0x3FE921FB & 0xFFFF)
/* 1D0F0 0011CFF0 2A104500 */  slt        $2, $2, $5
/* 1D0F4 0011CFF4 06004014 */  bnez       $2, .L0011D010
/* 1D0F8 0011CFF8 1000BFFF */   sd        $31, 0x10($sp)
/* 1D0FC 0011CFFC 7A6B040C */  jal        __kernel_cos
/* 1D100 0011D000 2D280000 */   daddu     $5, $0, $0
/* 1D104 0011D004 32000010 */  b          .L0011D0D0
/* 1D108 0011D008 1000BFDF */   ld        $31, 0x10($sp)
/* 1D10C 0011D00C 00000000 */  nop
.L0011D010:
/* 1D110 0011D010 EF7F023C */  lui        $2, (0x7FEFFFFF >> 16)
/* 1D114 0011D014 FFFF4234 */  ori        $2, $2, (0x7FEFFFFF & 0xFFFF)
/* 1D118 0011D018 2A104500 */  slt        $2, $2, $5
/* 1D11C 0011D01C 05004010 */  beqz       $2, .L0011D034
/* 1D120 0011D020 00000000 */   nop
/* 1D124 0011D024 843F040C */  jal        dpsub
/* 1D128 0011D028 2D288000 */   daddu     $5, $4, $0
/* 1D12C 0011D02C 28000010 */  b          .L0011D0D0
/* 1D130 0011D030 1000BFDF */   ld        $31, 0x10($sp)
.L0011D034:
/* 1D134 0011D034 6466040C */  jal        __ieee754_rem_pio2
/* 1D138 0011D038 2D28A003 */   daddu     $5, $sp, $0
/* 1D13C 0011D03C 03004330 */  andi       $3, $2, 0x3
/* 1D140 0011D040 01000224 */  addiu      $2, $0, 0x1
/* 1D144 0011D044 0F006210 */  beq        $3, $2, .L0011D084
/* 1D148 0011D048 02006228 */   slti      $2, $3, 0x2
/* 1D14C 0011D04C 05004010 */  beqz       $2, .L0011D064
/* 1D150 0011D050 02000224 */   addiu     $2, $0, 0x2
/* 1D154 0011D054 07006010 */  beqz       $3, .L0011D074
/* 1D158 0011D058 0000A4DF */   ld        $4, 0x0($sp)
/* 1D15C 0011D05C 19000010 */  b          .L0011D0C4
/* 1D160 0011D060 01000624 */   addiu     $6, $0, 0x1
.L0011D064:
/* 1D164 0011D064 10006210 */  beq        $3, $2, .L0011D0A8
/* 1D168 0011D068 0000A4DF */   ld        $4, 0x0($sp)
/* 1D16C 0011D06C 15000010 */  b          .L0011D0C4
/* 1D170 0011D070 01000624 */   addiu     $6, $0, 0x1
.L0011D074:
/* 1D174 0011D074 7A6B040C */  jal        __kernel_cos
/* 1D178 0011D078 0800A5DF */   ld        $5, 0x8($sp)
/* 1D17C 0011D07C 14000010 */  b          .L0011D0D0
/* 1D180 0011D080 1000BFDF */   ld        $31, 0x10($sp)
.L0011D084:
/* 1D184 0011D084 0000A4DF */  ld         $4, 0x0($sp)
/* 1D188 0011D088 01000624 */  addiu      $6, $0, 0x1
/* 1D18C 0011D08C E86E040C */  jal        __kernel_sin
/* 1D190 0011D090 0800A5DF */   ld        $5, 0x8($sp)
/* 1D194 0011D094 2D284000 */  daddu      $5, $2, $0
/* 1D198 0011D098 843F040C */  jal        dpsub
/* 1D19C 0011D09C 2D200000 */   daddu     $4, $0, $0
/* 1D1A0 0011D0A0 0B000010 */  b          .L0011D0D0
/* 1D1A4 0011D0A4 1000BFDF */   ld        $31, 0x10($sp)
.L0011D0A8:
/* 1D1A8 0011D0A8 7A6B040C */  jal        __kernel_cos
/* 1D1AC 0011D0AC 0800A5DF */   ld        $5, 0x8($sp)
/* 1D1B0 0011D0B0 2D284000 */  daddu      $5, $2, $0
/* 1D1B4 0011D0B4 843F040C */  jal        dpsub
/* 1D1B8 0011D0B8 2D200000 */   daddu     $4, $0, $0
/* 1D1BC 0011D0BC 04000010 */  b          .L0011D0D0
/* 1D1C0 0011D0C0 1000BFDF */   ld        $31, 0x10($sp)
.L0011D0C4:
/* 1D1C4 0011D0C4 E86E040C */  jal        __kernel_sin
/* 1D1C8 0011D0C8 0800A5DF */   ld        $5, 0x8($sp)
/* 1D1CC 0011D0CC 1000BFDF */  ld         $31, 0x10($sp)
.L0011D0D0:
/* 1D1D0 0011D0D0 0800E003 */  jr         $31
/* 1D1D4 0011D0D4 2000BD27 */   addiu     $sp, $sp, 0x20
