.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel setTexAnim__Fv
/* 9FAB0 0019F9B0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9FAB4 0019F9B4 1000BF7F */  sq         $31, 0x10($sp)
/* 9FAB8 0019F9B8 0000B07F */  sq         $16, 0x0($sp)
/* 9FABC 0019F9BC D48B848F */  lw         $4, -0x742C($gp)
/* 9FAC0 0019F9C0 282E0070 */  paddub     $5, $0, $0
/* 9FAC4 0019F9C4 2083040C */  jal        sceVif1PkCnt
/* 9FAC8 0019F9C8 00000000 */   nop
/* 9FACC 0019F9CC D48B848F */  lw         $4, -0x742C($gp)
/* 9FAD0 0019F9D0 282E0070 */  paddub     $5, $0, $0
/* 9FAD4 0019F9D4 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 9FAD8 0019F9D8 00000000 */   nop
/* 9FADC 0019F9DC C701023C */  lui        $2, %hi(GiftagAD)
/* 9FAE0 0019F9E0 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 9FAE4 0019F9E4 D48B848F */  lw         $4, -0x742C($gp)
/* 9FAE8 0019F9E8 00004578 */  lq         $5, 0x0($2)
/* 9FAEC 0019F9EC B083040C */  jal        sceVif1PkOpenGifTag
/* 9FAF0 0019F9F0 00000000 */   nop
/* 9FAF4 0019F9F4 D48B848F */  lw         $4, -0x742C($gp)
/* 9FAF8 0019F9F8 3F000524 */  addiu      $5, $0, 0x3F
/* 9FAFC 0019F9FC 28360070 */  paddub     $6, $0, $0
/* 9FB00 0019FA00 0A84040C */  jal        sceVif1PkAddGsAD
/* 9FB04 0019FA04 00000000 */   nop
/* 9FB08 0019FA08 D48B848F */  lw         $4, -0x742C($gp)
/* 9FB0C 0019FA0C B683040C */  jal        sceVif1PkCloseGifTag
/* 9FB10 0019FA10 00000000 */   nop
/* 9FB14 0019FA14 D48B848F */  lw         $4, -0x742C($gp)
/* 9FB18 0019FA18 A483040C */  jal        sceVif1PkCloseDirectCode
/* 9FB1C 0019FA1C 00000000 */   nop
/* 9FB20 0019FA20 109381C7 */  lwc1       $f1, -0x6CF0($gp)
/* 9FB24 0019FA24 E040023C */  lui        $2, (0x40E00000 >> 16)
/* 9FB28 0019FA28 00008244 */  mtc1       $2, $f0
/* 9FB2C 0019FA2C 00000000 */  nop
/* 9FB30 0019FA30 34080046 */  c.lt.s     $f1, $f0
/* 9FB34 0019FA34 00000000 */  nop
/* 9FB38 0019FA38 04000145 */  bc1t       .L0019FA4C
/* 9FB3C 0019FA3C 00000000 */   nop
/* 9FB40 0019FA40 109380AF */  sw         $0, -0x6CF0($gp)
/* 9FB44 0019FA44 04000010 */  b          .L0019FA58
/* 9FB48 0019FA48 00000000 */   nop
.L0019FA4C:
/* 9FB4C 0019FA4C 9C8280C7 */  lwc1       $f0, -0x7D64($gp)
/* 9FB50 0019FA50 00080046 */  add.s      $f0, $f1, $f0
/* 9FB54 0019FA54 109380E7 */  swc1       $f0, -0x6CF0($gp)
.L0019FA58:
/* 9FB58 0019FA58 10938CC7 */  lwc1       $f12, -0x6CF0($gp)
/* 9FB5C 0019FA5C 2C44040C */  jal        fptosi
/* 9FB60 0019FA60 00000000 */   nop
/* 9FB64 0019FA64 0C9382AF */  sw         $2, -0x6CF4($gp)
/* 9FB68 0019FA68 C701023C */  lui        $2, %hi(TexManager)
/* 9FB6C 0019FA6C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 9FB70 0019FA70 2A00023C */  lui        $2, %hi(_1589)
/* 9FB74 0019FA74 68B34524 */  addiu      $5, $2, %lo(_1589)
/* 9FB78 0019FA78 FFFF0624 */  addiu      $6, $0, -0x1
/* 9FB7C 0019FA7C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 9FB80 0019FA80 00000000 */   nop
/* 9FB84 0019FA84 28864070 */  paddub     $16, $2, $0
/* 9FB88 0019FA88 C701023C */  lui        $2, %hi(TexManager)
/* 9FB8C 0019FA8C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 9FB90 0019FA90 2A00023C */  lui        $2, %hi(_1590)
/* 9FB94 0019FA94 78B34524 */  addiu      $5, $2, %lo(_1590)
/* 9FB98 0019FA98 FFFF0624 */  addiu      $6, $0, -0x1
/* 9FB9C 0019FA9C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 9FBA0 0019FAA0 00000000 */   nop
/* 9FBA4 0019FAA4 03000012 */  beqz       $16, .L0019FAB4
/* 9FBA8 0019FAA8 00000000 */   nop
/* 9FBAC 0019FAAC 03004014 */  bnez       $2, .L0019FABC
/* 9FBB0 0019FAB0 00000000 */   nop
.L0019FAB4:
/* 9FBB4 0019FAB4 29000010 */  b          .L0019FB5C
/* 9FBB8 0019FAB8 00000000 */   nop
.L0019FABC:
/* 9FBBC 0019FABC 0C93838F */  lw         $3, -0x6CF4($gp)
/* 9FBC0 0019FAC0 80190300 */  sll        $3, $3, 6
/* 9FBC4 0019FAC4 2000A0AF */  sw         $0, 0x20($sp)
/* 9FBC8 0019FAC8 2400A3AF */  sw         $3, 0x24($sp)
/* 9FBCC 0019FACC 40000324 */  addiu      $3, $0, 0x40
/* 9FBD0 0019FAD0 2800A3AF */  sw         $3, 0x28($sp)
/* 9FBD4 0019FAD4 2C00A3AF */  sw         $3, 0x2C($sp)
/* 9FBD8 0019FAD8 28000426 */  addiu      $4, $16, 0x28
/* 9FBDC 0019FADC 28004624 */  addiu      $6, $2, 0x28
/* 9FBE0 0019FAE0 2000A527 */  addiu      $5, $sp, 0x20
/* 9FBE4 0019FAE4 283E0070 */  paddub     $7, $0, $0
/* 9FBE8 0019FAE8 28460070 */  paddub     $8, $0, $0
/* 9FBEC 0019FAEC 284E0070 */  paddub     $9, $0, $0
/* 9FBF0 0019FAF0 84BC040C */  jal        MGMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0iii
/* 9FBF4 0019FAF4 00000000 */   nop
/* 9FBF8 0019FAF8 D48B848F */  lw         $4, -0x742C($gp)
/* 9FBFC 0019FAFC 282E0070 */  paddub     $5, $0, $0
/* 9FC00 0019FB00 2083040C */  jal        sceVif1PkCnt
/* 9FC04 0019FB04 00000000 */   nop
/* 9FC08 0019FB08 D48B848F */  lw         $4, -0x742C($gp)
/* 9FC0C 0019FB0C 282E0070 */  paddub     $5, $0, $0
/* 9FC10 0019FB10 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 9FC14 0019FB14 00000000 */   nop
/* 9FC18 0019FB18 C701023C */  lui        $2, %hi(GiftagAD)
/* 9FC1C 0019FB1C C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 9FC20 0019FB20 D48B848F */  lw         $4, -0x742C($gp)
/* 9FC24 0019FB24 00004578 */  lq         $5, 0x0($2)
/* 9FC28 0019FB28 B083040C */  jal        sceVif1PkOpenGifTag
/* 9FC2C 0019FB2C 00000000 */   nop
/* 9FC30 0019FB30 D48B848F */  lw         $4, -0x742C($gp)
/* 9FC34 0019FB34 3F000524 */  addiu      $5, $0, 0x3F
/* 9FC38 0019FB38 28360070 */  paddub     $6, $0, $0
/* 9FC3C 0019FB3C 0A84040C */  jal        sceVif1PkAddGsAD
/* 9FC40 0019FB40 00000000 */   nop
/* 9FC44 0019FB44 D48B848F */  lw         $4, -0x742C($gp)
/* 9FC48 0019FB48 B683040C */  jal        sceVif1PkCloseGifTag
/* 9FC4C 0019FB4C 00000000 */   nop
/* 9FC50 0019FB50 D48B848F */  lw         $4, -0x742C($gp)
/* 9FC54 0019FB54 A483040C */  jal        sceVif1PkCloseDirectCode
/* 9FC58 0019FB58 00000000 */   nop
.L0019FB5C:
/* 9FC5C 0019FB5C 1000BF7B */  lq         $31, 0x10($sp)
/* 9FC60 0019FB60 0000B07B */  lq         $16, 0x0($sp)
/* 9FC64 0019FB64 3000BD27 */  addiu      $sp, $sp, 0x30
/* 9FC68 0019FB68 0800E003 */  jr         $31
/* 9FC6C 0019FB6C 00000000 */   nop
