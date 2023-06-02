.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WepRecover__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i
/* 136E00 00236D00 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 136E04 00236D04 3000BF7F */  sq         $31, 0x30($sp)
/* 136E08 00236D08 2000B27F */  sq         $18, 0x20($sp)
/* 136E0C 00236D0C 1000B17F */  sq         $17, 0x10($sp)
/* 136E10 00236D10 0000B07F */  sq         $16, 0x0($sp)
/* 136E14 00236D14 28968070 */  paddub     $18, $4, $0
/* 136E18 00236D18 288EA070 */  paddub     $17, $5, $0
/* 136E1C 00236D1C 2886C070 */  paddub     $16, $6, $0
/* 136E20 00236D20 05002012 */  beqz       $17, .L00236D38
/* 136E24 00236D24 00000000 */   nop
/* 136E28 00236D28 03000012 */  beqz       $16, .L00236D38
/* 136E2C 00236D2C 00000000 */   nop
/* 136E30 00236D30 0300E014 */  bnez       $7, .L00236D40
/* 136E34 00236D34 00000000 */   nop
.L00236D38:
/* 136E38 00236D38 0D000010 */  b          .L00236D70
/* 136E3C 00236D3C 00000000 */   nop
.L00236D40:
/* 136E40 00236D40 041348A6 */  sh         $8, 0x1304($18)
/* 136E44 00236D44 03000224 */  addiu      $2, $0, 0x3
/* 136E48 00236D48 021342A6 */  sh         $2, 0x1302($18)
/* 136E4C 00236D4C 0A000224 */  addiu      $2, $0, 0xA
/* 136E50 00236D50 141342A6 */  sh         $2, 0x1314($18)
/* 136E54 00236D54 DC1240A6 */  sh         $0, 0x12DC($18)
/* 136E58 00236D58 02134686 */  lh         $6, 0x1302($18)
/* 136E5C 00236D5C 282EE070 */  paddub     $5, $7, $0
/* 136E60 00236D60 00D8080C */  jal        CMenuEffectDataLoad__14CWeaponLevelUpFP1i
/* 136E64 00236D64 00000000 */   nop
/* 136E68 00236D68 D81250AE */  sw         $16, 0x12D8($18)
/* 136E6C 00236D6C D41251AE */  sw         $17, 0x12D4($18)
.L00236D70:
/* 136E70 00236D70 3000BF7B */  lq         $31, 0x30($sp)
/* 136E74 00236D74 2000B27B */  lq         $18, 0x20($sp)
/* 136E78 00236D78 1000B17B */  lq         $17, 0x10($sp)
/* 136E7C 00236D7C 0000B07B */  lq         $16, 0x0($sp)
/* 136E80 00236D80 4000BD27 */  addiu      $sp, $sp, 0x40
/* 136E84 00236D84 0800E003 */  jr         $31
/* 136E88 00236D88 00000000 */   nop
/* 136E8C 00236D8C 00000000 */  nop
