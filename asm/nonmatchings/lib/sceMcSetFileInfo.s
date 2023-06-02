.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMcSetFileInfo
/* 1EEC8 0011EDC8 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 1EECC 0011EDCC 3000B2FF */  sd         $18, 0x30($sp)
/* 1EED0 0011EDD0 2500123C */  lui        $18, (0x250A38 >> 16)
/* 1EED4 0011EDD4 4000BFFF */  sd         $31, 0x40($sp)
/* 1EED8 0011EDD8 380A428E */  lw         $2, (0x250A38 & 0xFFFF)($18)
/* 1EEDC 0011EDDC 2000B1FF */  sd         $17, 0x20($sp)
/* 1EEE0 0011EDE0 48004014 */  bnez       $2, .L0011EF04
/* 1EEE4 0011EDE4 1000B0FF */   sd        $16, 0x10($sp)
/* 1EEE8 0011EDE8 2B00023C */  lui        $2, %hi(D_002A8640)
/* 1EEEC 0011EDEC 40865124 */  addiu      $17, $2, %lo(D_002A8640)
/* 1EEF0 0011EDF0 2400238E */  lw         $3, 0x24($17)
/* 1EEF4 0011EDF4 43006010 */  beqz       $3, .L0011EF04
/* 1EEF8 0011EDF8 9CFF0224 */   addiu     $2, $0, -0x64
/* 1EEFC 0011EDFC 2B00023C */  lui        $2, %hi(D_002A86F0)
/* 1EF00 0011EE00 07000831 */  andi       $8, $8, 0x7
/* 1EF04 0011EE04 F0865024 */  addiu      $16, $2, %lo(D_002A86F0)
/* 1EF08 0011EE08 F08644AC */  sw         $4, -0x7910($2)
/* 1EF0C 0011EE0C 040005AE */  sw         $5, 0x4($16)
/* 1EF10 0011EE10 2B00023C */  lui        $2, %hi(D_002A8680)
/* 1EF14 0011EE14 080008AE */  sw         $8, 0x8($16)
/* 1EF18 0011EE18 2D28C000 */  daddu      $5, $6, $0
/* 1EF1C 0011EE1C 80864324 */  addiu      $3, $2, %lo(D_002A8680)
/* 1EF20 0011EE20 14000426 */  addiu      $4, $16, 0x14
/* 1EF24 0011EE24 80864A24 */  addiu      $10, $2, %lo(D_002A8680)
/* 1EF28 0011EE28 0700E668 */  ldl        $6, 0x7($7)
/* 1EF2C 0011EE2C 0000E66C */  ldr        $6, 0x0($7)
/* 1EF30 0011EE30 0F00E868 */  ldl        $8, 0xF($7)
/* 1EF34 0011EE34 0800E86C */  ldr        $8, 0x8($7)
/* 1EF38 0011EE38 1700E968 */  ldl        $9, 0x17($7)
/* 1EF3C 0011EE3C 1000E96C */  ldr        $9, 0x10($7)
/* 1EF40 0011EE40 070046B1 */  sdl        $6, 0x7($10)
/* 1EF44 0011EE44 000046B5 */  sdr        $6, 0x0($10)
/* 1EF48 0011EE48 0F0048B1 */  sdl        $8, 0xF($10)
/* 1EF4C 0011EE4C 080048B5 */  sdr        $8, 0x8($10)
/* 1EF50 0011EE50 170049B1 */  sdl        $9, 0x17($10)
/* 1EF54 0011EE54 100049B5 */  sdr        $9, 0x10($10)
/* 1EF58 0011EE58 1F00E668 */  ldl        $6, 0x1F($7)
/* 1EF5C 0011EE5C 1800E66C */  ldr        $6, 0x18($7)
/* 1EF60 0011EE60 2700E868 */  ldl        $8, 0x27($7)
/* 1EF64 0011EE64 2000E86C */  ldr        $8, 0x20($7)
/* 1EF68 0011EE68 2F00E968 */  ldl        $9, 0x2F($7)
/* 1EF6C 0011EE6C 2800E96C */  ldr        $9, 0x28($7)
/* 1EF70 0011EE70 1F0046B1 */  sdl        $6, 0x1F($10)
/* 1EF74 0011EE74 180046B5 */  sdr        $6, 0x18($10)
/* 1EF78 0011EE78 270048B1 */  sdl        $8, 0x27($10)
/* 1EF7C 0011EE7C 200048B5 */  sdr        $8, 0x20($10)
/* 1EF80 0011EE80 2F0049B1 */  sdl        $9, 0x2F($10)
/* 1EF84 0011EE84 280049B5 */  sdr        $9, 0x28($10)
/* 1EF88 0011EE88 3700E668 */  ldl        $6, 0x37($7)
/* 1EF8C 0011EE8C 3000E66C */  ldr        $6, 0x30($7)
/* 1EF90 0011EE90 3F00E868 */  ldl        $8, 0x3F($7)
/* 1EF94 0011EE94 3800E86C */  ldr        $8, 0x38($7)
/* 1EF98 0011EE98 370046B1 */  sdl        $6, 0x37($10)
/* 1EF9C 0011EE9C 300046B5 */  sdr        $6, 0x30($10)
/* 1EFA0 0011EEA0 3F0048B1 */  sdl        $8, 0x3F($10)
/* 1EFA4 0011EEA4 380048B5 */  sdr        $8, 0x38($10)
/* 1EFA8 0011EEA8 FF030624 */  addiu      $6, $0, 0x3FF
/* 1EFAC 0011EEAC 5C16040C */  jal        strncpy
/* 1EFB0 0011EEB0 100003AE */   sw        $3, 0x10($16)
/* 1EFB4 0011EEB4 130400A2 */  sb         $0, 0x413($16)
/* 1EFB8 0011EEB8 6851040C */  jal        FlushCache
/* 1EFBC 0011EEBC 2D200000 */   daddu     $4, $0, $0
/* 1EFC0 0011EEC0 2B00093C */  lui        $9, %hi(D_002A9C00)
/* 1EFC4 0011EEC4 2D202002 */  daddu      $4, $17, $0
/* 1EFC8 0011EEC8 2D380002 */  daddu      $7, $16, $0
/* 1EFCC 0011EECC 009C2925 */  addiu      $9, $9, %lo(D_002A9C00)
/* 1EFD0 0011EED0 0000A0AF */  sw         $0, 0x0($sp)
/* 1EFD4 0011EED4 0E000524 */  addiu      $5, $0, 0xE
/* 1EFD8 0011EED8 01000624 */  addiu      $6, $0, 0x1
/* 1EFDC 0011EEDC 14040824 */  addiu      $8, $0, 0x414
/* 1EFE0 0011EEE0 04000A24 */  addiu      $10, $0, 0x4
/* 1EFE4 0011EEE4 2A5D040C */  jal        sceSifCallRpc
/* 1EFE8 0011EEE8 2D580000 */   daddu     $11, $0, $0
/* 1EFEC 0011EEEC 2D184000 */  daddu      $3, $2, $0
/* 1EFF0 0011EEF0 04006014 */  bnez       $3, .L0011EF04
/* 1EFF4 0011EEF4 2D106000 */   daddu     $2, $3, $0
/* 1EFF8 0011EEF8 0E000224 */  addiu      $2, $0, 0xE
/* 1EFFC 0011EEFC 380A42AE */  sw         $2, (0x250A38 & 0xFFFF)($18)
/* 1F000 0011EF00 2D106000 */  daddu      $2, $3, $0
.L0011EF04:
/* 1F004 0011EF04 4000BFDF */  ld         $31, 0x40($sp)
/* 1F008 0011EF08 3000B2DF */  ld         $18, 0x30($sp)
/* 1F00C 0011EF0C 2000B1DF */  ld         $17, 0x20($sp)
/* 1F010 0011EF10 1000B0DF */  ld         $16, 0x10($sp)
/* 1F014 0011EF14 0800E003 */  jr         $31
/* 1F018 0011EF18 5000BD27 */   addiu     $sp, $sp, 0x50
/* 1F01C 0011EF1C 00000000 */  nop
