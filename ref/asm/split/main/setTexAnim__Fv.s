.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel setTexAnim__Fv
/* 09FAB0 0019F9B0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 09FAB4 0019F9B4 1000BF7F */  sq          $31, 0x10($29)
/* 09FAB8 0019F9B8 0000B07F */  sq          $16, 0x0($29)
/* 09FABC 0019F9BC D48B848F */  lw          $4, -0x742C($28)
/* 09FAC0 0019F9C0 282E0070 */  paddub      $5, $0, $0
/* 09FAC4 0019F9C4 2083040C */  jal         sceVif1PkCnt
/* 09FAC8 0019F9C8 00000000 */   nop
/* 09FACC 0019F9CC D48B848F */  lw          $4, -0x742C($28)
/* 09FAD0 0019F9D0 282E0070 */  paddub      $5, $0, $0
/* 09FAD4 0019F9D4 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 09FAD8 0019F9D8 00000000 */   nop
/* 09FADC 0019F9DC C701023C */  lui         $2, %hi(GiftagAD)
/* 09FAE0 0019F9E0 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 09FAE4 0019F9E4 D48B848F */  lw          $4, -0x742C($28)
/* 09FAE8 0019F9E8 00004578 */  lq          $5, 0x0($2)
/* 09FAEC 0019F9EC B083040C */  jal         sceVif1PkOpenGifTag
/* 09FAF0 0019F9F0 00000000 */   nop
/* 09FAF4 0019F9F4 D48B848F */  lw          $4, -0x742C($28)
/* 09FAF8 0019F9F8 3F000524 */  addiu       $5, $0, 0x3F
/* 09FAFC 0019F9FC 28360070 */  paddub      $6, $0, $0
/* 09FB00 0019FA00 0A84040C */  jal         sceVif1PkAddGsAD
/* 09FB04 0019FA04 00000000 */   nop
/* 09FB08 0019FA08 D48B848F */  lw          $4, -0x742C($28)
/* 09FB0C 0019FA0C B683040C */  jal         sceVif1PkCloseGifTag
/* 09FB10 0019FA10 00000000 */   nop
/* 09FB14 0019FA14 D48B848F */  lw          $4, -0x742C($28)
/* 09FB18 0019FA18 A483040C */  jal         sceVif1PkCloseDirectCode
/* 09FB1C 0019FA1C 00000000 */   nop
/* 09FB20 0019FA20 109381C7 */  lwc1        $f1, -0x6CF0($28)
/* 09FB24 0019FA24 E040023C */  lui         $2, (0x40E00000 >> 16)
/* 09FB28 0019FA28 00008244 */  mtc1        $2, $f0
/* 09FB2C 0019FA2C 00000000 */  nop
/* 09FB30 0019FA30 34080046 */  c.lt.s      $f1, $f0
/* 09FB34 0019FA34 00000000 */  nop
/* 09FB38 0019FA38 04000145 */  bc1t        .L0019FA4C
/* 09FB3C 0019FA3C 00000000 */   nop
/* 09FB40 0019FA40 109380AF */  sw          $0, -0x6CF0($28)
/* 09FB44 0019FA44 04000010 */  b           .L0019FA58
/* 09FB48 0019FA48 00000000 */   nop
.L0019FA4C:
/* 09FB4C 0019FA4C 9C8280C7 */  lwc1        $f0, -0x7D64($28)
/* 09FB50 0019FA50 00080046 */  add.s       $f0, $f1, $f0
/* 09FB54 0019FA54 109380E7 */  swc1        $f0, -0x6CF0($28)
.L0019FA58:
/* 09FB58 0019FA58 10938CC7 */  lwc1        $f12, -0x6CF0($28)
/* 09FB5C 0019FA5C 2C44040C */  jal         fptosi
/* 09FB60 0019FA60 00000000 */   nop
/* 09FB64 0019FA64 0C9382AF */  sw          $2, -0x6CF4($28)
/* 09FB68 0019FA68 C701023C */  lui         $2, %hi(TexManager)
/* 09FB6C 0019FA6C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 09FB70 0019FA70 2A00023C */  lui         $2, %hi(LIT_1589)
/* 09FB74 0019FA74 68B34524 */  addiu       $5, $2, %lo(LIT_1589)
/* 09FB78 0019FA78 FFFF0624 */  addiu       $6, $0, -0x1
/* 09FB7C 0019FA7C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 09FB80 0019FA80 00000000 */   nop
/* 09FB84 0019FA84 28864070 */  paddub      $16, $2, $0
/* 09FB88 0019FA88 C701023C */  lui         $2, %hi(TexManager)
/* 09FB8C 0019FA8C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 09FB90 0019FA90 2A00023C */  lui         $2, %hi(LIT_1590)
/* 09FB94 0019FA94 78B34524 */  addiu       $5, $2, %lo(LIT_1590)
/* 09FB98 0019FA98 FFFF0624 */  addiu       $6, $0, -0x1
/* 09FB9C 0019FA9C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 09FBA0 0019FAA0 00000000 */   nop
/* 09FBA4 0019FAA4 03000012 */  beqz        $16, .L0019FAB4
/* 09FBA8 0019FAA8 00000000 */   nop
/* 09FBAC 0019FAAC 03004014 */  bnez        $2, .L0019FABC
/* 09FBB0 0019FAB0 00000000 */   nop
.L0019FAB4:
/* 09FBB4 0019FAB4 29000010 */  b           .L0019FB5C
/* 09FBB8 0019FAB8 00000000 */   nop
.L0019FABC:
/* 09FBBC 0019FABC 0C93838F */  lw          $3, -0x6CF4($28)
/* 09FBC0 0019FAC0 80190300 */  sll         $3, $3, 6
/* 09FBC4 0019FAC4 2000A0AF */  sw          $0, 0x20($29)
/* 09FBC8 0019FAC8 2400A3AF */  sw          $3, 0x24($29)
/* 09FBCC 0019FACC 40000324 */  addiu       $3, $0, 0x40
/* 09FBD0 0019FAD0 2800A3AF */  sw          $3, 0x28($29)
/* 09FBD4 0019FAD4 2C00A3AF */  sw          $3, 0x2C($29)
/* 09FBD8 0019FAD8 28000426 */  addiu       $4, $16, 0x28
/* 09FBDC 0019FADC 28004624 */  addiu       $6, $2, 0x28
/* 09FBE0 0019FAE0 2000A527 */  addiu       $5, $29, 0x20
/* 09FBE4 0019FAE4 283E0070 */  paddub      $7, $0, $0
/* 09FBE8 0019FAE8 28460070 */  paddub      $8, $0, $0
/* 09FBEC 0019FAEC 284E0070 */  paddub      $9, $0, $0
/* 09FBF0 0019FAF0 84BC040C */  jal         MGMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0iii
/* 09FBF4 0019FAF4 00000000 */   nop
/* 09FBF8 0019FAF8 D48B848F */  lw          $4, -0x742C($28)
/* 09FBFC 0019FAFC 282E0070 */  paddub      $5, $0, $0
/* 09FC00 0019FB00 2083040C */  jal         sceVif1PkCnt
/* 09FC04 0019FB04 00000000 */   nop
/* 09FC08 0019FB08 D48B848F */  lw          $4, -0x742C($28)
/* 09FC0C 0019FB0C 282E0070 */  paddub      $5, $0, $0
/* 09FC10 0019FB10 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 09FC14 0019FB14 00000000 */   nop
/* 09FC18 0019FB18 C701023C */  lui         $2, %hi(GiftagAD)
/* 09FC1C 0019FB1C C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 09FC20 0019FB20 D48B848F */  lw          $4, -0x742C($28)
/* 09FC24 0019FB24 00004578 */  lq          $5, 0x0($2)
/* 09FC28 0019FB28 B083040C */  jal         sceVif1PkOpenGifTag
/* 09FC2C 0019FB2C 00000000 */   nop
/* 09FC30 0019FB30 D48B848F */  lw          $4, -0x742C($28)
/* 09FC34 0019FB34 3F000524 */  addiu       $5, $0, 0x3F
/* 09FC38 0019FB38 28360070 */  paddub      $6, $0, $0
/* 09FC3C 0019FB3C 0A84040C */  jal         sceVif1PkAddGsAD
/* 09FC40 0019FB40 00000000 */   nop
/* 09FC44 0019FB44 D48B848F */  lw          $4, -0x742C($28)
/* 09FC48 0019FB48 B683040C */  jal         sceVif1PkCloseGifTag
/* 09FC4C 0019FB4C 00000000 */   nop
/* 09FC50 0019FB50 D48B848F */  lw          $4, -0x742C($28)
/* 09FC54 0019FB54 A483040C */  jal         sceVif1PkCloseDirectCode
/* 09FC58 0019FB58 00000000 */   nop
.L0019FB5C:
/* 09FC5C 0019FB5C 1000BF7B */  lq          $31, 0x10($29)
/* 09FC60 0019FB60 0000B07B */  lq          $16, 0x0($29)
/* 09FC64 0019FB64 3000BD27 */  addiu       $29, $29, 0x30
/* 09FC68 0019FB68 0800E003 */  jr          $31
/* 09FC6C 0019FB6C 00000000 */   nop
