.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel nrnd__Fv
/* 23DF0 00123CF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 23DF4 00123CF4 1000BF7F */  sq         $31, 0x10($sp)
/* 23DF8 00123CF8 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 23DFC 00123CFC 2C8F040C */  jal        rnd__Fv
/* 23E00 00123D00 00000000 */   nop
/* 23E04 00123D04 06050046 */  mov.s      $f20, $f0
/* 23E08 00123D08 2C8F040C */  jal        rnd__Fv
/* 23E0C 00123D0C 00000000 */   nop
/* 23E10 00123D10 00A50046 */  add.s      $f20, $f20, $f0
/* 23E14 00123D14 2C8F040C */  jal        rnd__Fv
/* 23E18 00123D18 00000000 */   nop
/* 23E1C 00123D1C 00051446 */  add.s      $f20, $f0, $f20
/* 23E20 00123D20 2C8F040C */  jal        rnd__Fv
/* 23E24 00123D24 00000000 */   nop
/* 23E28 00123D28 00051446 */  add.s      $f20, $f0, $f20
/* 23E2C 00123D2C 2C8F040C */  jal        rnd__Fv
/* 23E30 00123D30 00000000 */   nop
/* 23E34 00123D34 00051446 */  add.s      $f20, $f0, $f20
/* 23E38 00123D38 2C8F040C */  jal        rnd__Fv
/* 23E3C 00123D3C 00000000 */   nop
/* 23E40 00123D40 00051446 */  add.s      $f20, $f0, $f20
/* 23E44 00123D44 2C8F040C */  jal        rnd__Fv
/* 23E48 00123D48 00000000 */   nop
/* 23E4C 00123D4C 00051446 */  add.s      $f20, $f0, $f20
/* 23E50 00123D50 2C8F040C */  jal        rnd__Fv
/* 23E54 00123D54 00000000 */   nop
/* 23E58 00123D58 00051446 */  add.s      $f20, $f0, $f20
/* 23E5C 00123D5C 2C8F040C */  jal        rnd__Fv
/* 23E60 00123D60 00000000 */   nop
/* 23E64 00123D64 00051446 */  add.s      $f20, $f0, $f20
/* 23E68 00123D68 2C8F040C */  jal        rnd__Fv
/* 23E6C 00123D6C 00000000 */   nop
/* 23E70 00123D70 00051446 */  add.s      $f20, $f0, $f20
/* 23E74 00123D74 2C8F040C */  jal        rnd__Fv
/* 23E78 00123D78 00000000 */   nop
/* 23E7C 00123D7C 00051446 */  add.s      $f20, $f0, $f20
/* 23E80 00123D80 2C8F040C */  jal        rnd__Fv
/* 23E84 00123D84 00000000 */   nop
/* 23E88 00123D88 40001446 */  add.s      $f1, $f0, $f20
/* 23E8C 00123D8C C040023C */  lui        $2, (0x40C00000 >> 16)
/* 23E90 00123D90 00008244 */  mtc1       $2, $f0
/* 23E94 00123D94 00000000 */  nop
/* 23E98 00123D98 01080046 */  sub.s      $f0, $f1, $f0
/* 23E9C 00123D9C 1000BF7B */  lq         $31, 0x10($sp)
/* 23EA0 00123DA0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 23EA4 00123DA4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 23EA8 00123DA8 0800E003 */  jr         $31
/* 23EAC 00123DAC 00000000 */   nop
