.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtMenuLoadChara__Fv
/* 10EA60 0020E960 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 10EA64 0020E964 0000BF7F */  sq         $31, 0x0($sp)
/* 10EA68 0020E968 F8958283 */  lb         $2, -0x6A08($gp)
/* 10EA6C 0020E96C 789C838F */  lw         $3, -0x6388($gp)
/* 10EA70 0020E970 040062A0 */  sb         $2, 0x4($3)
/* 10EA74 0020E974 F8958487 */  lh         $4, -0x6A08($gp)
/* 10EA78 0020E978 0096868F */  lw         $6, -0x6A00($gp)
/* 10EA7C 0020E97C 0496878F */  lw         $7, -0x69FC($gp)
/* 10EA80 0020E980 0896888F */  lw         $8, -0x69F8($gp)
/* 10EA84 0020E984 0C96898F */  lw         $9, -0x69F4($gp)
/* 10EA88 0020E988 282E0070 */  paddub     $5, $0, $0
/* 10EA8C 0020E98C F0E8760C */  jal        func_1DBA3C0
/* 10EA90 0020E990 00000000 */   nop
/* 10EA94 0020E994 049D848F */  lw         $4, -0x62FC($gp)
/* 10EA98 0020E998 A896080C */  jal        SetWeaponAttachStatus__FP11WEAPON_HAVE
/* 10EA9C 0020E99C 00000000 */   nop
/* 10EAA0 0020E9A0 009D838F */  lw         $3, -0x6300($gp)
/* 10EAA4 0020E9A4 E601023C */  lui        $2, %hi(D_1E58F40)
/* 10EAA8 0020E9A8 408F4424 */  addiu      $4, $2, %lo(D_1E58F40)
/* 10EAAC 0020E9AC BC00658C */  lw         $5, 0xBC($3)
/* 10EAB0 0020E9B0 2A00023C */  lui        $2, %hi(_1250)
/* 10EAB4 0020E9B4 68E14624 */  addiu      $6, $2, %lo(_1250)
/* 10EAB8 0020E9B8 2A00023C */  lui        $2, %hi(_1251)
/* 10EABC 0020E9BC 70E14724 */  addiu      $7, $2, %lo(_1251)
/* 10EAC0 0020E9C0 7059070C */  jal        InitSet__13CWeaponEffectFP6CFramePcPc
/* 10EAC4 0020E9C4 00000000 */   nop
/* 10EAC8 0020E9C8 80E7760C */  jal        func_1DB9E00
/* 10EACC 0020E9CC 00000000 */   nop
/* 10EAD0 0020E9D0 EC95858F */  lw         $5, -0x6A14($gp)
/* 10EAD4 0020E9D4 E895848F */  lw         $4, -0x6A18($gp)
/* 10EAD8 0020E9D8 28360070 */  paddub     $6, $0, $0
/* 10EADC 0020E9DC 8CE8760C */  jal        func_1DBA230
/* 10EAE0 0020E9E0 00000000 */   nop
/* 10EAE4 0020E9E4 0000BF7B */  lq         $31, 0x0($sp)
/* 10EAE8 0020E9E8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 10EAEC 0020E9EC 0800E003 */  jr         $31
/* 10EAF0 0020E9F0 00000000 */   nop
/* 10EAF4 0020E9F4 00000000 */  nop
/* 10EAF8 0020E9F8 00000000 */  nop
/* 10EAFC 0020E9FC 00000000 */  nop
