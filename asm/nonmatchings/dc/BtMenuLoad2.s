.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtMenuLoad2__Fi
/* 10EB00 0020EA00 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 10EB04 0020EA04 0000BF7F */  sq         $31, 0x0($sp)
/* 10EB08 0020EA08 25008010 */  beqz       $4, .L0020EAA0
/* 10EB0C 0020EA0C 00000000 */   nop
/* 10EB10 0020EA10 28260070 */  paddub     $4, $0, $0
/* 10EB14 0020EA14 18FB040C */  jal        GetReadBGFile__Fi
/* 10EB18 0020EA18 00000000 */   nop
/* 10EB1C 0020EA1C 2900033C */  lui        $3, %hi(_1255)
/* 10EB20 0020EA20 F03B6624 */  addiu      $6, $3, %lo(_1255)
/* 10EB24 0020EA24 1000A527 */  addiu      $5, $sp, 0x10
/* 10EB28 0020EA28 02000424 */  addiu      $4, $0, 0x2
.L0020EA2C:
/* 10EB2C 0020EA2C 0000C378 */  lq         $3, 0x0($6)
/* 10EB30 0020EA30 1000C624 */  addiu      $6, $6, 0x10
/* 10EB34 0020EA34 FFFF8424 */  addiu      $4, $4, -0x1
/* 10EB38 0020EA38 0000A37C */  sq         $3, 0x0($5)
/* 10EB3C 0020EA3C 1000A524 */  addiu      $5, $5, 0x10
/* 10EB40 0020EA40 FAFF801C */  bgtz       $4, .L0020EA2C
/* 10EB44 0020EA44 00000000 */   nop
/* 10EB48 0020EA48 0000C3C4 */  lwc1       $f3, 0x0($6)
/* 10EB4C 0020EA4C 0000A3E4 */  swc1       $f3, 0x0($5)
/* 10EB50 0020EA50 F494858F */  lw         $5, -0x6B0C($gp)
/* 10EB54 0020EA54 1400A5AF */  sw         $5, 0x14($sp)
/* 10EB58 0020EA58 8C00428C */  lw         $2, 0x8C($2)
/* 10EB5C 0020EA5C 1C00A2AF */  sw         $2, 0x1C($sp)
/* 10EB60 0020EA60 2000A5AF */  sw         $5, 0x20($sp)
/* 10EB64 0020EA64 C701023C */  lui        $2, %hi(TexManager)
/* 10EB68 0020EA68 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10EB6C 0020EA6C C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 10EB70 0020EA70 00000000 */   nop
/* 10EB74 0020EA74 C701023C */  lui        $2, %hi(TexManager)
/* 10EB78 0020EA78 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10EB7C 0020EA7C FFFF0524 */  addiu      $5, $0, -0x1
/* 10EB80 0020EA80 1000A627 */  addiu      $6, $sp, 0x10
/* 10EB84 0020EA84 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 10EB88 0020EA88 00000000 */   nop
/* 10EB8C 0020EA8C F494848F */  lw         $4, -0x6B0C($gp)
/* 10EB90 0020EA90 38B4080C */  jal        MenuTextureReload__Fi
/* 10EB94 0020EA94 00000000 */   nop
/* 10EB98 0020EA98 ACA9080C */  jal        DngActiveWeaponTextureCopy__Fv
/* 10EB9C 0020EA9C 00000000 */   nop
.L0020EAA0:
/* 10EBA0 0020EAA0 4C6D050C */  jal        SndVoiceSyncBG__Fv
/* 10EBA4 0020EAA4 00000000 */   nop
/* 10EBA8 0020EAA8 01000324 */  addiu      $3, $0, 0x1
/* 10EBAC 0020EAAC DC01013C */  lui        $at, (0x1DC4480 >> 16)
/* 10EBB0 0020EAB0 804423AC */  sw         $3, (0x1DC4480 & 0xFFFF)($at)
/* 10EBB4 0020EAB4 DC01013C */  lui        $at, (0x1DC448C >> 16)
/* 10EBB8 0020EAB8 8C4420AC */  sw         $0, (0x1DC448C & 0xFFFF)($at)
/* 10EBBC 0020EABC DC01013C */  lui        $at, (0x1DC4490 >> 16)
/* 10EBC0 0020EAC0 904420AC */  sw         $0, (0x1DC4490 & 0xFFFF)($at)
/* 10EBC4 0020EAC4 0000BF7B */  lq         $31, 0x0($sp)
/* 10EBC8 0020EAC8 4000BD27 */  addiu      $sp, $sp, 0x40
/* 10EBCC 0020EACC 0800E003 */  jr         $31
/* 10EBD0 0020EAD0 00000000 */   nop
/* 10EBD4 0020EAD4 00000000 */  nop
/* 10EBD8 0020EAD8 00000000 */  nop
/* 10EBDC 0020EADC 00000000 */  nop
