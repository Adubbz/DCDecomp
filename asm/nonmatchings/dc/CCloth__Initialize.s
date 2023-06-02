.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__6CClothFP14CDataAlloc2_1_
/* 3CCF0 0013CBF0 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 3CCF4 0013CBF4 7000BF7F */  sq         $31, 0x70($sp)
/* 3CCF8 0013CBF8 6000B67F */  sq         $22, 0x60($sp)
/* 3CCFC 0013CBFC 5000B57F */  sq         $21, 0x50($sp)
/* 3CD00 0013CC00 4000B47F */  sq         $20, 0x40($sp)
/* 3CD04 0013CC04 3000B37F */  sq         $19, 0x30($sp)
/* 3CD08 0013CC08 2000B27F */  sq         $18, 0x20($sp)
/* 3CD0C 0013CC0C 1000B17F */  sq         $17, 0x10($sp)
/* 3CD10 0013CC10 0000B07F */  sq         $16, 0x0($sp)
/* 3CD14 0013CC14 28868070 */  paddub     $16, $4, $0
/* 3CD18 0013CC18 288EA070 */  paddub     $17, $5, $0
/* 3CD1C 0013CC1C 03002016 */  bnez       $17, .L0013CC2C
/* 3CD20 0013CC20 00000000 */   nop
/* 3CD24 0013CC24 2B00023C */  lui        $2, %hi(VisualData)
/* 3CD28 0013CC28 10B05124 */  addiu      $17, $2, %lo(VisualData)
.L0013CC2C:
/* 3CD2C 0013CC2C 28262072 */  paddub     $4, $17, $0
/* 3CD30 0013CC30 609E040C */  jal        Align64__14CDataAlloc2_1_Fv
/* 3CD34 0013CC34 00000000 */   nop
/* 3CD38 0013CC38 0800228E */  lw         $2, 0x8($17)
/* 3CD3C 0013CC3C 00190200 */  sll        $3, $2, 4
/* 3CD40 0013CC40 0000228E */  lw         $2, 0x0($17)
/* 3CD44 0013CC44 21104300 */  addu       $2, $2, $3
/* 3CD48 0013CC48 240002AE */  sw         $2, 0x24($16)
/* 3CD4C 0013CC4C 28260072 */  paddub     $4, $16, $0
/* 3CD50 0013CC50 2400058E */  lw         $5, 0x24($16)
/* 3CD54 0013CC54 7CF1040C */  jal        CreateVUData__6CClothFPUi
/* 3CD58 0013CC58 00000000 */   nop
/* 3CD5C 0013CC5C 1C0002AE */  sw         $2, 0x1C($16)
/* 3CD60 0013CC60 1C00058E */  lw         $5, 0x1C($16)
/* 3CD64 0013CC64 28262072 */  paddub     $4, $17, $0
/* 3CD68 0013CC68 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 3CD6C 0013CC6C 00000000 */   nop
/* 3CD70 0013CC70 1C00058E */  lw         $5, 0x1C($16)
/* 3CD74 0013CC74 28262072 */  paddub     $4, $17, $0
/* 3CD78 0013CC78 409E040C */  jal        Alloc64__14CDataAlloc2_1_Fi
/* 3CD7C 0013CC7C 00000000 */   nop
/* 3CD80 0013CC80 280002AE */  sw         $2, 0x28($16)
/* 3CD84 0013CC84 28260072 */  paddub     $4, $16, $0
/* 3CD88 0013CC88 2800058E */  lw         $5, 0x28($16)
/* 3CD8C 0013CC8C 7CF1040C */  jal        CreateVUData__6CClothFPUi
/* 3CD90 0013CC90 00000000 */   nop
/* 3CD94 0013CC94 1C0002AE */  sw         $2, 0x1C($16)
/* 3CD98 0013CC98 288E0070 */  paddub     $17, $0, $0
/* 3CD9C 0013CC9C 2A000010 */  b          .L0013CD48
/* 3CDA0 0013CCA0 00000000 */   nop
.L0013CCA4:
/* 3CDA4 0013CCA4 80181100 */  sll        $3, $17, 2
/* 3CDA8 0013CCA8 21187000 */  addu       $3, $3, $16
/* 3CDAC 0013CCAC 107160AC */  sw         $0, 0x7110($3)
/* 3CDB0 0013CCB0 28960070 */  paddub     $18, $0, $0
/* 3CDB4 0013CCB4 1F000010 */  b          .L0013CD34
/* 3CDB8 0013CCB8 00000000 */   nop
.L0013CCBC:
/* 3CDBC 0013CCBC 2500023C */  lui        $2, %hi(_482)
/* 3CDC0 0013CCC0 40154224 */  addiu      $2, $2, %lo(_482)
/* 3CDC4 0013CCC4 8000A527 */  addiu      $5, $sp, 0x80
/* 3CDC8 0013CCC8 00004278 */  lq         $2, 0x0($2)
/* 3CDCC 0013CCCC 0000A27C */  sq         $2, 0x0($5)
/* 3CDD0 0013CCD0 00A21200 */  sll        $20, $18, 8
/* 3CDD4 0013CCD4 21101402 */  addu       $2, $16, $20
/* 3CDD8 0013CCD8 00991100 */  sll        $19, $17, 4
/* 3CDDC 0013CCDC 21A85300 */  addu       $21, $2, $19
/* 3CDE0 0013CCE0 1021A426 */  addiu      $4, $21, 0x2110
/* 3CDE4 0013CCE4 0C86040C */  jal        sceVu0CopyVector
/* 3CDE8 0013CCE8 00000000 */   nop
/* 3CDEC 0013CCEC 1041A426 */  addiu      $4, $21, 0x4110
/* 3CDF0 0013CCF0 8000A527 */  addiu      $5, $sp, 0x80
/* 3CDF4 0013CCF4 0C86040C */  jal        sceVu0CopyVector
/* 3CDF8 0013CCF8 00000000 */   nop
/* 3CDFC 0013CCFC 1051A426 */  addiu      $4, $21, 0x5110
/* 3CE00 0013CD00 8000A527 */  addiu      $5, $sp, 0x80
/* 3CE04 0013CD04 0C86040C */  jal        sceVu0CopyVector
/* 3CE08 0013CD08 00000000 */   nop
/* 3CE0C 0013CD0C 1031A426 */  addiu      $4, $21, 0x3110
/* 3CE10 0013CD10 8000A527 */  addiu      $5, $sp, 0x80
/* 3CE14 0013CD14 0C86040C */  jal        sceVu0CopyVector
/* 3CE18 0013CD18 00000000 */   nop
/* 3CE1C 0013CD1C 803F043C */  lui        $4, (0x3F800000 >> 16)
/* 3CE20 0013CD20 21189002 */  addu       $3, $20, $16
/* 3CE24 0013CD24 21186302 */  addu       $3, $19, $3
/* 3CE28 0013CD28 1C1164AC */  sw         $4, 0x111C($3)
/* 3CE2C 0013CD2C 1C2164AC */  sw         $4, 0x211C($3)
/* 3CE30 0013CD30 01005226 */  addiu      $18, $18, 0x1
.L0013CD34:
/* 3CE34 0013CD34 3000038E */  lw         $3, 0x30($16)
/* 3CE38 0013CD38 2A184302 */  slt        $3, $18, $3
/* 3CE3C 0013CD3C DFFF6014 */  bnez       $3, .L0013CCBC
/* 3CE40 0013CD40 00000000 */   nop
/* 3CE44 0013CD44 01003126 */  addiu      $17, $17, 0x1
.L0013CD48:
/* 3CE48 0013CD48 2C00038E */  lw         $3, 0x2C($16)
/* 3CE4C 0013CD4C 2A182302 */  slt        $3, $17, $3
/* 3CE50 0013CD50 D4FF6014 */  bnez       $3, .L0013CCA4
/* 3CE54 0013CD54 00000000 */   nop
/* 3CE58 0013CD58 288E0070 */  paddub     $17, $0, $0
/* 3CE5C 0013CD5C 17000010 */  b          .L0013CDBC
/* 3CE60 0013CD60 00000000 */   nop
.L0013CD64:
/* 3CE64 0013CD64 28960070 */  paddub     $18, $0, $0
/* 3CE68 0013CD68 0F000010 */  b          .L0013CDA8
/* 3CE6C 0013CD6C 00000000 */   nop
.L0013CD70:
/* 3CE70 0013CD70 00121200 */  sll        $2, $18, 8
/* 3CE74 0013CD74 21180202 */  addu       $3, $16, $2
/* 3CE78 0013CD78 00111100 */  sll        $2, $17, 4
/* 3CE7C 0013CD7C 21986200 */  addu       $19, $3, $2
/* 3CE80 0013CD80 10117426 */  addiu      $20, $19, 0x1110
/* 3CE84 0013CD84 10216426 */  addiu      $4, $19, 0x2110
/* 3CE88 0013CD88 282E8072 */  paddub     $5, $20, $0
/* 3CE8C 0013CD8C 0C86040C */  jal        sceVu0CopyVector
/* 3CE90 0013CD90 00000000 */   nop
/* 3CE94 0013CD94 10016426 */  addiu      $4, $19, 0x110
/* 3CE98 0013CD98 282E8072 */  paddub     $5, $20, $0
/* 3CE9C 0013CD9C 0C86040C */  jal        sceVu0CopyVector
/* 3CEA0 0013CDA0 00000000 */   nop
/* 3CEA4 0013CDA4 01005226 */  addiu      $18, $18, 0x1
.L0013CDA8:
/* 3CEA8 0013CDA8 2C00038E */  lw         $3, 0x2C($16)
/* 3CEAC 0013CDAC 2A184302 */  slt        $3, $18, $3
/* 3CEB0 0013CDB0 EFFF6014 */  bnez       $3, .L0013CD70
/* 3CEB4 0013CDB4 00000000 */   nop
/* 3CEB8 0013CDB8 01003126 */  addiu      $17, $17, 0x1
.L0013CDBC:
/* 3CEBC 0013CDBC 3000038E */  lw         $3, 0x30($16)
/* 3CEC0 0013CDC0 2A182302 */  slt        $3, $17, $3
/* 3CEC4 0013CDC4 E7FF6014 */  bnez       $3, .L0013CD64
/* 3CEC8 0013CDC8 00000000 */   nop
/* 3CECC 0013CDCC 2500033C */  lui        $3, %hi(_497)
/* 3CED0 0013CDD0 50156324 */  addiu      $3, $3, %lo(_497)
/* 3CED4 0013CDD4 9000A427 */  addiu      $4, $sp, 0x90
/* 3CED8 0013CDD8 00006378 */  lq         $3, 0x0($3)
/* 3CEDC 0013CDDC 0000837C */  sq         $3, 0x0($4)
/* 3CEE0 0013CDE0 288E0070 */  paddub     $17, $0, $0
/* 3CEE4 0013CDE4 09000010 */  b          .L0013CE0C
/* 3CEE8 0013CDE8 00000000 */   nop
.L0013CDEC:
/* 3CEEC 0013CDEC 00111100 */  sll        $2, $17, 4
/* 3CEF0 0013CDF0 21100202 */  addu       $2, $16, $2
/* 3CEF4 0013CDF4 9000A427 */  addiu      $4, $sp, 0x90
/* 3CEF8 0013CDF8 282E8070 */  paddub     $5, $4, $0
/* 3CEFC 0013CDFC 10014624 */  addiu      $6, $2, 0x110
/* 3CF00 0013CE00 E885040C */  jal        sceVu0AddVector
/* 3CF04 0013CE04 00000000 */   nop
/* 3CF08 0013CE08 01003126 */  addiu      $17, $17, 0x1
.L0013CE0C:
/* 3CF0C 0013CE0C 2C00048E */  lw         $4, 0x2C($16)
/* 3CF10 0013CE10 2A182402 */  slt        $3, $17, $4
/* 3CF14 0013CE14 F5FF6014 */  bnez       $3, .L0013CDEC
/* 3CF18 0013CE18 00000000 */   nop
/* 3CF1C 0013CE1C 00008444 */  mtc1       $4, $f0
/* 3CF20 0013CE20 00000000 */  nop
/* 3CF24 0013CE24 60008046 */  cvt.s.w    $f1, $f0
/* 3CF28 0013CE28 9000A0C7 */  lwc1       $f0, 0x90($sp)
/* 3CF2C 0013CE2C 03000146 */  div.s      $f0, $f0, $f1
/* 3CF30 0013CE30 000100E6 */  swc1       $f0, 0x100($16)
/* 3CF34 0013CE34 2C0000C6 */  lwc1       $f0, 0x2C($16)
/* 3CF38 0013CE38 60008046 */  cvt.s.w    $f1, $f0
/* 3CF3C 0013CE3C 9400A0C7 */  lwc1       $f0, 0x94($sp)
/* 3CF40 0013CE40 03000146 */  div.s      $f0, $f0, $f1
/* 3CF44 0013CE44 040100E6 */  swc1       $f0, 0x104($16)
/* 3CF48 0013CE48 2C0000C6 */  lwc1       $f0, 0x2C($16)
/* 3CF4C 0013CE4C 60008046 */  cvt.s.w    $f1, $f0
/* 3CF50 0013CE50 9800A0C7 */  lwc1       $f0, 0x98($sp)
/* 3CF54 0013CE54 03000146 */  div.s      $f0, $f0, $f1
/* 3CF58 0013CE58 080100E6 */  swc1       $f0, 0x108($16)
/* 3CF5C 0013CE5C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 3CF60 0013CE60 0C0103AE */  sw         $3, 0x10C($16)
/* 3CF64 0013CE64 288E0070 */  paddub     $17, $0, $0
/* 3CF68 0013CE68 68000010 */  b          .L0013D00C
/* 3CF6C 0013CE6C 00000000 */   nop
.L0013CE70:
/* 3CF70 0013CE70 28960070 */  paddub     $18, $0, $0
/* 3CF74 0013CE74 60000010 */  b          .L0013CFF8
/* 3CF78 0013CE78 00000000 */   nop
.L0013CE7C:
/* 3CF7C 0013CE7C 01004426 */  addiu      $4, $18, 0x1
/* 3CF80 0013CE80 FFFF4526 */  addiu      $5, $18, -0x1
/* 3CF84 0013CE84 FFFF3326 */  addiu      $19, $17, -0x1
/* 3CF88 0013CE88 01003426 */  addiu      $20, $17, 0x1
/* 3CF8C 0013CE8C 0F00A018 */  blez       $5, .L0013CECC
/* 3CF90 0013CE90 00000000 */   nop
/* 3CF94 0013CE94 00211100 */  sll        $4, $17, 4
/* 3CF98 0013CE98 00121200 */  sll        $2, $18, 8
/* 3CF9C 0013CE9C 21100202 */  addu       $2, $16, $2
/* 3CFA0 0013CEA0 21184400 */  addu       $3, $2, $4
/* 3CFA4 0013CEA4 00120500 */  sll        $2, $5, 8
/* 3CFA8 0013CEA8 21100202 */  addu       $2, $16, $2
/* 3CFAC 0013CEAC 21104400 */  addu       $2, $2, $4
/* 3CFB0 0013CEB0 A000A427 */  addiu      $4, $sp, 0xA0
/* 3CFB4 0013CEB4 10116524 */  addiu      $5, $3, 0x1110
/* 3CFB8 0013CEB8 10114624 */  addiu      $6, $2, 0x1110
/* 3CFBC 0013CEBC EE85040C */  jal        sceVu0SubVector
/* 3CFC0 0013CEC0 00000000 */   nop
/* 3CFC4 0013CEC4 1E000010 */  b          .L0013CF40
/* 3CFC8 0013CEC8 00000000 */   nop
.L0013CECC:
/* 3CFCC 0013CECC 2A108600 */  slt        $2, $4, $6
/* 3CFD0 0013CED0 0F004014 */  bnez       $2, .L0013CF10
/* 3CFD4 0013CED4 00000000 */   nop
/* 3CFD8 0013CED8 00211100 */  sll        $4, $17, 4
/* 3CFDC 0013CEDC 00121200 */  sll        $2, $18, 8
/* 3CFE0 0013CEE0 21100202 */  addu       $2, $16, $2
/* 3CFE4 0013CEE4 21184400 */  addu       $3, $2, $4
/* 3CFE8 0013CEE8 00120500 */  sll        $2, $5, 8
/* 3CFEC 0013CEEC 21100202 */  addu       $2, $16, $2
/* 3CFF0 0013CEF0 21104400 */  addu       $2, $2, $4
/* 3CFF4 0013CEF4 A000A427 */  addiu      $4, $sp, 0xA0
/* 3CFF8 0013CEF8 10116524 */  addiu      $5, $3, 0x1110
/* 3CFFC 0013CEFC 10114624 */  addiu      $6, $2, 0x1110
/* 3D000 0013CF00 EE85040C */  jal        sceVu0SubVector
/* 3D004 0013CF04 00000000 */   nop
/* 3D008 0013CF08 0D000010 */  b          .L0013CF40
/* 3D00C 0013CF0C 00000000 */   nop
.L0013CF10:
/* 3D010 0013CF10 00291100 */  sll        $5, $17, 4
/* 3D014 0013CF14 00121200 */  sll        $2, $18, 8
/* 3D018 0013CF18 21100202 */  addu       $2, $16, $2
/* 3D01C 0013CF1C 21184500 */  addu       $3, $2, $5
/* 3D020 0013CF20 00120400 */  sll        $2, $4, 8
/* 3D024 0013CF24 21100202 */  addu       $2, $16, $2
/* 3D028 0013CF28 21104500 */  addu       $2, $2, $5
/* 3D02C 0013CF2C A000A427 */  addiu      $4, $sp, 0xA0
/* 3D030 0013CF30 10116524 */  addiu      $5, $3, 0x1110
/* 3D034 0013CF34 10114624 */  addiu      $6, $2, 0x1110
/* 3D038 0013CF38 EE85040C */  jal        sceVu0SubVector
/* 3D03C 0013CF3C 00000000 */   nop
.L0013CF40:
/* 3D040 0013CF40 A000A427 */  addiu      $4, $sp, 0xA0
/* 3D044 0013CF44 14ED040C */  jal        vuabs__FPf
/* 3D048 0013CF48 00000000 */   nop
/* 3D04C 0013CF4C 00AA1200 */  sll        $21, $18, 8
/* 3D050 0013CF50 2120B002 */  addu       $4, $21, $16
/* 3D054 0013CF54 00B11100 */  sll        $22, $17, 4
/* 3D058 0013CF58 2118C402 */  addu       $3, $22, $4
/* 3D05C 0013CF5C 103160E4 */  swc1       $f0, 0x3110($3)
/* 3D060 0013CF60 3000028E */  lw         $2, 0x30($16)
/* 3D064 0013CF64 2A108202 */  slt        $2, $20, $2
/* 3D068 0013CF68 0A004014 */  bnez       $2, .L0013CF94
/* 3D06C 0013CF6C 00000000 */   nop
/* 3D070 0013CF70 00111300 */  sll        $2, $19, 4
/* 3D074 0013CF74 21108200 */  addu       $2, $4, $2
/* 3D078 0013CF78 A000A427 */  addiu      $4, $sp, 0xA0
/* 3D07C 0013CF7C 10116524 */  addiu      $5, $3, 0x1110
/* 3D080 0013CF80 10114624 */  addiu      $6, $2, 0x1110
/* 3D084 0013CF84 EE85040C */  jal        sceVu0SubVector
/* 3D088 0013CF88 00000000 */   nop
/* 3D08C 0013CF8C 13000010 */  b          .L0013CFDC
/* 3D090 0013CF90 00000000 */   nop
.L0013CF94:
/* 3D094 0013CF94 0A006106 */  bgez       $19, .L0013CFC0
/* 3D098 0013CF98 00000000 */   nop
/* 3D09C 0013CF9C 00111400 */  sll        $2, $20, 4
/* 3D0A0 0013CFA0 21108200 */  addu       $2, $4, $2
/* 3D0A4 0013CFA4 A000A427 */  addiu      $4, $sp, 0xA0
/* 3D0A8 0013CFA8 10116524 */  addiu      $5, $3, 0x1110
/* 3D0AC 0013CFAC 10114624 */  addiu      $6, $2, 0x1110
/* 3D0B0 0013CFB0 EE85040C */  jal        sceVu0SubVector
/* 3D0B4 0013CFB4 00000000 */   nop
/* 3D0B8 0013CFB8 08000010 */  b          .L0013CFDC
/* 3D0BC 0013CFBC 00000000 */   nop
.L0013CFC0:
/* 3D0C0 0013CFC0 00111400 */  sll        $2, $20, 4
/* 3D0C4 0013CFC4 21108200 */  addu       $2, $4, $2
/* 3D0C8 0013CFC8 A000A427 */  addiu      $4, $sp, 0xA0
/* 3D0CC 0013CFCC 10116524 */  addiu      $5, $3, 0x1110
/* 3D0D0 0013CFD0 10114624 */  addiu      $6, $2, 0x1110
/* 3D0D4 0013CFD4 EE85040C */  jal        sceVu0SubVector
/* 3D0D8 0013CFD8 00000000 */   nop
.L0013CFDC:
/* 3D0DC 0013CFDC A000A427 */  addiu      $4, $sp, 0xA0
/* 3D0E0 0013CFE0 14ED040C */  jal        vuabs__FPf
/* 3D0E4 0013CFE4 00000000 */   nop
/* 3D0E8 0013CFE8 2118B002 */  addu       $3, $21, $16
/* 3D0EC 0013CFEC 2118C302 */  addu       $3, $22, $3
/* 3D0F0 0013CFF0 143160E4 */  swc1       $f0, 0x3114($3)
/* 3D0F4 0013CFF4 01005226 */  addiu      $18, $18, 0x1
.L0013CFF8:
/* 3D0F8 0013CFF8 2C00068E */  lw         $6, 0x2C($16)
/* 3D0FC 0013CFFC 2A184602 */  slt        $3, $18, $6
/* 3D100 0013D000 9EFF6014 */  bnez       $3, .L0013CE7C
/* 3D104 0013D004 00000000 */   nop
/* 3D108 0013D008 01003126 */  addiu      $17, $17, 0x1
.L0013D00C:
/* 3D10C 0013D00C 3000038E */  lw         $3, 0x30($16)
/* 3D110 0013D010 2A182302 */  slt        $3, $17, $3
/* 3D114 0013D014 96FF6014 */  bnez       $3, .L0013CE70
/* 3D118 0013D018 00000000 */   nop
/* 3D11C 0013D01C 7000BF7B */  lq         $31, 0x70($sp)
/* 3D120 0013D020 6000B67B */  lq         $22, 0x60($sp)
/* 3D124 0013D024 5000B57B */  lq         $21, 0x50($sp)
/* 3D128 0013D028 4000B47B */  lq         $20, 0x40($sp)
/* 3D12C 0013D02C 3000B37B */  lq         $19, 0x30($sp)
/* 3D130 0013D030 2000B27B */  lq         $18, 0x20($sp)
/* 3D134 0013D034 1000B17B */  lq         $17, 0x10($sp)
/* 3D138 0013D038 0000B07B */  lq         $16, 0x0($sp)
/* 3D13C 0013D03C B000BD27 */  addiu      $sp, $sp, 0xB0
/* 3D140 0013D040 0800E003 */  jr         $31
/* 3D144 0013D044 00000000 */   nop
/* 3D148 0013D048 00000000 */  nop
/* 3D14C 0013D04C 00000000 */  nop
