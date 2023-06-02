.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyFadeOut__Fv
/* 120ED0 00220DD0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 120ED4 00220DD4 0000BF7F */  sq         $31, 0x0($sp)
/* 120ED8 00220DD8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120EDC 00220DDC F88A228C */  lw         $2, -0x7508($at)
/* 120EE0 00220DE0 21004128 */  slti       $at, $2, 0x21
/* 120EE4 00220DE4 0F002014 */  bnez       $at, .L00220E24
/* 120EE8 00220DE8 00000000 */   nop
/* 120EEC 00220DEC 607F080C */  jal        ExitSaveSelect__Fv
/* 120EF0 00220DF0 00000000 */   nop
/* 120EF4 00220DF4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120EF8 00220DF8 E88A228C */  lw         $2, -0x7518($at)
/* 120EFC 00220DFC 06004010 */  beqz       $2, .L00220E18
/* 120F00 00220E00 00000000 */   nop
/* 120F04 00220E04 01000224 */  addiu      $2, $0, 0x1
/* 120F08 00220E08 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120F0C 00220E0C E48A22A0 */  sb         $2, -0x751C($at)
/* 120F10 00220E10 04000010 */  b          .L00220E24
/* 120F14 00220E14 00000000 */   nop
.L00220E18:
/* 120F18 00220E18 02000224 */  addiu      $2, $0, 0x2
/* 120F1C 00220E1C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120F20 00220E20 E48A22A0 */  sb         $2, -0x751C($at)
.L00220E24:
/* 120F24 00220E24 01000224 */  addiu      $2, $0, 0x1
/* 120F28 00220E28 0000BF7B */  lq         $31, 0x0($sp)
/* 120F2C 00220E2C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 120F30 00220E30 0800E003 */  jr         $31
/* 120F34 00220E34 00000000 */   nop
/* 120F38 00220E38 00000000 */  nop
/* 120F3C 00220E3C 00000000 */  nop
