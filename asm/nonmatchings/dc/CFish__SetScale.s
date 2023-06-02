.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetScale__5CFishFv
/* 140E60 00240D60 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 140E64 00240D64 1000BF7F */  sq         $31, 0x10($sp)
/* 140E68 00240D68 0000B07F */  sq         $16, 0x0($sp)
/* 140E6C 00240D6C 28868070 */  paddub     $16, $4, $0
/* 140E70 00240D70 3C8F040C */  jal        nrnd__Fv
/* 140E74 00240D74 00000000 */   nop
/* 140E78 00240D78 080001C6 */  lwc1       $f1, 0x8($16)
/* 140E7C 00240D7C 600001E6 */  swc1       $f1, 0x60($16)
/* 140E80 00240D80 00088044 */  mtc1       $0, $f1
/* 140E84 00240D84 00000000 */  nop
/* 140E88 00240D88 34000146 */  c.lt.s     $f0, $f1
/* 140E8C 00240D8C 00000000 */  nop
/* 140E90 00240D90 0E000145 */  bc1t       .L00240DCC
/* 140E94 00240D94 00000000 */   nop
/* 140E98 00240D98 0C0002C6 */  lwc1       $f2, 0xC($16)
/* 140E9C 00240D9C 080001C6 */  lwc1       $f1, 0x8($16)
/* 140EA0 00240DA0 41100146 */  sub.s      $f1, $f2, $f1
/* 140EA4 00240DA4 42000146 */  mul.s      $f1, $f0, $f1
/* 140EA8 00240DA8 8040033C */  lui        $3, (0x40800000 >> 16)
/* 140EAC 00240DAC 00008344 */  mtc1       $3, $f0
/* 140EB0 00240DB0 00000000 */  nop
/* 140EB4 00240DB4 43080046 */  div.s      $f1, $f1, $f0
/* 140EB8 00240DB8 600000C6 */  lwc1       $f0, 0x60($16)
/* 140EBC 00240DBC 00000146 */  add.s      $f0, $f0, $f1
/* 140EC0 00240DC0 600000E6 */  swc1       $f0, 0x60($16)
/* 140EC4 00240DC4 0C000010 */  b          .L00240DF8
/* 140EC8 00240DC8 00000000 */   nop
.L00240DCC:
/* 140ECC 00240DCC 0C0002C6 */  lwc1       $f2, 0xC($16)
/* 140ED0 00240DD0 080001C6 */  lwc1       $f1, 0x8($16)
/* 140ED4 00240DD4 41100146 */  sub.s      $f1, $f2, $f1
/* 140ED8 00240DD8 42000146 */  mul.s      $f1, $f0, $f1
/* 140EDC 00240DDC 0041033C */  lui        $3, (0x41000000 >> 16)
/* 140EE0 00240DE0 00008344 */  mtc1       $3, $f0
/* 140EE4 00240DE4 00000000 */  nop
/* 140EE8 00240DE8 43080046 */  div.s      $f1, $f1, $f0
/* 140EEC 00240DEC 600000C6 */  lwc1       $f0, 0x60($16)
/* 140EF0 00240DF0 00000146 */  add.s      $f0, $f0, $f1
/* 140EF4 00240DF4 600000E6 */  swc1       $f0, 0x60($16)
.L00240DF8:
/* 140EF8 00240DF8 600002C6 */  lwc1       $f2, 0x60($16)
/* 140EFC 00240DFC 003F033C */  lui        $3, (0x3F000000 >> 16)
/* 140F00 00240E00 00088344 */  mtc1       $3, $f1
/* 140F04 00240E04 080000C6 */  lwc1       $f0, 0x8($16)
/* 140F08 00240E08 02080046 */  mul.s      $f0, $f1, $f0
/* 140F0C 00240E0C 34100046 */  c.lt.s     $f2, $f0
/* 140F10 00240E10 00000000 */  nop
/* 140F14 00240E14 02000045 */  bc1f       .L00240E20
/* 140F18 00240E18 00000000 */   nop
/* 140F1C 00240E1C 600000E6 */  swc1       $f0, 0x60($16)
.L00240E20:
/* 140F20 00240E20 600000C6 */  lwc1       $f0, 0x60($16)
/* 140F24 00240E24 0C0001C6 */  lwc1       $f1, 0xC($16)
/* 140F28 00240E28 36000146 */  c.le.s     $f0, $f1
/* 140F2C 00240E2C 00000000 */  nop
/* 140F30 00240E30 02000145 */  bc1t       .L00240E3C
/* 140F34 00240E34 00000000 */   nop
/* 140F38 00240E38 600001E6 */  swc1       $f1, 0x60($16)
.L00240E3C:
/* 140F3C 00240E3C 600001C6 */  lwc1       $f1, 0x60($16)
/* 140F40 00240E40 040000C6 */  lwc1       $f0, 0x4($16)
/* 140F44 00240E44 03080046 */  div.s      $f0, $f1, $f0
/* 140F48 00240E48 640000E6 */  swc1       $f0, 0x64($16)
/* 140F4C 00240E4C C841033C */  lui        $3, (0x41C80000 >> 16)
/* 140F50 00240E50 00088344 */  mtc1       $3, $f1
/* 140F54 00240E54 600000C6 */  lwc1       $f0, 0x60($16)
/* 140F58 00240E58 03000146 */  div.s      $f0, $f0, $f1
/* 140F5C 00240E5C 680000E6 */  swc1       $f0, 0x68($16)
/* 140F60 00240E60 1000BF7B */  lq         $31, 0x10($sp)
/* 140F64 00240E64 0000B07B */  lq         $16, 0x0($sp)
/* 140F68 00240E68 2000BD27 */  addiu      $sp, $sp, 0x20
/* 140F6C 00240E6C 0800E003 */  jr         $31
/* 140F70 00240E70 00000000 */   nop
/* 140F74 00240E74 00000000 */  nop
/* 140F78 00240E78 00000000 */  nop
/* 140F7C 00240E7C 00000000 */  nop