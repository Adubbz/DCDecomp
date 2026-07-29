.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetAlt__9CEditAreaFii
/* 06DE60 0016DD60 0500A004 */  bltz        $5, .L0016DD78
/* 06DE64 0016DD64 00000000 */   nop
/* 06DE68 0016DD68 0800828C */  lw          $2, 0x8($4)
/* 06DE6C 0016DD6C 2A10A200 */  slt         $2, $5, $2
/* 06DE70 0016DD70 04004014 */  bnez        $2, .L0016DD84
/* 06DE74 0016DD74 00000000 */   nop
.L0016DD78:
/* 06DE78 0016DD78 00008044 */  mtc1        $0, $f0
/* 06DE7C 0016DD7C 18000010 */  b           .L0016DDE0
/* 06DE80 0016DD80 00000000 */   nop
.L0016DD84:
/* 06DE84 0016DD84 0500C004 */  bltz        $6, .L0016DD9C
/* 06DE88 0016DD88 00000000 */   nop
/* 06DE8C 0016DD8C 0C00828C */  lw          $2, 0xC($4)
/* 06DE90 0016DD90 2A10C200 */  slt         $2, $6, $2
/* 06DE94 0016DD94 04004014 */  bnez        $2, .L0016DDA8
/* 06DE98 0016DD98 00000000 */   nop
.L0016DD9C:
/* 06DE9C 0016DD9C 00008044 */  mtc1        $0, $f0
/* 06DEA0 0016DDA0 0F000010 */  b           .L0016DDE0
/* 06DEA4 0016DDA4 00000000 */   nop
.L0016DDA8:
/* 06DEA8 0016DDA8 C0100500 */  sll         $2, $5, 3
/* 06DEAC 0016DDAC 23104500 */  subu        $2, $2, $5
/* 06DEB0 0016DDB0 80110200 */  sll         $2, $2, 6
/* 06DEB4 0016DDB4 21184400 */  addu        $3, $2, $4
/* 06DEB8 0016DDB8 C0100600 */  sll         $2, $6, 3
/* 06DEBC 0016DDBC 23104600 */  subu        $2, $2, $6
/* 06DEC0 0016DDC0 80100200 */  sll         $2, $2, 2
/* 06DEC4 0016DDC4 21104300 */  addu        $2, $2, $3
/* 06DEC8 0016DDC8 2C0040C4 */  lwc1        $f0, 0x2C($2)
/* 06DECC 0016DDCC 60008046 */  cvt.s.w     $f1, $f0
/* 06DED0 0016DDD0 240080C4 */  lwc1        $f0, 0x24($4)
/* 06DED4 0016DDD4 42080046 */  mul.s       $f1, $f1, $f0
/* 06DED8 0016DDD8 140080C4 */  lwc1        $f0, 0x14($4)
/* 06DEDC 0016DDDC 00000146 */  add.s       $f0, $f0, $f1
.L0016DDE0:
/* 06DEE0 0016DDE0 0800E003 */  jr          $31
/* 06DEE4 0016DDE4 00000000 */   nop
/* 06DEE8 0016DDE8 00000000 */  nop
/* 06DEEC 0016DDEC 00000000 */  nop
