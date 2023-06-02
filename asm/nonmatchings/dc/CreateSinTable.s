.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CreateSinTable__Fv
/* 23EB0 00123DB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 23EB4 00123DB4 1000BF7F */  sq         $31, 0x10($sp)
/* 23EB8 00123DB8 0000B07F */  sq         $16, 0x0($sp)
/* 23EBC 00123DBC 8044033C */  lui        $3, (0x44800000 >> 16)
/* 23EC0 00123DC0 908683AF */  sw         $3, -0x7970($gp)
/* 23EC4 00123DC4 DC8080C7 */  lwc1       $f0, -0x7F24($gp)
/* 23EC8 00123DC8 948680E7 */  swc1       $f0, -0x796C($gp)
/* 23ECC 00123DCC 28860070 */  paddub     $16, $0, $0
/* 23ED0 00123DD0 13000010 */  b          .L00123E20
/* 23ED4 00123DD4 00000000 */   nop
.L00123DD8:
/* 23ED8 00123DD8 0040023C */  lui        $2, (0x40000000 >> 16)
/* 23EDC 00123DDC 00088244 */  mtc1       $2, $f1
/* 23EE0 00123DE0 00009044 */  mtc1       $16, $f0
/* 23EE4 00123DE4 00000000 */  nop
/* 23EE8 00123DE8 20008046 */  cvt.s.w    $f0, $f0
/* 23EEC 00123DEC 42080046 */  mul.s      $f1, $f1, $f0
/* 23EF0 00123DF0 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* 23EF4 00123DF4 42000146 */  mul.s      $f1, $f0, $f1
/* 23EF8 00123DF8 908680C7 */  lwc1       $f0, -0x7970($gp)
/* 23EFC 00123DFC 030B0046 */  div.s      $f12, $f1, $f0
/* 23F00 00123E00 2876040C */  jal        sinf
/* 23F04 00123E04 00000000 */   nop
/* 23F08 00123E08 80201000 */  sll        $4, $16, 2
/* 23F0C 00123E0C 2B00033C */  lui        $3, %hi(SinTable)
/* 23F10 00123E10 10A06324 */  addiu      $3, $3, %lo(SinTable)
/* 23F14 00123E14 21186400 */  addu       $3, $3, $4
/* 23F18 00123E18 000060E4 */  swc1       $f0, 0x0($3)
/* 23F1C 00123E1C 01001026 */  addiu      $16, $16, 0x1
.L00123E20:
/* 23F20 00123E20 0004032A */  slti       $3, $16, 0x400
/* 23F24 00123E24 ECFF6014 */  bnez       $3, .L00123DD8
/* 23F28 00123E28 00000000 */   nop
/* 23F2C 00123E2C 1000BF7B */  lq         $31, 0x10($sp)
/* 23F30 00123E30 0000B07B */  lq         $16, 0x0($sp)
/* 23F34 00123E34 2000BD27 */  addiu      $sp, $sp, 0x20
/* 23F38 00123E38 0800E003 */  jr         $31
/* 23F3C 00123E3C 00000000 */   nop
