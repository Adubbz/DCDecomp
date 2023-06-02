.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponStarDraw__FiiP11WEAPON_HAVEi
/* 10FB20 0020FA20 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* 10FB24 0020FA24 9000BF7F */  sq         $31, 0x90($sp)
/* 10FB28 0020FA28 8000BE7F */  sq         $fp, 0x80($sp)
/* 10FB2C 0020FA2C 7000B77F */  sq         $23, 0x70($sp)
/* 10FB30 0020FA30 6000B67F */  sq         $22, 0x60($sp)
/* 10FB34 0020FA34 5000B57F */  sq         $21, 0x50($sp)
/* 10FB38 0020FA38 4000B47F */  sq         $20, 0x40($sp)
/* 10FB3C 0020FA3C 3000B37F */  sq         $19, 0x30($sp)
/* 10FB40 0020FA40 2000B27F */  sq         $18, 0x20($sp)
/* 10FB44 0020FA44 1000B17F */  sq         $17, 0x10($sp)
/* 10FB48 0020FA48 0000B07F */  sq         $16, 0x0($sp)
/* 10FB4C 0020FA4C 28B68070 */  paddub     $22, $4, $0
/* 10FB50 0020FA50 28AEA070 */  paddub     $21, $5, $0
/* 10FB54 0020FA54 288EC070 */  paddub     $17, $6, $0
/* 10FB58 0020FA58 28A6E070 */  paddub     $20, $7, $0
/* 10FB5C 0020FA5C 53002012 */  beqz       $17, .L0020FBAC
/* 10FB60 0020FA60 00000000 */   nop
/* 10FB64 0020FA64 C701023C */  lui        $2, %hi(TexManager)
/* 10FB68 0020FA68 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10FB6C 0020FA6C 2A00023C */  lui        $2, %hi(_1536)
/* 10FB70 0020FA70 D8E14524 */  addiu      $5, $2, %lo(_1536)
/* 10FB74 0020FA74 FFFF0624 */  addiu      $6, $0, -0x1
/* 10FB78 0020FA78 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 10FB7C 0020FA7C 00000000 */   nop
/* 10FB80 0020FA80 28864070 */  paddub     $16, $2, $0
/* 10FB84 0020FA84 F000318E */  lw         $17, 0xF0($17)
/* 10FB88 0020FA88 3200212A */  slti       $at, $17, 0x32
/* 10FB8C 0020FA8C 02002014 */  bnez       $at, .L0020FA98
/* 10FB90 0020FA90 00000000 */   nop
/* 10FB94 0020FA94 31001124 */  addiu      $17, $0, 0x31
.L0020FA98:
/* 10FB98 0020FA98 4C00D226 */  addiu      $18, $22, 0x4C
/* 10FB9C 0020FA9C 08010324 */  addiu      $3, $0, 0x108
/* 10FBA0 0020FAA0 A000A3AF */  sw         $3, 0xA0($sp)
/* 10FBA4 0020FAA4 76010324 */  addiu      $3, $0, 0x176
/* 10FBA8 0020FAA8 A400A3AF */  sw         $3, 0xA4($sp)
/* 10FBAC 0020FAAC 18000324 */  addiu      $3, $0, 0x18
/* 10FBB0 0020FAB0 A800B727 */  addiu      $23, $sp, 0xA8
/* 10FBB4 0020FAB4 0000E3AE */  sw         $3, 0x0($23)
/* 10FBB8 0020FAB8 AC00BE27 */  addiu      $fp, $sp, 0xAC
/* 10FBBC 0020FABC 0000C3AF */  sw         $3, 0x0($fp)
/* 10FBC0 0020FAC0 289E0070 */  paddub     $19, $0, $0
/* 10FBC4 0020FAC4 10000010 */  b          .L0020FB08
/* 10FBC8 0020FAC8 00000000 */   nop
.L0020FACC:
/* 10FBCC 0020FACC 0000C38F */  lw         $3, 0x0($fp)
/* 10FBD0 0020FAD0 0000E28E */  lw         $2, 0x0($23)
/* 10FBD4 0020FAD4 B000B2AF */  sw         $18, 0xB0($sp)
/* 10FBD8 0020FAD8 B400B5AF */  sw         $21, 0xB4($sp)
/* 10FBDC 0020FADC B800A2AF */  sw         $2, 0xB8($sp)
/* 10FBE0 0020FAE0 BC00A3AF */  sw         $3, 0xBC($sp)
/* 10FBE4 0020FAE4 28260072 */  paddub     $4, $16, $0
/* 10FBE8 0020FAE8 B000A527 */  addiu      $5, $sp, 0xB0
/* 10FBEC 0020FAEC A000A627 */  addiu      $6, $sp, 0xA0
/* 10FBF0 0020FAF0 283E8072 */  paddub     $7, $20, $0
/* 10FBF4 0020FAF4 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10FBF8 0020FAF8 00000000 */   nop
/* 10FBFC 0020FAFC 01007326 */  addiu      $19, $19, 0x1
/* 10FC00 0020FB00 0000E38E */  lw         $3, 0x0($23)
/* 10FC04 0020FB04 21904302 */  addu       $18, $18, $3
.L0020FB08:
/* 10FC08 0020FB08 0A000324 */  addiu      $3, $0, 0xA
/* 10FC0C 0020FB0C 1A002302 */  div        $0, $17, $3
/* 10FC10 0020FB10 02006014 */  bnez       $3, .L0020FB1C
/* 10FC14 0020FB14 00000000 */   nop
/* 10FC18 0020FB18 CD010000 */  break      0, 7
.L0020FB1C:
/* 10FC1C 0020FB1C 12180000 */  mflo       $3
/* 10FC20 0020FB20 2A186302 */  slt        $3, $19, $3
/* 10FC24 0020FB24 E9FF6014 */  bnez       $3, .L0020FACC
/* 10FC28 0020FB28 00000000 */   nop
/* 10FC2C 0020FB2C FAFFD626 */  addiu      $22, $22, -0x6
/* 10FC30 0020FB30 28960070 */  paddub     $18, $0, $0
/* 10FC34 0020FB34 15000010 */  b          .L0020FB8C
/* 10FC38 0020FB38 00000000 */   nop
.L0020FB3C:
/* 10FC3C 0020FB3C 0A010224 */  addiu      $2, $0, 0x10A
/* 10FC40 0020FB40 D000A2AF */  sw         $2, 0xD0($sp)
/* 10FC44 0020FB44 62010224 */  addiu      $2, $0, 0x162
/* 10FC48 0020FB48 D400A2AF */  sw         $2, 0xD4($sp)
/* 10FC4C 0020FB4C 14000324 */  addiu      $3, $0, 0x14
/* 10FC50 0020FB50 D800A3AF */  sw         $3, 0xD8($sp)
/* 10FC54 0020FB54 DC00A3AF */  sw         $3, 0xDC($sp)
/* 10FC58 0020FB58 C000B6AF */  sw         $22, 0xC0($sp)
/* 10FC5C 0020FB5C 1600A226 */  addiu      $2, $21, 0x16
/* 10FC60 0020FB60 C400A2AF */  sw         $2, 0xC4($sp)
/* 10FC64 0020FB64 C800A3AF */  sw         $3, 0xC8($sp)
/* 10FC68 0020FB68 CC00A3AF */  sw         $3, 0xCC($sp)
/* 10FC6C 0020FB6C 28260072 */  paddub     $4, $16, $0
/* 10FC70 0020FB70 C000A527 */  addiu      $5, $sp, 0xC0
/* 10FC74 0020FB74 D000A627 */  addiu      $6, $sp, 0xD0
/* 10FC78 0020FB78 283E8072 */  paddub     $7, $20, $0
/* 10FC7C 0020FB7C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10FC80 0020FB80 00000000 */   nop
/* 10FC84 0020FB84 01005226 */  addiu      $18, $18, 0x1
/* 10FC88 0020FB88 1400D626 */  addiu      $22, $22, 0x14
.L0020FB8C:
/* 10FC8C 0020FB8C 0A000324 */  addiu      $3, $0, 0xA
/* 10FC90 0020FB90 1A002302 */  div        $0, $17, $3
/* 10FC94 0020FB94 00000000 */  nop
/* 10FC98 0020FB98 00000000 */  nop
/* 10FC9C 0020FB9C 10180000 */  mfhi       $3
/* 10FCA0 0020FBA0 2A184302 */  slt        $3, $18, $3
/* 10FCA4 0020FBA4 E5FF6014 */  bnez       $3, .L0020FB3C
/* 10FCA8 0020FBA8 00000000 */   nop
.L0020FBAC:
/* 10FCAC 0020FBAC 9000BF7B */  lq         $31, 0x90($sp)
/* 10FCB0 0020FBB0 8000BE7B */  lq         $fp, 0x80($sp)
/* 10FCB4 0020FBB4 7000B77B */  lq         $23, 0x70($sp)
/* 10FCB8 0020FBB8 6000B67B */  lq         $22, 0x60($sp)
/* 10FCBC 0020FBBC 5000B57B */  lq         $21, 0x50($sp)
/* 10FCC0 0020FBC0 4000B47B */  lq         $20, 0x40($sp)
/* 10FCC4 0020FBC4 3000B37B */  lq         $19, 0x30($sp)
/* 10FCC8 0020FBC8 2000B27B */  lq         $18, 0x20($sp)
/* 10FCCC 0020FBCC 1000B17B */  lq         $17, 0x10($sp)
/* 10FCD0 0020FBD0 0000B07B */  lq         $16, 0x0($sp)
/* 10FCD4 0020FBD4 E000BD27 */  addiu      $sp, $sp, 0xE0
/* 10FCD8 0020FBD8 0800E003 */  jr         $31
/* 10FCDC 0020FBDC 00000000 */   nop
