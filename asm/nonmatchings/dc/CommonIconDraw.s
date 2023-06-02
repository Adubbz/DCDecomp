.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommonIconDraw__Fiiiiiii
/* 12FBD0 0022FAD0 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* 12FBD4 0022FAD4 9000BF7F */  sq         $31, 0x90($sp)
/* 12FBD8 0022FAD8 8000BE7F */  sq         $fp, 0x80($sp)
/* 12FBDC 0022FADC 7000B77F */  sq         $23, 0x70($sp)
/* 12FBE0 0022FAE0 6000B67F */  sq         $22, 0x60($sp)
/* 12FBE4 0022FAE4 5000B57F */  sq         $21, 0x50($sp)
/* 12FBE8 0022FAE8 4000B47F */  sq         $20, 0x40($sp)
/* 12FBEC 0022FAEC 3000B37F */  sq         $19, 0x30($sp)
/* 12FBF0 0022FAF0 2000B27F */  sq         $18, 0x20($sp)
/* 12FBF4 0022FAF4 1000B17F */  sq         $17, 0x10($sp)
/* 12FBF8 0022FAF8 0000B07F */  sq         $16, 0x0($sp)
/* 12FBFC 0022FAFC EC00A5AF */  sw         $5, 0xEC($sp)
/* 12FC00 0022FB00 289EC070 */  paddub     $19, $6, $0
/* 12FC04 0022FB04 28AE0071 */  paddub     $21, $8, $0
/* 12FC08 0022FB08 28A62071 */  paddub     $20, $9, $0
/* 12FC0C 0022FB0C 28B64071 */  paddub     $22, $10, $0
/* 12FC10 0022FB10 04006326 */  addiu      $3, $19, 0x4
/* 12FC14 0022FB14 A000A3AF */  sw         $3, 0xA0($sp)
/* 12FC18 0022FB18 288EE070 */  paddub     $17, $7, $0
/* 12FC1C 0022FB1C 0900812C */  sltiu      $at, $4, 0x9
/* 12FC20 0022FB20 1A012010 */  beqz       $at, .L0022FF8C
/* 12FC24 0022FB24 00000000 */   nop
/* 12FC28 0022FB28 2A00033C */  lui        $3, %hi(_1416_2)
/* 12FC2C 0022FB2C 00F26524 */  addiu      $5, $3, %lo(_1416_2)
/* 12FC30 0022FB30 80180400 */  sll        $3, $4, 2
/* 12FC34 0022FB34 21186500 */  addu       $3, $3, $5
/* 12FC38 0022FB38 0000638C */  lw         $3, 0x0($3)
/* 12FC3C 0022FB3C 08006000 */  jr         $3
/* 12FC40 0022FB40 00000000 */   nop
/* 12FC44 0022FB44 A897828F */  lw         $2, -0x6858($gp)
/* 12FC48 0022FB48 0000438C */  lw         $3, 0x0($2)
/* 12FC4C 0022FB4C 01000224 */  addiu      $2, $0, 0x1
/* 12FC50 0022FB50 06006214 */  bne        $3, $2, .L0022FB6C
/* 12FC54 0022FB54 00000000 */   nop
/* 12FC58 0022FB58 F494848F */  lw         $4, -0x6B0C($gp)
/* 12FC5C 0022FB5C 38B4080C */  jal        MenuTextureReload__Fi
/* 12FC60 0022FB60 00000000 */   nop
/* 12FC64 0022FB64 0F000010 */  b          .L0022FBA4
/* 12FC68 0022FB68 00000000 */   nop
.L0022FB6C:
/* 12FC6C 0022FB6C C701023C */  lui        $2, %hi(TexManager)
/* 12FC70 0022FB70 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 12FC74 0022FB74 2A00023C */  lui        $2, %hi(_852_4)
/* 12FC78 0022FB78 A8F14524 */  addiu      $5, $2, %lo(_852_4)
/* 12FC7C 0022FB7C FFFF0624 */  addiu      $6, $0, -0x1
/* 12FC80 0022FB80 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 12FC84 0022FB84 00000000 */   nop
/* 12FC88 0022FB88 28964070 */  paddub     $18, $2, $0
/* 12FC8C 0022FB8C 05004012 */  beqz       $18, .L0022FBA4
/* 12FC90 0022FB90 00000000 */   nop
/* 12FC94 0022FB94 00004486 */  lh         $4, 0x0($18)
/* 12FC98 0022FB98 38B4080C */  jal        MenuTextureReload__Fi
/* 12FC9C 0022FB9C 00000000 */   nop
/* 12FCA0 0022FBA0 B09692AF */  sw         $18, -0x6950($gp)
.L0022FBA4:
/* 12FCA4 0022FBA4 02007026 */  addiu      $16, $19, 0x2
/* 12FCA8 0022FBA8 A897838F */  lw         $3, -0x6858($gp)
/* 12FCAC 0022FBAC 2800778C */  lw         $23, 0x28($3)
/* 12FCB0 0022FBB0 28960070 */  paddub     $18, $0, $0
/* 12FCB4 0022FBB4 28000010 */  b          .L0022FC58
/* 12FCB8 0022FBB8 00000000 */   nop
.L0022FBBC:
/* 12FCBC 0022FBBC 40291200 */  sll        $5, $18, 5
/* 12FCC0 0022FBC0 2118E502 */  addu       $3, $23, $5
/* 12FCC4 0022FBC4 00006484 */  lh         $4, 0x0($3)
/* 12FCC8 0022FBC8 5B008228 */  slti       $2, $4, 0x5B
/* 12FCCC 0022FBCC 08004014 */  bnez       $2, .L0022FBF0
/* 12FCD0 0022FBD0 00000000 */   nop
/* 12FCD4 0022FBD4 5F008128 */  slti       $at, $4, 0x5F
/* 12FCD8 0022FBD8 05002010 */  beqz       $at, .L0022FBF0
/* 12FCDC 0022FBDC 00000000 */   nop
/* 12FCE0 0022FBE0 40100400 */  sll        $2, $4, 1
/* 12FCE4 0022FBE4 21104300 */  addu       $2, $2, $3
/* 12FCE8 0022FBE8 52FF5E84 */  lh         $fp, -0xAE($2)
/* 12FCEC 0022FBEC 00000000 */  nop
.L0022FBF0:
/* 12FCF0 0022FBF0 5A000224 */  addiu      $2, $0, 0x5A
/* 12FCF4 0022FBF4 04008214 */  bne        $4, $2, .L0022FC08
/* 12FCF8 0022FBF8 00000000 */   nop
/* 12FCFC 0022FBFC 2110B700 */  addu       $2, $5, $23
/* 12FD00 0022FC00 02005E84 */  lh         $fp, 0x2($2)
/* 12FD04 0022FC04 00000000 */  nop
.L0022FC08:
/* 12FD08 0022FC08 282E0072 */  paddub     $5, $16, $0
/* 12FD0C 0022FC0C 28362072 */  paddub     $6, $17, $0
/* 12FD10 0022FC10 283EA072 */  paddub     $7, $21, $0
/* 12FD14 0022FC14 28468072 */  paddub     $8, $20, $0
/* 12FD18 0022FC18 284EC072 */  paddub     $9, $22, $0
/* 12FD1C 0022FC1C 2856C073 */  paddub     $10, $fp, $0
/* 12FD20 0022FC20 68B5080C */  jal        DrawIconParts__Fiiiiiii
/* 12FD24 0022FC24 00000000 */   nop
/* 12FD28 0022FC28 28001026 */  addiu      $16, $16, 0x28
/* 12FD2C 0022FC2C 05000324 */  addiu      $3, $0, 0x5
/* 12FD30 0022FC30 1A004302 */  div        $0, $18, $3
/* 12FD34 0022FC34 00000000 */  nop
/* 12FD38 0022FC38 00000000 */  nop
/* 12FD3C 0022FC3C 10200000 */  mfhi       $4
/* 12FD40 0022FC40 04000324 */  addiu      $3, $0, 0x4
/* 12FD44 0022FC44 03008314 */  bne        $4, $3, .L0022FC54
/* 12FD48 0022FC48 00000000 */   nop
/* 12FD4C 0022FC4C 02007026 */  addiu      $16, $19, 0x2
/* 12FD50 0022FC50 28003126 */  addiu      $17, $17, 0x28
.L0022FC54:
/* 12FD54 0022FC54 01005226 */  addiu      $18, $18, 0x1
.L0022FC58:
/* 12FD58 0022FC58 EC00A38F */  lw         $3, 0xEC($sp)
/* 12FD5C 0022FC5C 2A184302 */  slt        $3, $18, $3
/* 12FD60 0022FC60 D6FF6014 */  bnez       $3, .L0022FBBC
/* 12FD64 0022FC64 00000000 */   nop
/* 12FD68 0022FC68 C8000010 */  b          .L0022FF8C
/* 12FD6C 0022FC6C 00000000 */   nop
/* 12FD70 0022FC70 28866072 */  paddub     $16, $19, $0
/* 12FD74 0022FC74 A897838F */  lw         $3, -0x6858($gp)
/* 12FD78 0022FC78 2400668C */  lw         $6, 0x24($3)
/* 12FD7C 0022FC7C 0E00D724 */  addiu      $23, $6, 0xE
/* 12FD80 0022FC80 28260070 */  paddub     $4, $0, $0
/* 12FD84 0022FC84 282E0070 */  paddub     $5, $0, $0
/* 12FD88 0022FC88 06000010 */  b          .L0022FCA4
/* 12FD8C 0022FC8C 00000000 */   nop
.L0022FC90:
/* 12FD90 0022FC90 40180500 */  sll        $3, $5, 1
/* 12FD94 0022FC94 21186600 */  addu       $3, $3, $6
/* 12FD98 0022FC98 08006384 */  lh         $3, 0x8($3)
/* 12FD9C 0022FC9C 21208300 */  addu       $4, $4, $3
/* 12FDA0 0022FCA0 0100A524 */  addiu      $5, $5, 0x1
.L0022FCA4:
/* 12FDA4 0022FCA4 0300A328 */  slti       $3, $5, 0x3
/* 12FDA8 0022FCA8 F9FF6014 */  bnez       $3, .L0022FC90
/* 12FDAC 0022FCAC 00000000 */   nop
/* 12FDB0 0022FCB0 28960070 */  paddub     $18, $0, $0
/* 12FDB4 0022FCB4 25000010 */  b          .L0022FD4C
/* 12FDB8 0022FCB8 00000000 */   nop
.L0022FCBC:
/* 12FDBC 0022FCBC 40101200 */  sll        $2, $18, 1
/* 12FDC0 0022FCC0 2110E202 */  addu       $2, $23, $2
/* 12FDC4 0022FCC4 00004484 */  lh         $4, 0x0($2)
/* 12FDC8 0022FCC8 282E0072 */  paddub     $5, $16, $0
/* 12FDCC 0022FCCC 28362072 */  paddub     $6, $17, $0
/* 12FDD0 0022FCD0 283EA072 */  paddub     $7, $21, $0
/* 12FDD4 0022FCD4 28468072 */  paddub     $8, $20, $0
/* 12FDD8 0022FCD8 284EC072 */  paddub     $9, $22, $0
/* 12FDDC 0022FCDC 28560070 */  paddub     $10, $0, $0
/* 12FDE0 0022FCE0 68B5080C */  jal        DrawIconParts__Fiiiiiii
/* 12FDE4 0022FCE4 00000000 */   nop
/* 12FDE8 0022FCE8 DB01033C */  lui        $3, %hi(MenuTrushMark)
/* 12FDEC 0022FCEC 10906324 */  addiu      $3, $3, %lo(MenuTrushMark)
/* 12FDF0 0022FCF0 21187200 */  addu       $3, $3, $18
/* 12FDF4 0022FCF4 00006380 */  lb         $3, 0x0($3)
/* 12FDF8 0022FCF8 08006010 */  beqz       $3, .L0022FD1C
/* 12FDFC 0022FCFC 00000000 */   nop
/* 12FE00 0022FD00 28260072 */  paddub     $4, $16, $0
/* 12FE04 0022FD04 282E2072 */  paddub     $5, $17, $0
/* 12FE08 0022FD08 2836A072 */  paddub     $6, $21, $0
/* 12FE0C 0022FD0C 283E8072 */  paddub     $7, $20, $0
/* 12FE10 0022FD10 2846C072 */  paddub     $8, $22, $0
/* 12FE14 0022FD14 30B5080C */  jal        DrawDontSetItemMark__Fiiiii
/* 12FE18 0022FD18 00000000 */   nop
.L0022FD1C:
/* 12FE1C 0022FD1C 28001026 */  addiu      $16, $16, 0x28
/* 12FE20 0022FD20 05000324 */  addiu      $3, $0, 0x5
/* 12FE24 0022FD24 1A004302 */  div        $0, $18, $3
/* 12FE28 0022FD28 00000000 */  nop
/* 12FE2C 0022FD2C 00000000 */  nop
/* 12FE30 0022FD30 10200000 */  mfhi       $4
/* 12FE34 0022FD34 04000324 */  addiu      $3, $0, 0x4
/* 12FE38 0022FD38 03008314 */  bne        $4, $3, .L0022FD48
/* 12FE3C 0022FD3C 00000000 */   nop
/* 12FE40 0022FD40 28866072 */  paddub     $16, $19, $0
/* 12FE44 0022FD44 28003126 */  addiu      $17, $17, 0x28
.L0022FD48:
/* 12FE48 0022FD48 01005226 */  addiu      $18, $18, 0x1
.L0022FD4C:
/* 12FE4C 0022FD4C EC00A38F */  lw         $3, 0xEC($sp)
/* 12FE50 0022FD50 2A184302 */  slt        $3, $18, $3
/* 12FE54 0022FD54 D9FF6014 */  bnez       $3, .L0022FCBC
/* 12FE58 0022FD58 00000000 */   nop
/* 12FE5C 0022FD5C 8B000010 */  b          .L0022FF8C
/* 12FE60 0022FD60 00000000 */   nop
/* 12FE64 0022FD64 28F60070 */  paddub     $fp, $0, $0
/* 12FE68 0022FD68 A097828F */  lw         $2, -0x6860($gp)
/* 12FE6C 0022FD6C 0C454224 */  addiu      $2, $2, 0x450C
/* 12FE70 0022FD70 D000A2AF */  sw         $2, 0xD0($sp)
/* 12FE74 0022FD74 C701023C */  lui        $2, %hi(TexManager)
/* 12FE78 0022FD78 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 12FE7C 0022FD7C 2A00023C */  lui        $2, %hi(_852_4)
/* 12FE80 0022FD80 A8F14524 */  addiu      $5, $2, %lo(_852_4)
/* 12FE84 0022FD84 FFFF0624 */  addiu      $6, $0, -0x1
/* 12FE88 0022FD88 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 12FE8C 0022FD8C 00000000 */   nop
/* 12FE90 0022FD90 28964070 */  paddub     $18, $2, $0
/* 12FE94 0022FD94 05004012 */  beqz       $18, .L0022FDAC
/* 12FE98 0022FD98 00000000 */   nop
/* 12FE9C 0022FD9C 00004486 */  lh         $4, 0x0($18)
/* 12FEA0 0022FDA0 38B4080C */  jal        MenuTextureReload__Fi
/* 12FEA4 0022FDA4 00000000 */   nop
/* 12FEA8 0022FDA8 B09692AF */  sw         $18, -0x6950($gp)
.L0022FDAC:
/* 12FEAC 0022FDAC A000B08F */  lw         $16, 0xA0($sp)
/* 12FEB0 0022FDB0 A097838F */  lw         $3, -0x6860($gp)
/* 12FEB4 0022FDB4 05006380 */  lb         $3, 0x5($3)
/* 12FEB8 0022FDB8 B000A3AF */  sw         $3, 0xB0($sp)
/* 12FEBC 0022FDBC 289E0070 */  paddub     $19, $0, $0
/* 12FEC0 0022FDC0 4B000010 */  b          .L0022FEF0
/* 12FEC4 0022FDC4 00000000 */   nop
.L0022FDC8:
/* 12FEC8 0022FDC8 0A000424 */  addiu      $4, $0, 0xA
/* 12FECC 0022FDCC 1A006402 */  div        $0, $19, $4
/* 12FED0 0022FDD0 00000000 */  nop
/* 12FED4 0022FDD4 00000000 */  nop
/* 12FED8 0022FDD8 10B80000 */  mfhi       $23
/* 12FEDC 0022FDDC 40111700 */  sll        $2, $23, 5
/* 12FEE0 0022FDE0 23105700 */  subu       $2, $2, $23
/* 12FEE4 0022FDE4 C0180200 */  sll        $3, $2, 3
/* 12FEE8 0022FDE8 D000A28F */  lw         $2, 0xD0($sp)
/* 12FEEC 0022FDEC 21104300 */  addu       $2, $2, $3
/* 12FEF0 0022FDF0 00004284 */  lh         $2, 0x0($2)
/* 12FEF4 0022FDF4 C000A2AF */  sw         $2, 0xC0($sp)
/* 12FEF8 0022FDF8 A097828F */  lw         $2, -0x6860($gp)
/* 12FEFC 0022FDFC 1A006402 */  div        $0, $19, $4
/* 12FF00 0022FE00 02008014 */  bnez       $4, .L0022FE0C
/* 12FF04 0022FE04 00000000 */   nop
/* 12FF08 0022FE08 CD010000 */  break      0, 7
.L0022FE0C:
/* 12FF0C 0022FE0C 12180000 */  mflo       $3
/* 12FF10 0022FE10 21106200 */  addu       $2, $3, $2
/* 12FF14 0022FE14 40434480 */  lb         $4, 0x4340($2)
/* 12FF18 0022FE18 01006324 */  addiu      $3, $3, 0x1
/* 12FF1C 0022FE1C B000A28F */  lw         $2, 0xB0($sp)
/* 12FF20 0022FE20 2A104300 */  slt        $2, $2, $3
/* 12FF24 0022FE24 11004014 */  bnez       $2, .L0022FE6C
/* 12FF28 0022FE28 00000000 */   nop
/* 12FF2C 0022FE2C 0F008004 */  bltz       $4, .L0022FE6C
/* 12FF30 0022FE30 00000000 */   nop
/* 12FF34 0022FE34 0D00E416 */  bne        $23, $4, .L0022FE6C
/* 12FF38 0022FE38 00000000 */   nop
/* 12FF3C 0022FE3C FEFF0426 */  addiu      $4, $16, -0x2
/* 12FF40 0022FE40 FCFF2526 */  addiu      $5, $17, -0x4
/* 12FF44 0022FE44 0100A626 */  addiu      $6, $21, 0x1
/* 12FF48 0022FE48 283E8072 */  paddub     $7, $20, $0
/* 12FF4C 0022FE4C 2846C072 */  paddub     $8, $22, $0
/* 12FF50 0022FE50 74BE080C */  jal        DrawNowEquipWeaponMark__Fiiiii
/* 12FF54 0022FE54 00000000 */   nop
/* 12FF58 0022FE58 04004012 */  beqz       $18, .L0022FE6C
/* 12FF5C 0022FE5C 00000000 */   nop
/* 12FF60 0022FE60 00004486 */  lh         $4, 0x0($18)
/* 12FF64 0022FE64 38B4080C */  jal        MenuTextureReload__Fi
/* 12FF68 0022FE68 00000000 */   nop
.L0022FE6C:
/* 12FF6C 0022FE6C C000A48F */  lw         $4, 0xC0($sp)
/* 12FF70 0022FE70 282E0072 */  paddub     $5, $16, $0
/* 12FF74 0022FE74 28362072 */  paddub     $6, $17, $0
/* 12FF78 0022FE78 283EA072 */  paddub     $7, $21, $0
/* 12FF7C 0022FE7C 28468072 */  paddub     $8, $20, $0
/* 12FF80 0022FE80 284EC072 */  paddub     $9, $22, $0
/* 12FF84 0022FE84 28560070 */  paddub     $10, $0, $0
/* 12FF88 0022FE88 68B5080C */  jal        DrawIconParts__Fiiiiiii
/* 12FF8C 0022FE8C 00000000 */   nop
/* 12FF90 0022FE90 28001026 */  addiu      $16, $16, 0x28
/* 12FF94 0022FE94 05000324 */  addiu      $3, $0, 0x5
/* 12FF98 0022FE98 1A006302 */  div        $0, $19, $3
/* 12FF9C 0022FE9C 00000000 */  nop
/* 12FFA0 0022FEA0 00000000 */  nop
/* 12FFA4 0022FEA4 10200000 */  mfhi       $4
/* 12FFA8 0022FEA8 04000324 */  addiu      $3, $0, 0x4
/* 12FFAC 0022FEAC 0F008314 */  bne        $4, $3, .L0022FEEC
/* 12FFB0 0022FEB0 00000000 */   nop
/* 12FFB4 0022FEB4 A000B08F */  lw         $16, 0xA0($sp)
/* 12FFB8 0022FEB8 28003126 */  addiu      $17, $17, 0x28
/* 12FFBC 0022FEBC 0B006012 */  beqz       $19, .L0022FEEC
/* 12FFC0 0022FEC0 00000000 */   nop
/* 12FFC4 0022FEC4 09000324 */  addiu      $3, $0, 0x9
/* 12FFC8 0022FEC8 0800E316 */  bne        $23, $3, .L0022FEEC
/* 12FFCC 0022FECC 00000000 */   nop
/* 12FFD0 0022FED0 0100DE27 */  addiu      $fp, $fp, 0x1
/* 12FFD4 0022FED4 A097848F */  lw         $4, -0x6860($gp)
/* 12FFD8 0022FED8 A80A0324 */  addiu      $3, $0, 0xAA8
/* 12FFDC 0022FEDC 1818C303 */  mult       $3, $fp, $3
/* 12FFE0 0022FEE0 21188300 */  addu       $3, $4, $3
/* 12FFE4 0022FEE4 0C456324 */  addiu      $3, $3, 0x450C
/* 12FFE8 0022FEE8 D000A3AF */  sw         $3, 0xD0($sp)
.L0022FEEC:
/* 12FFEC 0022FEEC 01007326 */  addiu      $19, $19, 0x1
.L0022FEF0:
/* 12FFF0 0022FEF0 EC00A38F */  lw         $3, 0xEC($sp)
/* 12FFF4 0022FEF4 2A186302 */  slt        $3, $19, $3
/* 12FFF8 0022FEF8 B3FF6014 */  bnez       $3, .L0022FDC8
/* 12FFFC 0022FEFC 00000000 */   nop
/* 130000 0022FF00 22000010 */  b          .L0022FF8C
/* 130004 0022FF04 00000000 */   nop
/* 130008 0022FF08 A000A38F */  lw         $3, 0xA0($sp)
/* 13000C 0022FF0C FEFF7224 */  addiu      $18, $3, -0x2
/* 130010 0022FF10 28864072 */  paddub     $16, $18, $0
/* 130014 0022FF14 289E0070 */  paddub     $19, $0, $0
/* 130018 0022FF18 19000010 */  b          .L0022FF80
/* 13001C 0022FF1C 00000000 */   nop
.L0022FF20:
/* 130020 0022FF20 A897828F */  lw         $2, -0x6858($gp)
/* 130024 0022FF24 40181300 */  sll        $3, $19, 1
/* 130028 0022FF28 2C00428C */  lw         $2, 0x2C($2)
/* 13002C 0022FF2C 21104300 */  addu       $2, $2, $3
/* 130030 0022FF30 00004684 */  lh         $6, 0x0($2)
/* 130034 0022FF34 FCFF8826 */  addiu      $8, $20, -0x4
/* 130038 0022FF38 28260072 */  paddub     $4, $16, $0
/* 13003C 0022FF3C 282E2072 */  paddub     $5, $17, $0
/* 130040 0022FF40 283EA072 */  paddub     $7, $21, $0
/* 130044 0022FF44 284EC072 */  paddub     $9, $22, $0
/* 130048 0022FF48 B060080C */  jal        DrawAtoraParts__Fiiiiii
/* 13004C 0022FF4C 00000000 */   nop
/* 130050 0022FF50 28001026 */  addiu      $16, $16, 0x28
/* 130054 0022FF54 05000324 */  addiu      $3, $0, 0x5
/* 130058 0022FF58 1A006302 */  div        $0, $19, $3
/* 13005C 0022FF5C 00000000 */  nop
/* 130060 0022FF60 00000000 */  nop
/* 130064 0022FF64 10200000 */  mfhi       $4
/* 130068 0022FF68 04000324 */  addiu      $3, $0, 0x4
/* 13006C 0022FF6C 03008314 */  bne        $4, $3, .L0022FF7C
/* 130070 0022FF70 00000000 */   nop
/* 130074 0022FF74 28864072 */  paddub     $16, $18, $0
/* 130078 0022FF78 28003126 */  addiu      $17, $17, 0x28
.L0022FF7C:
/* 13007C 0022FF7C 01007326 */  addiu      $19, $19, 0x1
.L0022FF80:
/* 130080 0022FF80 7800632A */  slti       $3, $19, 0x78
/* 130084 0022FF84 E6FF6014 */  bnez       $3, .L0022FF20
/* 130088 0022FF88 00000000 */   nop
.L0022FF8C:
/* 13008C 0022FF8C 9000BF7B */  lq         $31, 0x90($sp)
/* 130090 0022FF90 8000BE7B */  lq         $fp, 0x80($sp)
/* 130094 0022FF94 7000B77B */  lq         $23, 0x70($sp)
/* 130098 0022FF98 6000B67B */  lq         $22, 0x60($sp)
/* 13009C 0022FF9C 5000B57B */  lq         $21, 0x50($sp)
/* 1300A0 0022FFA0 4000B47B */  lq         $20, 0x40($sp)
/* 1300A4 0022FFA4 3000B37B */  lq         $19, 0x30($sp)
/* 1300A8 0022FFA8 2000B27B */  lq         $18, 0x20($sp)
/* 1300AC 0022FFAC 1000B17B */  lq         $17, 0x10($sp)
/* 1300B0 0022FFB0 0000B07B */  lq         $16, 0x0($sp)
/* 1300B4 0022FFB4 F000BD27 */  addiu      $sp, $sp, 0xF0
/* 1300B8 0022FFB8 0800E003 */  jr         $31
/* 1300BC 0022FFBC 00000000 */   nop
