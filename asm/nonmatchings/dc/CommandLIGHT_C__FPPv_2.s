.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandLIGHT_C__FPPv_2
/* 9FDA0 0019FCA0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 9FDA4 0019FCA4 5000BF7F */  sq         $31, 0x50($sp)
/* 9FDA8 0019FCA8 4000B47F */  sq         $20, 0x40($sp)
/* 9FDAC 0019FCAC 3000B37F */  sq         $19, 0x30($sp)
/* 9FDB0 0019FCB0 2000B27F */  sq         $18, 0x20($sp)
/* 9FDB4 0019FCB4 1000B17F */  sq         $17, 0x10($sp)
/* 9FDB8 0019FCB8 0000B07F */  sq         $16, 0x0($sp)
/* 9FDBC 0019FCBC 28A68070 */  paddub     $20, $4, $0
/* 9FDC0 0019FCC0 1800828C */  lw         $2, 0x18($4)
/* 9FDC4 0019FCC4 0000508C */  lw         $16, 0x0($2)
/* 9FDC8 0019FCC8 0000828C */  lw         $2, 0x0($4)
/* 9FDCC 0019FCCC 000040C4 */  lwc1       $f0, 0x0($2)
/* 9FDD0 0019FCD0 6000A0E7 */  swc1       $f0, 0x60($sp)
/* 9FDD4 0019FCD4 0400828C */  lw         $2, 0x4($4)
/* 9FDD8 0019FCD8 000040C4 */  lwc1       $f0, 0x0($2)
/* 9FDDC 0019FCDC 6400B127 */  addiu      $17, $sp, 0x64
/* 9FDE0 0019FCE0 000020E6 */  swc1       $f0, 0x0($17)
/* 9FDE4 0019FCE4 0800828C */  lw         $2, 0x8($4)
/* 9FDE8 0019FCE8 000040C4 */  lwc1       $f0, 0x0($2)
/* 9FDEC 0019FCEC 6800B227 */  addiu      $18, $sp, 0x68
/* 9FDF0 0019FCF0 000040E6 */  swc1       $f0, 0x0($18)
/* 9FDF4 0019FCF4 6C00B327 */  addiu      $19, $sp, 0x6C
/* 9FDF8 0019FCF8 000060AE */  sw         $0, 0x0($19)
/* 9FDFC 0019FCFC 6000A427 */  addiu      $4, $sp, 0x60
/* 9FE00 0019FD00 282E8070 */  paddub     $5, $4, $0
/* 9FE04 0019FD04 9285040C */  jal        sceVu0Normalize
/* 9FE08 0019FD08 00000000 */   nop
/* 9FE0C 0019FD0C 6000A0C7 */  lwc1       $f0, 0x60($sp)
/* 9FE10 0019FD10 FFFF0426 */  addiu      $4, $16, -0x1
/* 9FE14 0019FD14 80280400 */  sll        $5, $4, 2
/* 9FE18 0019FD18 9092838F */  lw         $3, -0x6D70($gp)
/* 9FE1C 0019FD1C 2118A300 */  addu       $3, $5, $3
/* 9FE20 0019FD20 E00460E4 */  swc1       $f0, 0x4E0($3)
/* 9FE24 0019FD24 000020C6 */  lwc1       $f0, 0x0($17)
/* 9FE28 0019FD28 9092838F */  lw         $3, -0x6D70($gp)
/* 9FE2C 0019FD2C 2118A300 */  addu       $3, $5, $3
/* 9FE30 0019FD30 F00460E4 */  swc1       $f0, 0x4F0($3)
/* 9FE34 0019FD34 000040C6 */  lwc1       $f0, 0x0($18)
/* 9FE38 0019FD38 9092838F */  lw         $3, -0x6D70($gp)
/* 9FE3C 0019FD3C 2118A300 */  addu       $3, $5, $3
/* 9FE40 0019FD40 000560E4 */  swc1       $f0, 0x500($3)
/* 9FE44 0019FD44 000060C6 */  lwc1       $f0, 0x0($19)
/* 9FE48 0019FD48 9092838F */  lw         $3, -0x6D70($gp)
/* 9FE4C 0019FD4C 2118A300 */  addu       $3, $5, $3
/* 9FE50 0019FD50 100560E4 */  swc1       $f0, 0x510($3)
/* 9FE54 0019FD54 0C00838E */  lw         $3, 0xC($20)
/* 9FE58 0019FD58 000060C4 */  lwc1       $f0, 0x0($3)
/* 9FE5C 0019FD5C 00290400 */  sll        $5, $4, 4
/* 9FE60 0019FD60 9092838F */  lw         $3, -0x6D70($gp)
/* 9FE64 0019FD64 2118A300 */  addu       $3, $5, $3
/* 9FE68 0019FD68 200560E4 */  swc1       $f0, 0x520($3)
/* 9FE6C 0019FD6C 1000838E */  lw         $3, 0x10($20)
/* 9FE70 0019FD70 000060C4 */  lwc1       $f0, 0x0($3)
/* 9FE74 0019FD74 9092838F */  lw         $3, -0x6D70($gp)
/* 9FE78 0019FD78 2118A300 */  addu       $3, $5, $3
/* 9FE7C 0019FD7C 240560E4 */  swc1       $f0, 0x524($3)
/* 9FE80 0019FD80 1400838E */  lw         $3, 0x14($20)
/* 9FE84 0019FD84 000060C4 */  lwc1       $f0, 0x0($3)
/* 9FE88 0019FD88 9092838F */  lw         $3, -0x6D70($gp)
/* 9FE8C 0019FD8C 2118A300 */  addu       $3, $5, $3
/* 9FE90 0019FD90 280560E4 */  swc1       $f0, 0x528($3)
/* 9FE94 0019FD94 0043043C */  lui        $4, (0x43000000 >> 16)
/* 9FE98 0019FD98 9092838F */  lw         $3, -0x6D70($gp)
/* 9FE9C 0019FD9C 2118A300 */  addu       $3, $5, $3
/* 9FEA0 0019FDA0 2C0564AC */  sw         $4, 0x52C($3)
/* 9FEA4 0019FDA4 5000BF7B */  lq         $31, 0x50($sp)
/* 9FEA8 0019FDA8 4000B47B */  lq         $20, 0x40($sp)
/* 9FEAC 0019FDAC 3000B37B */  lq         $19, 0x30($sp)
/* 9FEB0 0019FDB0 2000B27B */  lq         $18, 0x20($sp)
/* 9FEB4 0019FDB4 1000B17B */  lq         $17, 0x10($sp)
/* 9FEB8 0019FDB8 0000B07B */  lq         $16, 0x0($sp)
/* 9FEBC 0019FDBC 7000BD27 */  addiu      $sp, $sp, 0x70
/* 9FEC0 0019FDC0 0800E003 */  jr         $31
/* 9FEC4 0019FDC4 00000000 */   nop
/* 9FEC8 0019FDC8 00000000 */  nop
/* 9FECC 0019FDCC 00000000 */  nop
