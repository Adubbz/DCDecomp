.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGClearZBuffer__Fi
/* 2FE30 0012FD30 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 2FE34 0012FD34 1000BF7F */  sq         $31, 0x10($sp)
/* 2FE38 0012FD38 0000B07F */  sq         $16, 0x0($sp)
/* 2FE3C 0012FD3C 28868070 */  paddub     $16, $4, $0
/* 2FE40 0012FD40 D48B848F */  lw         $4, -0x742C($gp)
/* 2FE44 0012FD44 282E0070 */  paddub     $5, $0, $0
/* 2FE48 0012FD48 2083040C */  jal        sceVif1PkCnt
/* 2FE4C 0012FD4C 00000000 */   nop
/* 2FE50 0012FD50 D48B848F */  lw         $4, -0x742C($gp)
/* 2FE54 0012FD54 282E0070 */  paddub     $5, $0, $0
/* 2FE58 0012FD58 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 2FE5C 0012FD5C 00000000 */   nop
/* 2FE60 0012FD60 C701023C */  lui        $2, %hi(GiftagAD)
/* 2FE64 0012FD64 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 2FE68 0012FD68 D48B848F */  lw         $4, -0x742C($gp)
/* 2FE6C 0012FD6C 00004578 */  lq         $5, 0x0($2)
/* 2FE70 0012FD70 B083040C */  jal        sceVif1PkOpenGifTag
/* 2FE74 0012FD74 00000000 */   nop
/* 2FE78 0012FD78 D48B848F */  lw         $4, -0x742C($gp)
/* 2FE7C 0012FD7C 14000524 */  addiu      $5, $0, 0x14
/* 2FE80 0012FD80 01000624 */  addiu      $6, $0, 0x1
/* 2FE84 0012FD84 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FE88 0012FD88 00000000 */   nop
/* 2FE8C 0012FD8C D48B848F */  lw         $4, -0x742C($gp)
/* 2FE90 0012FD90 282E0070 */  paddub     $5, $0, $0
/* 2FE94 0012FD94 44010624 */  addiu      $6, $0, 0x144
/* 2FE98 0012FD98 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FE9C 0012FD9C 00000000 */   nop
/* 2FEA0 0012FDA0 2800A227 */  addiu      $2, $sp, 0x28
/* 2FEA4 0012FDA4 E88B83DF */  ld         $3, -0x7418($gp)
/* 2FEA8 0012FDA8 000043FC */  sd         $3, 0x0($2)
/* 2FEAC 0012FDAC 2800A393 */  lbu        $3, 0x28($sp)
/* 2FEB0 0012FDB0 01000630 */  andi       $6, $0, 0x1
/* 2FEB4 0012FDB4 FEFF0524 */  addiu      $5, $0, -0x2
/* 2FEB8 0012FDB8 24186500 */  and        $3, $3, $5
/* 2FEBC 0012FDBC 25186600 */  or         $3, $3, $6
/* 2FEC0 0012FDC0 2800A3A3 */  sb         $3, 0x28($sp)
/* 2FEC4 0012FDC4 2A00A727 */  addiu      $7, $sp, 0x2A
/* 2FEC8 0012FDC8 0000E390 */  lbu        $3, 0x0($7)
/* 2FECC 0012FDCC 01000464 */  daddiu     $4, $0, 0x1
/* 2FED0 0012FDD0 24186500 */  and        $3, $3, $5
/* 2FED4 0012FDD4 25186400 */  or         $3, $3, $4
/* 2FED8 0012FDD8 0000E3A0 */  sb         $3, 0x0($7)
/* 2FEDC 0012FDDC 0000E590 */  lbu        $5, 0x0($7)
/* 2FEE0 0012FDE0 02000464 */  daddiu     $4, $0, 0x2
/* 2FEE4 0012FDE4 F9FF0324 */  addiu      $3, $0, -0x7
/* 2FEE8 0012FDE8 2418A300 */  and        $3, $5, $3
/* 2FEEC 0012FDEC 25186400 */  or         $3, $3, $4
/* 2FEF0 0012FDF0 0000E3A0 */  sb         $3, 0x0($7)
/* 2FEF4 0012FDF4 2900A593 */  lbu        $5, 0x29($sp)
/* 2FEF8 0012FDF8 80210600 */  sll        $4, $6, 6
/* 2FEFC 0012FDFC BFFF0324 */  addiu      $3, $0, -0x41
/* 2FF00 0012FE00 2418A300 */  and        $3, $5, $3
/* 2FF04 0012FE04 25186400 */  or         $3, $3, $4
/* 2FF08 0012FE08 2900A3A3 */  sb         $3, 0x29($sp)
/* 2FF0C 0012FE0C D48B848F */  lw         $4, -0x742C($gp)
/* 2FF10 0012FE10 47000524 */  addiu      $5, $0, 0x47
/* 2FF14 0012FE14 000046DC */  ld         $6, 0x0($2)
/* 2FF18 0012FE18 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FF1C 0012FE1C 00000000 */   nop
/* 2FF20 0012FE20 3000A627 */  addiu      $6, $sp, 0x30
/* 2FF24 0012FE24 F08B82DF */  ld         $2, -0x7410($gp)
/* 2FF28 0012FE28 0000C2FC */  sd         $2, 0x0($6)
/* 2FF2C 0012FE2C 3400A493 */  lbu        $4, 0x34($sp)
/* 2FF30 0012FE30 01000330 */  andi       $3, $0, 0x1
/* 2FF34 0012FE34 FEFF0224 */  addiu      $2, $0, -0x2
/* 2FF38 0012FE38 24108200 */  and        $2, $4, $2
/* 2FF3C 0012FE3C 25104300 */  or         $2, $2, $3
/* 2FF40 0012FE40 3400A2A3 */  sb         $2, 0x34($sp)
/* 2FF44 0012FE44 D48B848F */  lw         $4, -0x742C($gp)
/* 2FF48 0012FE48 4E000524 */  addiu      $5, $0, 0x4E
/* 2FF4C 0012FE4C 0000C6DC */  ld         $6, 0x0($6)
/* 2FF50 0012FE50 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FF54 0012FE54 00000000 */   nop
/* 2FF58 0012FE58 3800A227 */  addiu      $2, $sp, 0x38
/* 2FF5C 0012FE5C F88B83DF */  ld         $3, -0x7408($gp)
/* 2FF60 0012FE60 000043FC */  sd         $3, 0x0($2)
/* 2FF64 0012FE64 3800A593 */  lbu        $5, 0x38($sp)
/* 2FF68 0012FE68 02000464 */  daddiu     $4, $0, 0x2
/* 2FF6C 0012FE6C FCFF0324 */  addiu      $3, $0, -0x4
/* 2FF70 0012FE70 2418A300 */  and        $3, $5, $3
/* 2FF74 0012FE74 25186400 */  or         $3, $3, $4
/* 2FF78 0012FE78 3800A3A3 */  sb         $3, 0x38($sp)
/* 2FF7C 0012FE7C 3800A593 */  lbu        $5, 0x38($sp)
/* 2FF80 0012FE80 08000464 */  daddiu     $4, $0, 0x8
/* 2FF84 0012FE84 F3FF0324 */  addiu      $3, $0, -0xD
/* 2FF88 0012FE88 2418A300 */  and        $3, $5, $3
/* 2FF8C 0012FE8C 25186400 */  or         $3, $3, $4
/* 2FF90 0012FE90 3800A3A3 */  sb         $3, 0x38($sp)
/* 2FF94 0012FE94 3800A593 */  lbu        $5, 0x38($sp)
/* 2FF98 0012FE98 20000464 */  daddiu     $4, $0, 0x20
/* 2FF9C 0012FE9C CFFF0324 */  addiu      $3, $0, -0x31
/* 2FFA0 0012FEA0 2418A300 */  and        $3, $5, $3
/* 2FFA4 0012FEA4 25186400 */  or         $3, $3, $4
/* 2FFA8 0012FEA8 3800A3A3 */  sb         $3, 0x38($sp)
/* 2FFAC 0012FEAC 3800A593 */  lbu        $5, 0x38($sp)
/* 2FFB0 0012FEB0 40000464 */  daddiu     $4, $0, 0x40
/* 2FFB4 0012FEB4 3FFF0324 */  addiu      $3, $0, -0xC1
/* 2FFB8 0012FEB8 2418A300 */  and        $3, $5, $3
/* 2FFBC 0012FEBC 25186400 */  or         $3, $3, $4
/* 2FFC0 0012FEC0 3800A3A3 */  sb         $3, 0x38($sp)
/* 2FFC4 0012FEC4 D48B848F */  lw         $4, -0x742C($gp)
/* 2FFC8 0012FEC8 42000524 */  addiu      $5, $0, 0x42
/* 2FFCC 0012FECC 000046DC */  ld         $6, 0x0($2)
/* 2FFD0 0012FED0 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FFD4 0012FED4 00000000 */   nop
/* 2FFD8 0012FED8 D48B848F */  lw         $4, -0x742C($gp)
/* 2FFDC 0012FEDC 01000524 */  addiu      $5, $0, 0x1
/* 2FFE0 0012FEE0 80800234 */  ori        $2, $0, 0x8080
/* 2FFE4 0012FEE4 38140200 */  dsll       $2, $2, 16
/* 2FFE8 0012FEE8 80804634 */  ori        $6, $2, 0x8080
/* 2FFEC 0012FEEC 0A84040C */  jal        sceVif1PkAddGsAD
/* 2FFF0 0012FEF0 00000000 */   nop
/* 2FFF4 0012FEF4 3C101000 */  dsll32     $2, $16, 0
/* 2FFF8 0012FEF8 3F100200 */  dsra32     $2, $2, 0
/* 2FFFC 0012FEFC 3C800200 */  dsll32     $16, $2, 0
/* 30000 0012FF00 0079023C */  lui        $2, (0x79006C00 >> 16)
/* 30004 0012FF04 006C4234 */  ori        $2, $2, (0x79006C00 & 0xFFFF)
/* 30008 0012FF08 25300202 */  or         $6, $16, $2
/* 3000C 0012FF0C D48B848F */  lw         $4, -0x742C($gp)
/* 30010 0012FF10 04000524 */  addiu      $5, $0, 0x4
/* 30014 0012FF14 0A84040C */  jal        sceVif1PkAddGsAD
/* 30018 0012FF18 00000000 */   nop
/* 3001C 0012FF1C 0079023C */  lui        $2, (0x79009400 >> 16)
/* 30020 0012FF20 00944234 */  ori        $2, $2, (0x79009400 & 0xFFFF)
/* 30024 0012FF24 25300202 */  or         $6, $16, $2
/* 30028 0012FF28 D48B848F */  lw         $4, -0x742C($gp)
/* 3002C 0012FF2C 04000524 */  addiu      $5, $0, 0x4
/* 30030 0012FF30 0A84040C */  jal        sceVif1PkAddGsAD
/* 30034 0012FF34 00000000 */   nop
/* 30038 0012FF38 00870234 */  ori        $2, $0, 0x8700
/* 3003C 0012FF3C 38140200 */  dsll       $2, $2, 16
/* 30040 0012FF40 006C4234 */  ori        $2, $2, 0x6C00
/* 30044 0012FF44 25300202 */  or         $6, $16, $2
/* 30048 0012FF48 D48B848F */  lw         $4, -0x742C($gp)
/* 3004C 0012FF4C 04000524 */  addiu      $5, $0, 0x4
/* 30050 0012FF50 0A84040C */  jal        sceVif1PkAddGsAD
/* 30054 0012FF54 00000000 */   nop
/* 30058 0012FF58 00870234 */  ori        $2, $0, 0x8700
/* 3005C 0012FF5C 38140200 */  dsll       $2, $2, 16
/* 30060 0012FF60 00944234 */  ori        $2, $2, 0x9400
/* 30064 0012FF64 25300202 */  or         $6, $16, $2
/* 30068 0012FF68 D48B848F */  lw         $4, -0x742C($gp)
/* 3006C 0012FF6C 04000524 */  addiu      $5, $0, 0x4
/* 30070 0012FF70 0A84040C */  jal        sceVif1PkAddGsAD
/* 30074 0012FF74 00000000 */   nop
/* 30078 0012FF78 D48B848F */  lw         $4, -0x742C($gp)
/* 3007C 0012FF7C 3F000524 */  addiu      $5, $0, 0x3F
/* 30080 0012FF80 28360070 */  paddub     $6, $0, $0
/* 30084 0012FF84 0A84040C */  jal        sceVif1PkAddGsAD
/* 30088 0012FF88 00000000 */   nop
/* 3008C 0012FF8C E88B8227 */  addiu      $2, $gp, -0x7418
/* 30090 0012FF90 D48B848F */  lw         $4, -0x742C($gp)
/* 30094 0012FF94 47000524 */  addiu      $5, $0, 0x47
/* 30098 0012FF98 000046DC */  ld         $6, 0x0($2)
/* 3009C 0012FF9C 0A84040C */  jal        sceVif1PkAddGsAD
/* 300A0 0012FFA0 00000000 */   nop
/* 300A4 0012FFA4 F08B8227 */  addiu      $2, $gp, -0x7410
/* 300A8 0012FFA8 D48B848F */  lw         $4, -0x742C($gp)
/* 300AC 0012FFAC 4E000524 */  addiu      $5, $0, 0x4E
/* 300B0 0012FFB0 000046DC */  ld         $6, 0x0($2)
/* 300B4 0012FFB4 0A84040C */  jal        sceVif1PkAddGsAD
/* 300B8 0012FFB8 00000000 */   nop
/* 300BC 0012FFBC F88B8227 */  addiu      $2, $gp, -0x7408
/* 300C0 0012FFC0 D48B848F */  lw         $4, -0x742C($gp)
/* 300C4 0012FFC4 42000524 */  addiu      $5, $0, 0x42
/* 300C8 0012FFC8 000046DC */  ld         $6, 0x0($2)
/* 300CC 0012FFCC 0A84040C */  jal        sceVif1PkAddGsAD
/* 300D0 0012FFD0 00000000 */   nop
/* 300D4 0012FFD4 D48B848F */  lw         $4, -0x742C($gp)
/* 300D8 0012FFD8 B683040C */  jal        sceVif1PkCloseGifTag
/* 300DC 0012FFDC 00000000 */   nop
/* 300E0 0012FFE0 D48B848F */  lw         $4, -0x742C($gp)
/* 300E4 0012FFE4 A483040C */  jal        sceVif1PkCloseDirectCode
/* 300E8 0012FFE8 00000000 */   nop
/* 300EC 0012FFEC 1000BF7B */  lq         $31, 0x10($sp)
/* 300F0 0012FFF0 0000B07B */  lq         $16, 0x0($sp)
/* 300F4 0012FFF4 4000BD27 */  addiu      $sp, $sp, 0x40
/* 300F8 0012FFF8 0800E003 */  jr         $31
/* 300FC 0012FFFC 00000000 */   nop
