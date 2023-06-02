.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuWeaponEffectSet__Fi
/* 10D270 0020D170 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 10D274 0020D174 1000BF7F */  sq         $31, 0x10($sp)
/* 10D278 0020D178 0000B07F */  sq         $16, 0x0($sp)
/* 10D27C 0020D17C 28868070 */  paddub     $16, $4, $0
/* 10D280 0020D180 28260070 */  paddub     $4, $0, $0
/* 10D284 0020D184 1434080C */  jal        SetMenuCharaEffectReadFlag__Fi
/* 10D288 0020D188 00000000 */   nop
/* 10D28C 0020D18C E895848F */  lw         $4, -0x6A18($gp)
/* 10D290 0020D190 EC95858F */  lw         $5, -0x6A14($gp)
/* 10D294 0020D194 28360072 */  paddub     $6, $16, $0
/* 10D298 0020D198 8CE8760C */  jal        func_1DBA230
/* 10D29C 0020D19C 00000000 */   nop
/* 10D2A0 0020D1A0 1000BF7B */  lq         $31, 0x10($sp)
/* 10D2A4 0020D1A4 0000B07B */  lq         $16, 0x0($sp)
/* 10D2A8 0020D1A8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 10D2AC 0020D1AC 0800E003 */  jr         $31
/* 10D2B0 0020D1B0 00000000 */   nop
/* 10D2B4 0020D1B4 00000000 */  nop
/* 10D2B8 0020D1B8 00000000 */  nop
/* 10D2BC 0020D1BC 00000000 */  nop
