.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGFillBox__FRC8CRect_i_UcUcUcUc
/* 2FB70 0012FA70 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 2FB74 0012FA74 5000BF7F */  sq         $31, 0x50($sp)
/* 2FB78 0012FA78 4000B47F */  sq         $20, 0x40($sp)
/* 2FB7C 0012FA7C 3000B37F */  sq         $19, 0x30($sp)
/* 2FB80 0012FA80 2000B27F */  sq         $18, 0x20($sp)
/* 2FB84 0012FA84 1000B17F */  sq         $17, 0x10($sp)
/* 2FB88 0012FA88 0000B07F */  sq         $16, 0x0($sp)
/* 2FB8C 0012FA8C 28A68070 */  paddub     $20, $4, $0
/* 2FB90 0012FA90 289EA070 */  paddub     $19, $5, $0
/* 2FB94 0012FA94 2896C070 */  paddub     $18, $6, $0
/* 2FB98 0012FA98 288EE070 */  paddub     $17, $7, $0
/* 2FB9C 0012FA9C 28860071 */  paddub     $16, $8, $0
/* 2FBA0 0012FAA0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 2FBA4 0012FAA4 7C00A2AF */  sw         $2, 0x7C($sp)
/* 2FBA8 0012FAA8 D48B848F */  lw         $4, -0x742C($gp)
/* 2FBAC 0012FAAC 282E0070 */  paddub     $5, $0, $0
/* 2FBB0 0012FAB0 2083040C */  jal        sceVif1PkCnt
/* 2FBB4 0012FAB4 00000000 */   nop
/* 2FBB8 0012FAB8 D48B848F */  lw         $4, -0x742C($gp)
/* 2FBBC 0012FABC 282E0070 */  paddub     $5, $0, $0
/* 2FBC0 0012FAC0 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 2FBC4 0012FAC4 00000000 */   nop
/* 2FBC8 0012FAC8 C701023C */  lui        $2, %hi(GiftagAD)
/* 2FBCC 0012FACC C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 2FBD0 0012FAD0 D48B848F */  lw         $4, -0x742C($gp)
/* 2FBD4 0012FAD4 00004578 */  lq         $5, 0x0($2)
/* 2FBD8 0012FAD8 B083040C */  jal        sceVif1PkOpenGifTag
/* 2FBDC 0012FADC 00000000 */   nop
/* 2FBE0 0012FAE0 D48B848F */  lw         $4, -0x742C($gp)
/* 2FBE4 0012FAE4 3F000524 */  addiu      $5, $0, 0x3F
/* 2FBE8 0012FAE8 28360070 */  paddub     $6, $0, $0
/* 2FBEC 0012FAEC 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FBF0 0012FAF0 00000000 */   nop
/* 2FBF4 0012FAF4 D48B848F */  lw         $4, -0x742C($gp)
/* 2FBF8 0012FAF8 14000524 */  addiu      $5, $0, 0x14
/* 2FBFC 0012FAFC 01000624 */  addiu      $6, $0, 0x1
/* 2FC00 0012FB00 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FC04 0012FB04 00000000 */   nop
/* 2FC08 0012FB08 D48B848F */  lw         $4, -0x742C($gp)
/* 2FC0C 0012FB0C 282E0070 */  paddub     $5, $0, $0
/* 2FC10 0012FB10 46010624 */  addiu      $6, $0, 0x146
/* 2FC14 0012FB14 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FC18 0012FB18 00000000 */   nop
/* 2FC1C 0012FB1C 6800A227 */  addiu      $2, $sp, 0x68
/* 2FC20 0012FB20 E88B83DF */  ld         $3, -0x7418($gp)
/* 2FC24 0012FB24 000043FC */  sd         $3, 0x0($2)
/* 2FC28 0012FB28 6800A393 */  lbu        $3, 0x68($sp)
/* 2FC2C 0012FB2C 01000764 */  daddiu     $7, $0, 0x1
/* 2FC30 0012FB30 FEFF0624 */  addiu      $6, $0, -0x2
/* 2FC34 0012FB34 24186600 */  and        $3, $3, $6
/* 2FC38 0012FB38 25186700 */  or         $3, $3, $7
/* 2FC3C 0012FB3C 6800A3A3 */  sb         $3, 0x68($sp)
/* 2FC40 0012FB40 6800A597 */  lhu        $5, 0x68($sp)
/* 2FC44 0012FB44 FF000330 */  andi       $3, $0, 0xFF
/* 2FC48 0012FB48 00210300 */  sll        $4, $3, 4
/* 2FC4C 0012FB4C 0FF00324 */  addiu      $3, $0, -0xFF1
/* 2FC50 0012FB50 2418A300 */  and        $3, $5, $3
/* 2FC54 0012FB54 25186400 */  or         $3, $3, $4
/* 2FC58 0012FB58 6800A3A7 */  sh         $3, 0x68($sp)
/* 2FC5C 0012FB5C 6800A493 */  lbu        $4, 0x68($sp)
/* 2FC60 0012FB60 02000564 */  daddiu     $5, $0, 0x2
/* 2FC64 0012FB64 F1FF0324 */  addiu      $3, $0, -0xF
/* 2FC68 0012FB68 24188300 */  and        $3, $4, $3
/* 2FC6C 0012FB6C 25186500 */  or         $3, $3, $5
/* 2FC70 0012FB70 6800A3A3 */  sb         $3, 0x68($sp)
/* 2FC74 0012FB74 6A00A827 */  addiu      $8, $sp, 0x6A
/* 2FC78 0012FB78 00000391 */  lbu        $3, 0x0($8)
/* 2FC7C 0012FB7C 24186600 */  and        $3, $3, $6
/* 2FC80 0012FB80 25186700 */  or         $3, $3, $7
/* 2FC84 0012FB84 000003A1 */  sb         $3, 0x0($8)
/* 2FC88 0012FB88 00000491 */  lbu        $4, 0x0($8)
/* 2FC8C 0012FB8C F9FF0324 */  addiu      $3, $0, -0x7
/* 2FC90 0012FB90 24188300 */  and        $3, $4, $3
/* 2FC94 0012FB94 25186500 */  or         $3, $3, $5
/* 2FC98 0012FB98 000003A1 */  sb         $3, 0x0($8)
/* 2FC9C 0012FB9C D48B848F */  lw         $4, -0x742C($gp)
/* 2FCA0 0012FBA0 47000524 */  addiu      $5, $0, 0x47
/* 2FCA4 0012FBA4 000046DC */  ld         $6, 0x0($2)
/* 2FCA8 0012FBA8 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FCAC 0012FBAC 00000000 */   nop
/* 2FCB0 0012FBB0 7000A627 */  addiu      $6, $sp, 0x70
/* 2FCB4 0012FBB4 F08B82DF */  ld         $2, -0x7410($gp)
/* 2FCB8 0012FBB8 0000C2FC */  sd         $2, 0x0($6)
/* 2FCBC 0012FBBC 7400A493 */  lbu        $4, 0x74($sp)
/* 2FCC0 0012FBC0 01000364 */  daddiu     $3, $0, 0x1
/* 2FCC4 0012FBC4 FEFF0224 */  addiu      $2, $0, -0x2
/* 2FCC8 0012FBC8 24108200 */  and        $2, $4, $2
/* 2FCCC 0012FBCC 25104300 */  or         $2, $2, $3
/* 2FCD0 0012FBD0 7400A2A3 */  sb         $2, 0x74($sp)
/* 2FCD4 0012FBD4 D48B848F */  lw         $4, -0x742C($gp)
/* 2FCD8 0012FBD8 4E000524 */  addiu      $5, $0, 0x4E
/* 2FCDC 0012FBDC 0000C6DC */  ld         $6, 0x0($6)
/* 2FCE0 0012FBE0 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FCE4 0012FBE4 00000000 */   nop
/* 2FCE8 0012FBE8 FF006332 */  andi       $3, $19, 0xFF
/* 2FCEC 0012FBEC FF004232 */  andi       $2, $18, 0xFF
/* 2FCF0 0012FBF0 38120200 */  dsll       $2, $2, 8
/* 2FCF4 0012FBF4 25186200 */  or         $3, $3, $2
/* 2FCF8 0012FBF8 FF002232 */  andi       $2, $17, 0xFF
/* 2FCFC 0012FBFC 38140200 */  dsll       $2, $2, 16
/* 2FD00 0012FC00 25184300 */  or         $3, $2, $3
/* 2FD04 0012FC04 FF000232 */  andi       $2, $16, 0xFF
/* 2FD08 0012FC08 38160200 */  dsll       $2, $2, 24
/* 2FD0C 0012FC0C 25184300 */  or         $3, $2, $3
/* 2FD10 0012FC10 7C00A227 */  addiu      $2, $sp, 0x7C
/* 2FD14 0012FC14 0000429C */  lwu        $2, 0x0($2)
/* 2FD18 0012FC18 3C100200 */  dsll32     $2, $2, 0
/* 2FD1C 0012FC1C 25304300 */  or         $6, $2, $3
/* 2FD20 0012FC20 D48B848F */  lw         $4, -0x742C($gp)
/* 2FD24 0012FC24 01000524 */  addiu      $5, $0, 0x1
/* 2FD28 0012FC28 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FD2C 0012FC2C 00000000 */   nop
/* 2FD30 0012FC30 0400828E */  lw         $2, 0x4($20)
/* 2FD34 0012FC34 00794224 */  addiu      $2, $2, 0x7900
/* 2FD38 0012FC38 3C100200 */  dsll32     $2, $2, 0
/* 2FD3C 0012FC3C 3F100200 */  dsra32     $2, $2, 0
/* 2FD40 0012FC40 381C0200 */  dsll       $3, $2, 16
/* 2FD44 0012FC44 0000828E */  lw         $2, 0x0($20)
/* 2FD48 0012FC48 006C4224 */  addiu      $2, $2, 0x6C00
/* 2FD4C 0012FC4C 3C100200 */  dsll32     $2, $2, 0
/* 2FD50 0012FC50 3F100200 */  dsra32     $2, $2, 0
/* 2FD54 0012FC54 25304300 */  or         $6, $2, $3
/* 2FD58 0012FC58 D48B848F */  lw         $4, -0x742C($gp)
/* 2FD5C 0012FC5C 04000524 */  addiu      $5, $0, 0x4
/* 2FD60 0012FC60 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FD64 0012FC64 00000000 */   nop
/* 2FD68 0012FC68 0400828E */  lw         $2, 0x4($20)
/* 2FD6C 0012FC6C 00794324 */  addiu      $3, $2, 0x7900
/* 2FD70 0012FC70 0C00828E */  lw         $2, 0xC($20)
/* 2FD74 0012FC74 21106200 */  addu       $2, $3, $2
/* 2FD78 0012FC78 3C100200 */  dsll32     $2, $2, 0
/* 2FD7C 0012FC7C 3F100200 */  dsra32     $2, $2, 0
/* 2FD80 0012FC80 38240200 */  dsll       $4, $2, 16
/* 2FD84 0012FC84 0000828E */  lw         $2, 0x0($20)
/* 2FD88 0012FC88 006C4324 */  addiu      $3, $2, 0x6C00
/* 2FD8C 0012FC8C 0800828E */  lw         $2, 0x8($20)
/* 2FD90 0012FC90 21106200 */  addu       $2, $3, $2
/* 2FD94 0012FC94 3C100200 */  dsll32     $2, $2, 0
/* 2FD98 0012FC98 3F100200 */  dsra32     $2, $2, 0
/* 2FD9C 0012FC9C 25304400 */  or         $6, $2, $4
/* 2FDA0 0012FCA0 D48B848F */  lw         $4, -0x742C($gp)
/* 2FDA4 0012FCA4 04000524 */  addiu      $5, $0, 0x4
/* 2FDA8 0012FCA8 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FDAC 0012FCAC 00000000 */   nop
/* 2FDB0 0012FCB0 D48B848F */  lw         $4, -0x742C($gp)
/* 2FDB4 0012FCB4 3F000524 */  addiu      $5, $0, 0x3F
/* 2FDB8 0012FCB8 28360070 */  paddub     $6, $0, $0
/* 2FDBC 0012FCBC 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FDC0 0012FCC0 00000000 */   nop
/* 2FDC4 0012FCC4 E88B8227 */  addiu      $2, $gp, -0x7418
/* 2FDC8 0012FCC8 D48B848F */  lw         $4, -0x742C($gp)
/* 2FDCC 0012FCCC 47000524 */  addiu      $5, $0, 0x47
/* 2FDD0 0012FCD0 000046DC */  ld         $6, 0x0($2)
/* 2FDD4 0012FCD4 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FDD8 0012FCD8 00000000 */   nop
/* 2FDDC 0012FCDC F08B8227 */  addiu      $2, $gp, -0x7410
/* 2FDE0 0012FCE0 D48B848F */  lw         $4, -0x742C($gp)
/* 2FDE4 0012FCE4 4E000524 */  addiu      $5, $0, 0x4E
/* 2FDE8 0012FCE8 000046DC */  ld         $6, 0x0($2)
/* 2FDEC 0012FCEC 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FDF0 0012FCF0 00000000 */   nop
/* 2FDF4 0012FCF4 D48B848F */  lw         $4, -0x742C($gp)
/* 2FDF8 0012FCF8 B683040C */  jal        sceVif1PkCloseGifTag
/* 2FDFC 0012FCFC 00000000 */   nop
/* 2FE00 0012FD00 D48B848F */  lw         $4, -0x742C($gp)
/* 2FE04 0012FD04 A483040C */  jal        sceVif1PkCloseDirectCode
/* 2FE08 0012FD08 00000000 */   nop
/* 2FE0C 0012FD0C 5000BF7B */  lq         $31, 0x50($sp)
/* 2FE10 0012FD10 4000B47B */  lq         $20, 0x40($sp)
/* 2FE14 0012FD14 3000B37B */  lq         $19, 0x30($sp)
/* 2FE18 0012FD18 2000B27B */  lq         $18, 0x20($sp)
/* 2FE1C 0012FD1C 1000B17B */  lq         $17, 0x10($sp)
/* 2FE20 0012FD20 0000B07B */  lq         $16, 0x0($sp)
/* 2FE24 0012FD24 8000BD27 */  addiu      $sp, $sp, 0x80
/* 2FE28 0012FD28 0800E003 */  jr         $31
/* 2FE2C 0012FD2C 00000000 */   nop
