.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAlt__9CEditAreaFii
/* 6DE60 0016DD60 0500A004 */  bltz       $5, .L0016DD78
/* 6DE64 0016DD64 00000000 */   nop
/* 6DE68 0016DD68 0800828C */  lw         $2, 0x8($4)
/* 6DE6C 0016DD6C 2A10A200 */  slt        $2, $5, $2
/* 6DE70 0016DD70 04004014 */  bnez       $2, .L0016DD84
/* 6DE74 0016DD74 00000000 */   nop
.L0016DD78:
/* 6DE78 0016DD78 00008044 */  mtc1       $0, $f0
/* 6DE7C 0016DD7C 18000010 */  b          .L0016DDE0
/* 6DE80 0016DD80 00000000 */   nop
.L0016DD84:
/* 6DE84 0016DD84 0500C004 */  bltz       $6, .L0016DD9C
/* 6DE88 0016DD88 00000000 */   nop
/* 6DE8C 0016DD8C 0C00828C */  lw         $2, 0xC($4)
/* 6DE90 0016DD90 2A10C200 */  slt        $2, $6, $2
/* 6DE94 0016DD94 04004014 */  bnez       $2, .L0016DDA8
/* 6DE98 0016DD98 00000000 */   nop
.L0016DD9C:
/* 6DE9C 0016DD9C 00008044 */  mtc1       $0, $f0
/* 6DEA0 0016DDA0 0F000010 */  b          .L0016DDE0
/* 6DEA4 0016DDA4 00000000 */   nop
.L0016DDA8:
/* 6DEA8 0016DDA8 C0100500 */  sll        $2, $5, 3
/* 6DEAC 0016DDAC 23104500 */  subu       $2, $2, $5
/* 6DEB0 0016DDB0 80110200 */  sll        $2, $2, 6
/* 6DEB4 0016DDB4 21184400 */  addu       $3, $2, $4
/* 6DEB8 0016DDB8 C0100600 */  sll        $2, $6, 3
/* 6DEBC 0016DDBC 23104600 */  subu       $2, $2, $6
/* 6DEC0 0016DDC0 80100200 */  sll        $2, $2, 2
/* 6DEC4 0016DDC4 21104300 */  addu       $2, $2, $3
/* 6DEC8 0016DDC8 2C0040C4 */  lwc1       $f0, 0x2C($2)
/* 6DECC 0016DDCC 60008046 */  cvt.s.w    $f1, $f0
/* 6DED0 0016DDD0 240080C4 */  lwc1       $f0, 0x24($4)
/* 6DED4 0016DDD4 42080046 */  mul.s      $f1, $f1, $f0
/* 6DED8 0016DDD8 140080C4 */  lwc1       $f0, 0x14($4)
/* 6DEDC 0016DDDC 00000146 */  add.s      $f0, $f0, $f1
.L0016DDE0:
/* 6DEE0 0016DDE0 0800E003 */  jr         $31
/* 6DEE4 0016DDE4 00000000 */   nop
/* 6DEE8 0016DDE8 00000000 */  nop
/* 6DEEC 0016DDEC 00000000 */  nop
