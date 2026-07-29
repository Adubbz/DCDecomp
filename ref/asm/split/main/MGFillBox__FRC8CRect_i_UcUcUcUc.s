.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGFillBox__FRC8CRect_i_UcUcUcUc
/* 02FB70 0012FA70 80FFBD27 */  addiu       $29, $29, -0x80
/* 02FB74 0012FA74 5000BF7F */  sq          $31, 0x50($29)
/* 02FB78 0012FA78 4000B47F */  sq          $20, 0x40($29)
/* 02FB7C 0012FA7C 3000B37F */  sq          $19, 0x30($29)
/* 02FB80 0012FA80 2000B27F */  sq          $18, 0x20($29)
/* 02FB84 0012FA84 1000B17F */  sq          $17, 0x10($29)
/* 02FB88 0012FA88 0000B07F */  sq          $16, 0x0($29)
/* 02FB8C 0012FA8C 28A68070 */  paddub      $20, $4, $0
/* 02FB90 0012FA90 289EA070 */  paddub      $19, $5, $0
/* 02FB94 0012FA94 2896C070 */  paddub      $18, $6, $0
/* 02FB98 0012FA98 288EE070 */  paddub      $17, $7, $0
/* 02FB9C 0012FA9C 28860071 */  paddub      $16, $8, $0
/* 02FBA0 0012FAA0 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02FBA4 0012FAA4 7C00A2AF */  sw          $2, 0x7C($29)
/* 02FBA8 0012FAA8 D48B848F */  lw          $4, -0x742C($28)
/* 02FBAC 0012FAAC 282E0070 */  paddub      $5, $0, $0
/* 02FBB0 0012FAB0 2083040C */  jal         sceVif1PkCnt
/* 02FBB4 0012FAB4 00000000 */   nop
/* 02FBB8 0012FAB8 D48B848F */  lw          $4, -0x742C($28)
/* 02FBBC 0012FABC 282E0070 */  paddub      $5, $0, $0
/* 02FBC0 0012FAC0 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 02FBC4 0012FAC4 00000000 */   nop
/* 02FBC8 0012FAC8 C701023C */  lui         $2, %hi(GiftagAD)
/* 02FBCC 0012FACC C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 02FBD0 0012FAD0 D48B848F */  lw          $4, -0x742C($28)
/* 02FBD4 0012FAD4 00004578 */  lq          $5, 0x0($2)
/* 02FBD8 0012FAD8 B083040C */  jal         sceVif1PkOpenGifTag
/* 02FBDC 0012FADC 00000000 */   nop
/* 02FBE0 0012FAE0 D48B848F */  lw          $4, -0x742C($28)
/* 02FBE4 0012FAE4 3F000524 */  addiu       $5, $0, 0x3F
/* 02FBE8 0012FAE8 28360070 */  paddub      $6, $0, $0
/* 02FBEC 0012FAEC 0A84040C */  jal         sceVif1PkAddGsAD
/* 02FBF0 0012FAF0 00000000 */   nop
/* 02FBF4 0012FAF4 D48B848F */  lw          $4, -0x742C($28)
/* 02FBF8 0012FAF8 14000524 */  addiu       $5, $0, 0x14
/* 02FBFC 0012FAFC 01000624 */  addiu       $6, $0, 0x1
/* 02FC00 0012FB00 0A84040C */  jal         sceVif1PkAddGsAD
/* 02FC04 0012FB04 00000000 */   nop
/* 02FC08 0012FB08 D48B848F */  lw          $4, -0x742C($28)
/* 02FC0C 0012FB0C 282E0070 */  paddub      $5, $0, $0
/* 02FC10 0012FB10 46010624 */  addiu       $6, $0, 0x146
/* 02FC14 0012FB14 0A84040C */  jal         sceVif1PkAddGsAD
/* 02FC18 0012FB18 00000000 */   nop
/* 02FC1C 0012FB1C 6800A227 */  addiu       $2, $29, 0x68
/* 02FC20 0012FB20 E88B83DF */  ld          $3, -0x7418($28)
/* 02FC24 0012FB24 000043FC */  sd          $3, 0x0($2)
/* 02FC28 0012FB28 6800A393 */  lbu         $3, 0x68($29)
/* 02FC2C 0012FB2C 01000764 */  daddiu      $7, $0, 0x1
/* 02FC30 0012FB30 FEFF0624 */  addiu       $6, $0, -0x2
/* 02FC34 0012FB34 24186600 */  and         $3, $3, $6
/* 02FC38 0012FB38 25186700 */  or          $3, $3, $7
/* 02FC3C 0012FB3C 6800A3A3 */  sb          $3, 0x68($29)
/* 02FC40 0012FB40 6800A597 */  lhu         $5, 0x68($29)
/* 02FC44 0012FB44 FF000330 */  andi        $3, $0, 0xFF
/* 02FC48 0012FB48 00210300 */  sll         $4, $3, 4
/* 02FC4C 0012FB4C 0FF00324 */  addiu       $3, $0, -0xFF1
/* 02FC50 0012FB50 2418A300 */  and         $3, $5, $3
/* 02FC54 0012FB54 25186400 */  or          $3, $3, $4
/* 02FC58 0012FB58 6800A3A7 */  sh          $3, 0x68($29)
/* 02FC5C 0012FB5C 6800A493 */  lbu         $4, 0x68($29)
/* 02FC60 0012FB60 02000564 */  daddiu      $5, $0, 0x2
/* 02FC64 0012FB64 F1FF0324 */  addiu       $3, $0, -0xF
/* 02FC68 0012FB68 24188300 */  and         $3, $4, $3
/* 02FC6C 0012FB6C 25186500 */  or          $3, $3, $5
/* 02FC70 0012FB70 6800A3A3 */  sb          $3, 0x68($29)
/* 02FC74 0012FB74 6A00A827 */  addiu       $8, $29, 0x6A
/* 02FC78 0012FB78 00000391 */  lbu         $3, 0x0($8)
/* 02FC7C 0012FB7C 24186600 */  and         $3, $3, $6
/* 02FC80 0012FB80 25186700 */  or          $3, $3, $7
/* 02FC84 0012FB84 000003A1 */  sb          $3, 0x0($8)
/* 02FC88 0012FB88 00000491 */  lbu         $4, 0x0($8)
/* 02FC8C 0012FB8C F9FF0324 */  addiu       $3, $0, -0x7
/* 02FC90 0012FB90 24188300 */  and         $3, $4, $3
/* 02FC94 0012FB94 25186500 */  or          $3, $3, $5
/* 02FC98 0012FB98 000003A1 */  sb          $3, 0x0($8)
/* 02FC9C 0012FB9C D48B848F */  lw          $4, -0x742C($28)
/* 02FCA0 0012FBA0 47000524 */  addiu       $5, $0, 0x47
/* 02FCA4 0012FBA4 000046DC */  ld          $6, 0x0($2)
/* 02FCA8 0012FBA8 0A84040C */  jal         sceVif1PkAddGsAD
/* 02FCAC 0012FBAC 00000000 */   nop
/* 02FCB0 0012FBB0 7000A627 */  addiu       $6, $29, 0x70
/* 02FCB4 0012FBB4 F08B82DF */  ld          $2, -0x7410($28)
/* 02FCB8 0012FBB8 0000C2FC */  sd          $2, 0x0($6)
/* 02FCBC 0012FBBC 7400A493 */  lbu         $4, 0x74($29)
/* 02FCC0 0012FBC0 01000364 */  daddiu      $3, $0, 0x1
/* 02FCC4 0012FBC4 FEFF0224 */  addiu       $2, $0, -0x2
/* 02FCC8 0012FBC8 24108200 */  and         $2, $4, $2
/* 02FCCC 0012FBCC 25104300 */  or          $2, $2, $3
/* 02FCD0 0012FBD0 7400A2A3 */  sb          $2, 0x74($29)
/* 02FCD4 0012FBD4 D48B848F */  lw          $4, -0x742C($28)
/* 02FCD8 0012FBD8 4E000524 */  addiu       $5, $0, 0x4E
/* 02FCDC 0012FBDC 0000C6DC */  ld          $6, 0x0($6)
/* 02FCE0 0012FBE0 0A84040C */  jal         sceVif1PkAddGsAD
/* 02FCE4 0012FBE4 00000000 */   nop
/* 02FCE8 0012FBE8 FF006332 */  andi        $3, $19, 0xFF
/* 02FCEC 0012FBEC FF004232 */  andi        $2, $18, 0xFF
/* 02FCF0 0012FBF0 38120200 */  dsll        $2, $2, 8
/* 02FCF4 0012FBF4 25186200 */  or          $3, $3, $2
/* 02FCF8 0012FBF8 FF002232 */  andi        $2, $17, 0xFF
/* 02FCFC 0012FBFC 38140200 */  dsll        $2, $2, 16
/* 02FD00 0012FC00 25184300 */  or          $3, $2, $3
/* 02FD04 0012FC04 FF000232 */  andi        $2, $16, 0xFF
/* 02FD08 0012FC08 38160200 */  dsll        $2, $2, 24
/* 02FD0C 0012FC0C 25184300 */  or          $3, $2, $3
/* 02FD10 0012FC10 7C00A227 */  addiu       $2, $29, 0x7C
/* 02FD14 0012FC14 0000429C */  lwu         $2, 0x0($2)
/* 02FD18 0012FC18 3C100200 */  dsll32      $2, $2, 0
/* 02FD1C 0012FC1C 25304300 */  or          $6, $2, $3
/* 02FD20 0012FC20 D48B848F */  lw          $4, -0x742C($28)
/* 02FD24 0012FC24 01000524 */  addiu       $5, $0, 0x1
/* 02FD28 0012FC28 0A84040C */  jal         sceVif1PkAddGsAD
/* 02FD2C 0012FC2C 00000000 */   nop
/* 02FD30 0012FC30 0400828E */  lw          $2, 0x4($20)
/* 02FD34 0012FC34 00794224 */  addiu       $2, $2, 0x7900
/* 02FD38 0012FC38 3C100200 */  dsll32      $2, $2, 0
/* 02FD3C 0012FC3C 3F100200 */  dsra32      $2, $2, 0
/* 02FD40 0012FC40 381C0200 */  dsll        $3, $2, 16
/* 02FD44 0012FC44 0000828E */  lw          $2, 0x0($20)
/* 02FD48 0012FC48 006C4224 */  addiu       $2, $2, 0x6C00
/* 02FD4C 0012FC4C 3C100200 */  dsll32      $2, $2, 0
/* 02FD50 0012FC50 3F100200 */  dsra32      $2, $2, 0
/* 02FD54 0012FC54 25304300 */  or          $6, $2, $3
/* 02FD58 0012FC58 D48B848F */  lw          $4, -0x742C($28)
/* 02FD5C 0012FC5C 04000524 */  addiu       $5, $0, 0x4
/* 02FD60 0012FC60 0A84040C */  jal         sceVif1PkAddGsAD
/* 02FD64 0012FC64 00000000 */   nop
/* 02FD68 0012FC68 0400828E */  lw          $2, 0x4($20)
/* 02FD6C 0012FC6C 00794324 */  addiu       $3, $2, 0x7900
/* 02FD70 0012FC70 0C00828E */  lw          $2, 0xC($20)
/* 02FD74 0012FC74 21106200 */  addu        $2, $3, $2
/* 02FD78 0012FC78 3C100200 */  dsll32      $2, $2, 0
/* 02FD7C 0012FC7C 3F100200 */  dsra32      $2, $2, 0
/* 02FD80 0012FC80 38240200 */  dsll        $4, $2, 16
/* 02FD84 0012FC84 0000828E */  lw          $2, 0x0($20)
/* 02FD88 0012FC88 006C4324 */  addiu       $3, $2, 0x6C00
/* 02FD8C 0012FC8C 0800828E */  lw          $2, 0x8($20)
/* 02FD90 0012FC90 21106200 */  addu        $2, $3, $2
/* 02FD94 0012FC94 3C100200 */  dsll32      $2, $2, 0
/* 02FD98 0012FC98 3F100200 */  dsra32      $2, $2, 0
/* 02FD9C 0012FC9C 25304400 */  or          $6, $2, $4
/* 02FDA0 0012FCA0 D48B848F */  lw          $4, -0x742C($28)
/* 02FDA4 0012FCA4 04000524 */  addiu       $5, $0, 0x4
/* 02FDA8 0012FCA8 0A84040C */  jal         sceVif1PkAddGsAD
/* 02FDAC 0012FCAC 00000000 */   nop
/* 02FDB0 0012FCB0 D48B848F */  lw          $4, -0x742C($28)
/* 02FDB4 0012FCB4 3F000524 */  addiu       $5, $0, 0x3F
/* 02FDB8 0012FCB8 28360070 */  paddub      $6, $0, $0
/* 02FDBC 0012FCBC 0A84040C */  jal         sceVif1PkAddGsAD
/* 02FDC0 0012FCC0 00000000 */   nop
/* 02FDC4 0012FCC4 E88B8227 */  addiu       $2, $28, -0x7418
/* 02FDC8 0012FCC8 D48B848F */  lw          $4, -0x742C($28)
/* 02FDCC 0012FCCC 47000524 */  addiu       $5, $0, 0x47
/* 02FDD0 0012FCD0 000046DC */  ld          $6, 0x0($2)
/* 02FDD4 0012FCD4 0A84040C */  jal         sceVif1PkAddGsAD
/* 02FDD8 0012FCD8 00000000 */   nop
/* 02FDDC 0012FCDC F08B8227 */  addiu       $2, $28, -0x7410
/* 02FDE0 0012FCE0 D48B848F */  lw          $4, -0x742C($28)
/* 02FDE4 0012FCE4 4E000524 */  addiu       $5, $0, 0x4E
/* 02FDE8 0012FCE8 000046DC */  ld          $6, 0x0($2)
/* 02FDEC 0012FCEC 0A84040C */  jal         sceVif1PkAddGsAD
/* 02FDF0 0012FCF0 00000000 */   nop
/* 02FDF4 0012FCF4 D48B848F */  lw          $4, -0x742C($28)
/* 02FDF8 0012FCF8 B683040C */  jal         sceVif1PkCloseGifTag
/* 02FDFC 0012FCFC 00000000 */   nop
/* 02FE00 0012FD00 D48B848F */  lw          $4, -0x742C($28)
/* 02FE04 0012FD04 A483040C */  jal         sceVif1PkCloseDirectCode
/* 02FE08 0012FD08 00000000 */   nop
/* 02FE0C 0012FD0C 5000BF7B */  lq          $31, 0x50($29)
/* 02FE10 0012FD10 4000B47B */  lq          $20, 0x40($29)
/* 02FE14 0012FD14 3000B37B */  lq          $19, 0x30($29)
/* 02FE18 0012FD18 2000B27B */  lq          $18, 0x20($29)
/* 02FE1C 0012FD1C 1000B17B */  lq          $17, 0x10($29)
/* 02FE20 0012FD20 0000B07B */  lq          $16, 0x0($29)
/* 02FE24 0012FD24 8000BD27 */  addiu       $29, $29, 0x80
/* 02FE28 0012FD28 0800E003 */  jr          $31
/* 02FE2C 0012FD2C 00000000 */   nop
