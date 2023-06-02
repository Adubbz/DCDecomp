.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel atan
/* 1CCC0 0011CBC0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 1CCC4 0011CBC4 4000B4FF */  sd         $20, 0x40($sp)
/* 1CCC8 0011CBC8 7000BFFF */  sd         $31, 0x70($sp)
/* 1CCCC 0011CBCC 2DA08000 */  daddu      $20, $4, $0
/* 1CCD0 0011CBD0 6000B6FF */  sd         $22, 0x60($sp)
/* 1CCD4 0011CBD4 5000B5FF */  sd         $21, 0x50($sp)
/* 1CCD8 0011CBD8 3000B3FF */  sd         $19, 0x30($sp)
/* 1CCDC 0011CBDC 2000B2FF */  sd         $18, 0x20($sp)
/* 1CCE0 0011CBE0 1000B1FF */  sd         $17, 0x10($sp)
/* 1CCE4 0011CBE4 0000B0FF */  sd         $16, 0x0($sp)
/* 1CCE8 0011CBE8 2D108002 */  daddu      $2, $20, $0
/* 1CCEC 0011CBEC 3FB00200 */  dsra32     $22, $2, 0
/* 1CCF0 0011CBF0 FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 1CCF4 0011CBF4 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 1CCF8 0011CBF8 0F44023C */  lui        $2, (0x440FFFFF >> 16)
/* 1CCFC 0011CBFC 2480C302 */  and        $16, $22, $3
/* 1CD00 0011CC00 FFFF4234 */  ori        $2, $2, (0x440FFFFF & 0xFFFF)
/* 1CD04 0011CC04 2A105000 */  slt        $2, $2, $16
/* 1CD08 0011CC08 20004010 */  beqz       $2, .L0011CC8C
/* 1CD0C 0011CC0C 2D108002 */   daddu     $2, $20, $0
/* 1CD10 0011CC10 3C180200 */  dsll32     $3, $2, 0
/* 1CD14 0011CC14 3F180300 */  dsra32     $3, $3, 0
/* 1CD18 0011CC18 F07F043C */  lui        $4, (0x7FF00000 >> 16)
/* 1CD1C 0011CC1C 2A109000 */  slt        $2, $4, $16
/* 1CD20 0011CC20 05004054 */  bnel       $2, $0, .L0011CC38
/* 1CD24 0011CC24 2D208002 */   daddu     $4, $20, $0
/* 1CD28 0011CC28 07000416 */  bne        $16, $4, .L0011CC48
/* 1CD2C 0011CC2C 00000000 */   nop
/* 1CD30 0011CC30 05006010 */  beqz       $3, .L0011CC48
/* 1CD34 0011CC34 2D208002 */   daddu     $4, $20, $0
.L0011CC38:
/* 1CD38 0011CC38 6E3F040C */  jal        dpadd
/* 1CD3C 0011CC3C 2D288000 */   daddu     $5, $4, $0
/* 1CD40 0011CC40 D9000010 */  b          .L0011CFA8
/* 1CD44 0011CC44 7000BFDF */   ld        $31, 0x70($sp)
.L0011CC48:
/* 1CD48 0011CC48 0700C01A */  blez       $22, .L0011CC68
/* 1CD4C 0011CC4C 2A00023C */   lui       $2, (0x2A0000 >> 16)
/* 1CD50 0011CC50 2A00033C */  lui        $3, (0x2A0000 >> 16)
/* 1CD54 0011CC54 888944DC */  ld         $4, -0x7678($2)
/* 1CD58 0011CC58 6E3F040C */  jal        dpadd
/* 1CD5C 0011CC5C A88965DC */   ld        $5, -0x7658($3)
/* 1CD60 0011CC60 D1000010 */  b          .L0011CFA8
/* 1CD64 0011CC64 7000BFDF */   ld        $31, 0x70($sp)
.L0011CC68:
/* 1CD68 0011CC68 2D200000 */  daddu      $4, $0, $0
/* 1CD6C 0011CC6C 843F040C */  jal        dpsub
/* 1CD70 0011CC70 888945DC */   ld        $5, -0x7678($2)
/* 1CD74 0011CC74 2A00033C */  lui        $3, (0x2A0000 >> 16)
/* 1CD78 0011CC78 2D204000 */  daddu      $4, $2, $0
/* 1CD7C 0011CC7C 843F040C */  jal        dpsub
/* 1CD80 0011CC80 A88965DC */   ld        $5, -0x7658($3)
/* 1CD84 0011CC84 C8000010 */  b          .L0011CFA8
/* 1CD88 0011CC88 7000BFDF */   ld        $31, 0x70($sp)
.L0011CC8C:
/* 1CD8C 0011CC8C DB3F023C */  lui        $2, (0x3FDBFFFF >> 16)
/* 1CD90 0011CC90 FFFF4234 */  ori        $2, $2, (0x3FDBFFFF & 0xFFFF)
/* 1CD94 0011CC94 2A105000 */  slt        $2, $2, $16
/* 1CD98 0011CC98 11004014 */  bnez       $2, .L0011CCE0
/* 1CD9C 0011CC9C 1F3E023C */   lui       $2, (0x3E1FFFFF >> 16)
/* 1CDA0 0011CCA0 FFFF4234 */  ori        $2, $2, (0x3E1FFFFF & 0xFFFF)
/* 1CDA4 0011CCA4 2A105000 */  slt        $2, $2, $16
/* 1CDA8 0011CCA8 50004014 */  bnez       $2, .L0011CDEC
/* 1CDAC 0011CCAC FFFF1524 */   addiu     $21, $0, -0x1
/* 1CDB0 0011CCB0 2A00023C */  lui        $2, (0x2A0000 >> 16)
/* 1CDB4 0011CCB4 2D208002 */  daddu      $4, $20, $0
/* 1CDB8 0011CCB8 6E3F040C */  jal        dpadd
/* 1CDBC 0011CCBC 188A45DC */   ld        $5, -0x75E8($2)
/* 1CDC0 0011CCC0 C0FF0534 */  ori        $5, $0, 0xFFC0
/* 1CDC4 0011CCC4 BC2B0500 */  dsll32     $5, $5, 14
/* 1CDC8 0011CCC8 E840040C */  jal        dpcmp
/* 1CDCC 0011CCCC 2D204000 */   daddu     $4, $2, $0
/* 1CDD0 0011CCD0 B400401C */  bgtz       $2, .L0011CFA4
/* 1CDD4 0011CCD4 2D108002 */   daddu     $2, $20, $0
/* 1CDD8 0011CCD8 44000010 */  b          .L0011CDEC
/* 1CDDC 0011CCDC FFFF1524 */   addiu     $21, $0, -0x1
.L0011CCE0:
/* 1CDE0 0011CCE0 3674040C */  jal        fabs
/* 1CDE4 0011CCE4 2D208002 */   daddu     $4, $20, $0
/* 1CDE8 0011CCE8 F23F033C */  lui        $3, (0x3FF2FFFF >> 16)
/* 1CDEC 0011CCEC FFFF6334 */  ori        $3, $3, (0x3FF2FFFF & 0xFFFF)
/* 1CDF0 0011CCF0 2A187000 */  slt        $3, $3, $16
/* 1CDF4 0011CCF4 21006014 */  bnez       $3, .L0011CD7C
/* 1CDF8 0011CCF8 2DA04000 */   daddu     $20, $2, $0
/* 1CDFC 0011CCFC E53F023C */  lui        $2, (0x3FE5FFFF >> 16)
/* 1CE00 0011CD00 FFFF4234 */  ori        $2, $2, (0x3FE5FFFF & 0xFFFF)
/* 1CE04 0011CD04 2A105000 */  slt        $2, $2, $16
/* 1CE08 0011CD08 10004014 */  bnez       $2, .L0011CD4C
/* 1CE0C 0011CD0C 2D208002 */   daddu     $4, $20, $0
/* 1CE10 0011CD10 6E3F040C */  jal        dpadd
/* 1CE14 0011CD14 2D288002 */   daddu     $5, $20, $0
/* 1CE18 0011CD18 2DA80000 */  daddu      $21, $0, $0
/* 1CE1C 0011CD1C C0FF0534 */  ori        $5, $0, 0xFFC0
/* 1CE20 0011CD20 BC2B0500 */  dsll32     $5, $5, 14
/* 1CE24 0011CD24 843F040C */  jal        dpsub
/* 1CE28 0011CD28 2D204000 */   daddu     $4, $2, $0
/* 1CE2C 0011CD2C 00800534 */  ori        $5, $0, 0x8000
/* 1CE30 0011CD30 FC2B0500 */  dsll32     $5, $5, 15
/* 1CE34 0011CD34 2D804000 */  daddu      $16, $2, $0
/* 1CE38 0011CD38 6E3F040C */  jal        dpadd
/* 1CE3C 0011CD3C 2D208002 */   daddu     $4, $20, $0
/* 1CE40 0011CD40 2D200002 */  daddu      $4, $16, $0
/* 1CE44 0011CD44 26000010 */  b          .L0011CDE0
/* 1CE48 0011CD48 2D284000 */   daddu     $5, $2, $0
.L0011CD4C:
/* 1CE4C 0011CD4C C0FF1134 */  ori        $17, $0, 0xFFC0
/* 1CE50 0011CD50 BC8B1100 */  dsll32     $17, $17, 14
/* 1CE54 0011CD54 01001524 */  addiu      $21, $0, 0x1
/* 1CE58 0011CD58 843F040C */  jal        dpsub
/* 1CE5C 0011CD5C 2D282002 */   daddu     $5, $17, $0
/* 1CE60 0011CD60 2D804000 */  daddu      $16, $2, $0
/* 1CE64 0011CD64 2D208002 */  daddu      $4, $20, $0
/* 1CE68 0011CD68 6E3F040C */  jal        dpadd
/* 1CE6C 0011CD6C 2D282002 */   daddu     $5, $17, $0
/* 1CE70 0011CD70 2D200002 */  daddu      $4, $16, $0
/* 1CE74 0011CD74 1A000010 */  b          .L0011CDE0
/* 1CE78 0011CD78 2D284000 */   daddu     $5, $2, $0
.L0011CD7C:
/* 1CE7C 0011CD7C 0340023C */  lui        $2, (0x40037FFF >> 16)
/* 1CE80 0011CD80 FF7F4234 */  ori        $2, $2, (0x40037FFF & 0xFFFF)
/* 1CE84 0011CD84 2A105000 */  slt        $2, $2, $16
/* 1CE88 0011CD88 12004054 */  bnel       $2, $0, .L0011CDD4
/* 1CE8C 0011CD8C 2D288002 */   daddu     $5, $20, $0
/* 1CE90 0011CD90 E0FF1034 */  ori        $16, $0, 0xFFE0
/* 1CE94 0011CD94 BC831000 */  dsll32     $16, $16, 14
/* 1CE98 0011CD98 2D208002 */  daddu      $4, $20, $0
/* 1CE9C 0011CD9C 02001524 */  addiu      $21, $0, 0x2
/* 1CEA0 0011CDA0 843F040C */  jal        dpsub
/* 1CEA4 0011CDA4 2D280002 */   daddu     $5, $16, $0
/* 1CEA8 0011CDA8 2D884000 */  daddu      $17, $2, $0
/* 1CEAC 0011CDAC 2D208002 */  daddu      $4, $20, $0
/* 1CEB0 0011CDB0 9E3F040C */  jal        dpmul
/* 1CEB4 0011CDB4 2D280002 */   daddu     $5, $16, $0
/* 1CEB8 0011CDB8 C0FF0534 */  ori        $5, $0, 0xFFC0
/* 1CEBC 0011CDBC BC2B0500 */  dsll32     $5, $5, 14
/* 1CEC0 0011CDC0 6E3F040C */  jal        dpadd
/* 1CEC4 0011CDC4 2D204000 */   daddu     $4, $2, $0
/* 1CEC8 0011CDC8 2D202002 */  daddu      $4, $17, $0
/* 1CECC 0011CDCC 04000010 */  b          .L0011CDE0
/* 1CED0 0011CDD0 2D284000 */   daddu     $5, $2, $0
.L0011CDD4:
/* 1CED4 0011CDD4 F0BF0434 */  ori        $4, $0, 0xBFF0
/* 1CED8 0011CDD8 3C240400 */  dsll32     $4, $4, 16
/* 1CEDC 0011CDDC 03001524 */  addiu      $21, $0, 0x3
.L0011CDE0:
/* 1CEE0 0011CDE0 4840040C */  jal        dpdiv
/* 1CEE4 0011CDE4 00000000 */   nop
/* 1CEE8 0011CDE8 2DA04000 */  daddu      $20, $2, $0
.L0011CDEC:
/* 1CEEC 0011CDEC 2D208002 */  daddu      $4, $20, $0
/* 1CEF0 0011CDF0 9E3F040C */  jal        dpmul
/* 1CEF4 0011CDF4 2D288002 */   daddu     $5, $20, $0
/* 1CEF8 0011CDF8 2A00133C */  lui        $19, %hi(aT)
/* 1CEFC 0011CDFC 2D904000 */  daddu      $18, $2, $0
/* 1CF00 0011CE00 B0897126 */  addiu      $17, $19, %lo(aT)
/* 1CF04 0011CE04 2D204002 */  daddu      $4, $18, $0
/* 1CF08 0011CE08 9E3F040C */  jal        dpmul
/* 1CF0C 0011CE0C 2D284002 */   daddu     $5, $18, $0
/* 1CF10 0011CE10 2D804000 */  daddu      $16, $2, $0
/* 1CF14 0011CE14 500025DE */  ld         $5, 0x50($17)
/* 1CF18 0011CE18 9E3F040C */  jal        dpmul
/* 1CF1C 0011CE1C 2D200002 */   daddu     $4, $16, $0
/* 1CF20 0011CE20 400024DE */  ld         $4, 0x40($17)
/* 1CF24 0011CE24 6E3F040C */  jal        dpadd
/* 1CF28 0011CE28 2D284000 */   daddu     $5, $2, $0
/* 1CF2C 0011CE2C 2D284000 */  daddu      $5, $2, $0
/* 1CF30 0011CE30 9E3F040C */  jal        dpmul
/* 1CF34 0011CE34 2D200002 */   daddu     $4, $16, $0
/* 1CF38 0011CE38 300024DE */  ld         $4, 0x30($17)
/* 1CF3C 0011CE3C 6E3F040C */  jal        dpadd
/* 1CF40 0011CE40 2D284000 */   daddu     $5, $2, $0
/* 1CF44 0011CE44 2D284000 */  daddu      $5, $2, $0
/* 1CF48 0011CE48 9E3F040C */  jal        dpmul
/* 1CF4C 0011CE4C 2D200002 */   daddu     $4, $16, $0
/* 1CF50 0011CE50 200024DE */  ld         $4, 0x20($17)
/* 1CF54 0011CE54 6E3F040C */  jal        dpadd
/* 1CF58 0011CE58 2D284000 */   daddu     $5, $2, $0
/* 1CF5C 0011CE5C 2D284000 */  daddu      $5, $2, $0
/* 1CF60 0011CE60 9E3F040C */  jal        dpmul
/* 1CF64 0011CE64 2D200002 */   daddu     $4, $16, $0
/* 1CF68 0011CE68 100024DE */  ld         $4, 0x10($17)
/* 1CF6C 0011CE6C 6E3F040C */  jal        dpadd
/* 1CF70 0011CE70 2D284000 */   daddu     $5, $2, $0
/* 1CF74 0011CE74 2D284000 */  daddu      $5, $2, $0
/* 1CF78 0011CE78 9E3F040C */  jal        dpmul
/* 1CF7C 0011CE7C 2D200002 */   daddu     $4, $16, $0
/* 1CF80 0011CE80 B08964DE */  ld         $4, -0x7650($19)
/* 1CF84 0011CE84 6E3F040C */  jal        dpadd
/* 1CF88 0011CE88 2D284000 */   daddu     $5, $2, $0
/* 1CF8C 0011CE8C 2D204002 */  daddu      $4, $18, $0
/* 1CF90 0011CE90 9E3F040C */  jal        dpmul
/* 1CF94 0011CE94 2D284000 */   daddu     $5, $2, $0
/* 1CF98 0011CE98 480025DE */  ld         $5, 0x48($17)
/* 1CF9C 0011CE9C 2D904000 */  daddu      $18, $2, $0
/* 1CFA0 0011CEA0 9E3F040C */  jal        dpmul
/* 1CFA4 0011CEA4 2D200002 */   daddu     $4, $16, $0
/* 1CFA8 0011CEA8 380024DE */  ld         $4, 0x38($17)
/* 1CFAC 0011CEAC 6E3F040C */  jal        dpadd
/* 1CFB0 0011CEB0 2D284000 */   daddu     $5, $2, $0
/* 1CFB4 0011CEB4 2D284000 */  daddu      $5, $2, $0
/* 1CFB8 0011CEB8 9E3F040C */  jal        dpmul
/* 1CFBC 0011CEBC 2D200002 */   daddu     $4, $16, $0
/* 1CFC0 0011CEC0 280024DE */  ld         $4, 0x28($17)
/* 1CFC4 0011CEC4 6E3F040C */  jal        dpadd
/* 1CFC8 0011CEC8 2D284000 */   daddu     $5, $2, $0
/* 1CFCC 0011CECC 2D284000 */  daddu      $5, $2, $0
/* 1CFD0 0011CED0 9E3F040C */  jal        dpmul
/* 1CFD4 0011CED4 2D200002 */   daddu     $4, $16, $0
/* 1CFD8 0011CED8 180024DE */  ld         $4, 0x18($17)
/* 1CFDC 0011CEDC 6E3F040C */  jal        dpadd
/* 1CFE0 0011CEE0 2D284000 */   daddu     $5, $2, $0
/* 1CFE4 0011CEE4 2D284000 */  daddu      $5, $2, $0
/* 1CFE8 0011CEE8 9E3F040C */  jal        dpmul
/* 1CFEC 0011CEEC 2D200002 */   daddu     $4, $16, $0
/* 1CFF0 0011CEF0 080024DE */  ld         $4, 0x8($17)
/* 1CFF4 0011CEF4 6E3F040C */  jal        dpadd
/* 1CFF8 0011CEF8 2D284000 */   daddu     $5, $2, $0
/* 1CFFC 0011CEFC 2D200002 */  daddu      $4, $16, $0
/* 1D000 0011CF00 9E3F040C */  jal        dpmul
/* 1D004 0011CF04 2D284000 */   daddu     $5, $2, $0
/* 1D008 0011CF08 0C00A106 */  bgez       $21, .L0011CF3C
/* 1D00C 0011CF0C 2A00113C */   lui       $17, %hi(atanhi)
/* 1D010 0011CF10 2D204002 */  daddu      $4, $18, $0
/* 1D014 0011CF14 6E3F040C */  jal        dpadd
/* 1D018 0011CF18 2D284000 */   daddu     $5, $2, $0
/* 1D01C 0011CF1C 2D284000 */  daddu      $5, $2, $0
/* 1D020 0011CF20 9E3F040C */  jal        dpmul
/* 1D024 0011CF24 2D208002 */   daddu     $4, $20, $0
/* 1D028 0011CF28 2D208002 */  daddu      $4, $20, $0
/* 1D02C 0011CF2C 843F040C */  jal        dpsub
/* 1D030 0011CF30 2D284000 */   daddu     $5, $2, $0
/* 1D034 0011CF34 1C000010 */  b          .L0011CFA8
/* 1D038 0011CF38 7000BFDF */   ld        $31, 0x70($sp)
.L0011CF3C:
/* 1D03C 0011CF3C C0801500 */  sll        $16, $21, 3
/* 1D040 0011CF40 70893126 */  addiu      $17, $17, %lo(atanhi)
/* 1D044 0011CF44 2D204002 */  daddu      $4, $18, $0
/* 1D048 0011CF48 21881102 */  addu       $17, $16, $17
/* 1D04C 0011CF4C 6E3F040C */  jal        dpadd
/* 1D050 0011CF50 2D284000 */   daddu     $5, $2, $0
/* 1D054 0011CF54 2D284000 */  daddu      $5, $2, $0
/* 1D058 0011CF58 9E3F040C */  jal        dpmul
/* 1D05C 0011CF5C 2D208002 */   daddu     $4, $20, $0
/* 1D060 0011CF60 2A00033C */  lui        $3, %hi(atanlo)
/* 1D064 0011CF64 2D204000 */  daddu      $4, $2, $0
/* 1D068 0011CF68 90896324 */  addiu      $3, $3, %lo(atanlo)
/* 1D06C 0011CF6C 21800302 */  addu       $16, $16, $3
/* 1D070 0011CF70 843F040C */  jal        dpsub
/* 1D074 0011CF74 000005DE */   ld        $5, 0x0($16)
/* 1D078 0011CF78 2D204000 */  daddu      $4, $2, $0
/* 1D07C 0011CF7C 843F040C */  jal        dpsub
/* 1D080 0011CF80 2D288002 */   daddu     $5, $20, $0
/* 1D084 0011CF84 000024DE */  ld         $4, 0x0($17)
/* 1D088 0011CF88 843F040C */  jal        dpsub
/* 1D08C 0011CF8C 2D284000 */   daddu     $5, $2, $0
/* 1D090 0011CF90 0500C106 */  bgez       $22, .L0011CFA8
/* 1D094 0011CF94 7000BFDF */   ld        $31, 0x70($sp)
/* 1D098 0011CF98 2D284000 */  daddu      $5, $2, $0
/* 1D09C 0011CF9C 843F040C */  jal        dpsub
/* 1D0A0 0011CFA0 2D200000 */   daddu     $4, $0, $0
.L0011CFA4:
/* 1D0A4 0011CFA4 7000BFDF */  ld         $31, 0x70($sp)
.L0011CFA8:
/* 1D0A8 0011CFA8 6000B6DF */  ld         $22, 0x60($sp)
/* 1D0AC 0011CFAC 5000B5DF */  ld         $21, 0x50($sp)
/* 1D0B0 0011CFB0 4000B4DF */  ld         $20, 0x40($sp)
/* 1D0B4 0011CFB4 3000B3DF */  ld         $19, 0x30($sp)
/* 1D0B8 0011CFB8 2000B2DF */  ld         $18, 0x20($sp)
/* 1D0BC 0011CFBC 1000B1DF */  ld         $17, 0x10($sp)
/* 1D0C0 0011CFC0 0000B0DF */  ld         $16, 0x0($sp)
/* 1D0C4 0011CFC4 0800E003 */  jr         $31
/* 1D0C8 0011CFC8 8000BD27 */   addiu     $sp, $sp, 0x80
/* 1D0CC 0011CFCC 00000000 */  nop
