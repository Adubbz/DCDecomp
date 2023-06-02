.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawNowEquipWeaponMark__Fiiiii
/* 12FAD0 0022F9D0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 12FAD4 0022F9D4 4000BF7F */  sq         $31, 0x40($sp)
/* 12FAD8 0022F9D8 3000B37F */  sq         $19, 0x30($sp)
/* 12FADC 0022F9DC 2000B27F */  sq         $18, 0x20($sp)
/* 12FAE0 0022F9E0 1000B17F */  sq         $17, 0x10($sp)
/* 12FAE4 0022F9E4 0000B07F */  sq         $16, 0x0($sp)
/* 12FAE8 0022F9E8 289E8070 */  paddub     $19, $4, $0
/* 12FAEC 0022F9EC 2896C070 */  paddub     $18, $6, $0
/* 12FAF0 0022F9F0 288EE070 */  paddub     $17, $7, $0
/* 12FAF4 0022F9F4 28860071 */  paddub     $16, $8, $0
/* 12FAF8 0022F9F8 7400A5AF */  sw         $5, 0x74($sp)
/* 12FAFC 0022F9FC C0000224 */  addiu      $2, $0, 0xC0
/* 12FB00 0022FA00 7800A2AF */  sw         $2, 0x78($sp)
/* 12FB04 0022FA04 28000224 */  addiu      $2, $0, 0x28
/* 12FB08 0022FA08 7C00A2AF */  sw         $2, 0x7C($sp)
/* 12FB0C 0022FA0C 7400A427 */  addiu      $4, $sp, 0x74
/* 12FB10 0022FA10 7800A527 */  addiu      $5, $sp, 0x78
/* 12FB14 0022FA14 7C00A627 */  addiu      $6, $sp, 0x7C
/* 12FB18 0022FA18 283E4072 */  paddub     $7, $18, $0
/* 12FB1C 0022FA1C 28462072 */  paddub     $8, $17, $0
/* 12FB20 0022FA20 A0B7080C */  jal        MenuTextureClip__FRiRiRiii
/* 12FB24 0022FA24 00000000 */   nop
/* 12FB28 0022FA28 7400A48F */  lw         $4, 0x74($sp)
/* 12FB2C 0022FA2C 7C00A38F */  lw         $3, 0x7C($sp)
/* 12FB30 0022FA30 21188300 */  addu       $3, $4, $3
/* 12FB34 0022FA34 2A187200 */  slt        $3, $3, $18
/* 12FB38 0022FA38 04006014 */  bnez       $3, .L0022FA4C
/* 12FB3C 0022FA3C 00000000 */   nop
/* 12FB40 0022FA40 2A089100 */  slt        $at, $4, $17
/* 12FB44 0022FA44 03002014 */  bnez       $at, .L0022FA54
/* 12FB48 0022FA48 00000000 */   nop
.L0022FA4C:
/* 12FB4C 0022FA4C 18000010 */  b          .L0022FAB0
/* 12FB50 0022FA50 00000000 */   nop
.L0022FA54:
/* 12FB54 0022FA54 A497828F */  lw         $2, -0x685C($gp)
/* 12FB58 0022FA58 00004484 */  lh         $4, 0x0($2)
/* 12FB5C 0022FA5C 38B4080C */  jal        MenuTextureReload__Fi
/* 12FB60 0022FA60 00000000 */   nop
/* 12FB64 0022FA64 7C00A48F */  lw         $4, 0x7C($sp)
/* 12FB68 0022FA68 7800A38F */  lw         $3, 0x78($sp)
/* 12FB6C 0022FA6C 14010224 */  addiu      $2, $0, 0x114
/* 12FB70 0022FA70 6000A2AF */  sw         $2, 0x60($sp)
/* 12FB74 0022FA74 6400A3AF */  sw         $3, 0x64($sp)
/* 12FB78 0022FA78 28000224 */  addiu      $2, $0, 0x28
/* 12FB7C 0022FA7C 6800A2AF */  sw         $2, 0x68($sp)
/* 12FB80 0022FA80 6C00A4AF */  sw         $4, 0x6C($sp)
/* 12FB84 0022FA84 7400A38F */  lw         $3, 0x74($sp)
/* 12FB88 0022FA88 5000B3AF */  sw         $19, 0x50($sp)
/* 12FB8C 0022FA8C 5400A3AF */  sw         $3, 0x54($sp)
/* 12FB90 0022FA90 5800A2AF */  sw         $2, 0x58($sp)
/* 12FB94 0022FA94 5C00A4AF */  sw         $4, 0x5C($sp)
/* 12FB98 0022FA98 A497848F */  lw         $4, -0x685C($gp)
/* 12FB9C 0022FA9C 5000A527 */  addiu      $5, $sp, 0x50
/* 12FBA0 0022FAA0 6000A627 */  addiu      $6, $sp, 0x60
/* 12FBA4 0022FAA4 283E0072 */  paddub     $7, $16, $0
/* 12FBA8 0022FAA8 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 12FBAC 0022FAAC 00000000 */   nop
.L0022FAB0:
/* 12FBB0 0022FAB0 4000BF7B */  lq         $31, 0x40($sp)
/* 12FBB4 0022FAB4 3000B37B */  lq         $19, 0x30($sp)
/* 12FBB8 0022FAB8 2000B27B */  lq         $18, 0x20($sp)
/* 12FBBC 0022FABC 1000B17B */  lq         $17, 0x10($sp)
/* 12FBC0 0022FAC0 0000B07B */  lq         $16, 0x0($sp)
/* 12FBC4 0022FAC4 8000BD27 */  addiu      $sp, $sp, 0x80
/* 12FBC8 0022FAC8 0800E003 */  jr         $31
/* 12FBCC 0022FACC 00000000 */   nop
