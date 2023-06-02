.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set2DSpriteRot__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iifUcUcUcUc
/* 5EBD0 0015EAD0 00FFBD27 */  addiu      $sp, $sp, -0x100
/* 5EBD4 0015EAD4 B000BF7F */  sq         $31, 0xB0($sp)
/* 5EBD8 0015EAD8 A000BE7F */  sq         $fp, 0xA0($sp)
/* 5EBDC 0015EADC 9000B77F */  sq         $23, 0x90($sp)
/* 5EBE0 0015EAE0 8000B67F */  sq         $22, 0x80($sp)
/* 5EBE4 0015EAE4 7000B57F */  sq         $21, 0x70($sp)
/* 5EBE8 0015EAE8 6000B47F */  sq         $20, 0x60($sp)
/* 5EBEC 0015EAEC 5000B37F */  sq         $19, 0x50($sp)
/* 5EBF0 0015EAF0 4000B27F */  sq         $18, 0x40($sp)
/* 5EBF4 0015EAF4 3000B17F */  sq         $17, 0x30($sp)
/* 5EBF8 0015EAF8 2000B07F */  sq         $16, 0x20($sp)
/* 5EBFC 0015EAFC 1000B8E7 */  swc1       $f24, 0x10($sp)
/* 5EC00 0015EB00 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* 5EC04 0015EB04 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 5EC08 0015EB08 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 5EC0C 0015EB0C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 5EC10 0015EB10 289E8070 */  paddub     $19, $4, $0
/* 5EC14 0015EB14 28B6A070 */  paddub     $22, $5, $0
/* 5EC18 0015EB18 2896C070 */  paddub     $18, $6, $0
/* 5EC1C 0015EB1C 288EE070 */  paddub     $17, $7, $0
/* 5EC20 0015EB20 28A60071 */  paddub     $20, $8, $0
/* 5EC24 0015EB24 28862071 */  paddub     $16, $9, $0
/* 5EC28 0015EB28 06650046 */  mov.s      $f20, $f12
/* 5EC2C 0015EB2C 28BE4071 */  paddub     $23, $10, $0
/* 5EC30 0015EB30 28F66071 */  paddub     $fp, $11, $0
/* 5EC34 0015EB34 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 5EC38 0015EB38 FC00A2AF */  sw         $2, 0xFC($sp)
/* 5EC3C 0015EB3C 282E0070 */  paddub     $5, $0, $0
/* 5EC40 0015EB40 2083040C */  jal        sceVif1PkCnt
/* 5EC44 0015EB44 00000000 */   nop
/* 5EC48 0015EB48 28266072 */  paddub     $4, $19, $0
/* 5EC4C 0015EB4C 282E0070 */  paddub     $5, $0, $0
/* 5EC50 0015EB50 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 5EC54 0015EB54 00000000 */   nop
/* 5EC58 0015EB58 C701023C */  lui        $2, %hi(GiftagAD)
/* 5EC5C 0015EB5C C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 5EC60 0015EB60 28266072 */  paddub     $4, $19, $0
/* 5EC64 0015EB64 00004578 */  lq         $5, 0x0($2)
/* 5EC68 0015EB68 B083040C */  jal        sceVif1PkOpenGifTag
/* 5EC6C 0015EB6C 00000000 */   nop
/* 5EC70 0015EB70 F886828F */  lw         $2, -0x7908($gp)
/* 5EC74 0015EB74 78110200 */  dsll       $2, $2, 5
/* 5EC78 0015EB78 41004634 */  ori        $6, $2, 0x41
/* 5EC7C 0015EB7C 28266072 */  paddub     $4, $19, $0
/* 5EC80 0015EB80 14000524 */  addiu      $5, $0, 0x14
/* 5EC84 0015EB84 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EC88 0015EB88 00000000 */   nop
/* 5EC8C 0015EB8C 28266072 */  paddub     $4, $19, $0
/* 5EC90 0015EB90 282E0070 */  paddub     $5, $0, $0
/* 5EC94 0015EB94 D4010624 */  addiu      $6, $0, 0x1D4
/* 5EC98 0015EB98 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EC9C 0015EB9C 00000000 */   nop
/* 5ECA0 0015EBA0 E800A327 */  addiu      $3, $sp, 0xE8
/* 5ECA4 0015EBA4 E88B82DF */  ld         $2, -0x7418($gp)
/* 5ECA8 0015EBA8 000062FC */  sd         $2, 0x0($3)
/* 5ECAC 0015EBAC E800A493 */  lbu        $4, 0xE8($sp)
/* 5ECB0 0015EBB0 01000530 */  andi       $5, $0, 0x1
/* 5ECB4 0015EBB4 FEFF0224 */  addiu      $2, $0, -0x2
/* 5ECB8 0015EBB8 24208200 */  and        $4, $4, $2
/* 5ECBC 0015EBBC 25208500 */  or         $4, $4, $5
/* 5ECC0 0015EBC0 E800A4A3 */  sb         $4, 0xE8($sp)
/* 5ECC4 0015EBC4 E800A697 */  lhu        $6, 0xE8($sp)
/* 5ECC8 0015EBC8 FF000430 */  andi       $4, $0, 0xFF
/* 5ECCC 0015EBCC 00290400 */  sll        $5, $4, 4
/* 5ECD0 0015EBD0 0FF00424 */  addiu      $4, $0, -0xFF1
/* 5ECD4 0015EBD4 2420C400 */  and        $4, $6, $4
/* 5ECD8 0015EBD8 25208500 */  or         $4, $4, $5
/* 5ECDC 0015EBDC E800A4A7 */  sh         $4, 0xE8($sp)
/* 5ECE0 0015EBE0 E800A593 */  lbu        $5, 0xE8($sp)
/* 5ECE4 0015EBE4 02000664 */  daddiu     $6, $0, 0x2
/* 5ECE8 0015EBE8 F1FF0424 */  addiu      $4, $0, -0xF
/* 5ECEC 0015EBEC 2420A400 */  and        $4, $5, $4
/* 5ECF0 0015EBF0 25208600 */  or         $4, $4, $6
/* 5ECF4 0015EBF4 E800A4A3 */  sb         $4, 0xE8($sp)
/* 5ECF8 0015EBF8 EA00A727 */  addiu      $7, $sp, 0xEA
/* 5ECFC 0015EBFC 0000E590 */  lbu        $5, 0x0($7)
/* 5ED00 0015EC00 01000464 */  daddiu     $4, $0, 0x1
/* 5ED04 0015EC04 2410A200 */  and        $2, $5, $2
/* 5ED08 0015EC08 25104400 */  or         $2, $2, $4
/* 5ED0C 0015EC0C 0000E2A0 */  sb         $2, 0x0($7)
/* 5ED10 0015EC10 0000E490 */  lbu        $4, 0x0($7)
/* 5ED14 0015EC14 F9FF0224 */  addiu      $2, $0, -0x7
/* 5ED18 0015EC18 24108200 */  and        $2, $4, $2
/* 5ED1C 0015EC1C 25104600 */  or         $2, $2, $6
/* 5ED20 0015EC20 0000E2A0 */  sb         $2, 0x0($7)
/* 5ED24 0015EC24 28266072 */  paddub     $4, $19, $0
/* 5ED28 0015EC28 47000524 */  addiu      $5, $0, 0x47
/* 5ED2C 0015EC2C 000066DC */  ld         $6, 0x0($3)
/* 5ED30 0015EC30 0A84040C */  jal        sceVif1PkAddGsAD
/* 5ED34 0015EC34 00000000 */   nop
/* 5ED38 0015EC38 F000A327 */  addiu      $3, $sp, 0xF0
/* 5ED3C 0015EC3C F08B82DF */  ld         $2, -0x7410($gp)
/* 5ED40 0015EC40 000062FC */  sd         $2, 0x0($3)
/* 5ED44 0015EC44 F400A493 */  lbu        $4, 0xF4($sp)
/* 5ED48 0015EC48 01000364 */  daddiu     $3, $0, 0x1
/* 5ED4C 0015EC4C FEFF0224 */  addiu      $2, $0, -0x2
/* 5ED50 0015EC50 24108200 */  and        $2, $4, $2
/* 5ED54 0015EC54 25104300 */  or         $2, $2, $3
/* 5ED58 0015EC58 F400A2A3 */  sb         $2, 0xF4($sp)
/* 5ED5C 0015EC5C 23101400 */  negu       $2, $20
/* 5ED60 0015EC60 00110200 */  sll        $2, $2, 4
/* 5ED64 0015EC64 00008244 */  mtc1       $2, $f0
/* 5ED68 0015EC68 00000000 */  nop
/* 5ED6C 0015EC6C 20008046 */  cvt.s.w    $f0, $f0
/* 5ED70 0015EC70 C800A227 */  addiu      $2, $sp, 0xC8
/* 5ED74 0015EC74 000040E4 */  swc1       $f0, 0x0($2)
/* 5ED78 0015EC78 C000A0E7 */  swc1       $f0, 0xC0($sp)
/* 5ED7C 0015EC7C 0800428E */  lw         $2, 0x8($18)
/* 5ED80 0015EC80 23105400 */  subu       $2, $2, $20
/* 5ED84 0015EC84 00110200 */  sll        $2, $2, 4
/* 5ED88 0015EC88 FFFF4224 */  addiu      $2, $2, -0x1
/* 5ED8C 0015EC8C 00008244 */  mtc1       $2, $f0
/* 5ED90 0015EC90 00000000 */  nop
/* 5ED94 0015EC94 20008046 */  cvt.s.w    $f0, $f0
/* 5ED98 0015EC98 CC00A227 */  addiu      $2, $sp, 0xCC
/* 5ED9C 0015EC9C 000040E4 */  swc1       $f0, 0x0($2)
/* 5EDA0 0015ECA0 C400A227 */  addiu      $2, $sp, 0xC4
/* 5EDA4 0015ECA4 000040E4 */  swc1       $f0, 0x0($2)
/* 5EDA8 0015ECA8 23101000 */  negu       $2, $16
/* 5EDAC 0015ECAC 00110200 */  sll        $2, $2, 4
/* 5EDB0 0015ECB0 00008244 */  mtc1       $2, $f0
/* 5EDB4 0015ECB4 00000000 */  nop
/* 5EDB8 0015ECB8 20008046 */  cvt.s.w    $f0, $f0
/* 5EDBC 0015ECBC D400A227 */  addiu      $2, $sp, 0xD4
/* 5EDC0 0015ECC0 000040E4 */  swc1       $f0, 0x0($2)
/* 5EDC4 0015ECC4 D000A0E7 */  swc1       $f0, 0xD0($sp)
/* 5EDC8 0015ECC8 0C00428E */  lw         $2, 0xC($18)
/* 5EDCC 0015ECCC 23105000 */  subu       $2, $2, $16
/* 5EDD0 0015ECD0 00110200 */  sll        $2, $2, 4
/* 5EDD4 0015ECD4 FFFF4224 */  addiu      $2, $2, -0x1
/* 5EDD8 0015ECD8 00008244 */  mtc1       $2, $f0
/* 5EDDC 0015ECDC 00000000 */  nop
/* 5EDE0 0015ECE0 20008046 */  cvt.s.w    $f0, $f0
/* 5EDE4 0015ECE4 DC00A227 */  addiu      $2, $sp, 0xDC
/* 5EDE8 0015ECE8 000040E4 */  swc1       $f0, 0x0($2)
/* 5EDEC 0015ECEC D800A227 */  addiu      $2, $sp, 0xD8
/* 5EDF0 0015ECF0 000040E4 */  swc1       $f0, 0x0($2)
/* 5EDF4 0015ECF4 28AE0070 */  paddub     $21, $0, $0
/* 5EDF8 0015ECF8 36000010 */  b          .L0015EDD4
/* 5EDFC 0015ECFC 00000000 */   nop
.L0015ED00:
/* 5EE00 0015ED00 80A01500 */  sll        $20, $21, 2
/* 5EE04 0015ED04 06A30046 */  mov.s      $f12, $f20
/* 5EE08 0015ED08 2876040C */  jal        sinf
/* 5EE0C 0015ED0C 00000000 */   nop
/* 5EE10 0015ED10 21109D02 */  addu       $2, $20, $sp
/* 5EE14 0015ED14 D0005024 */  addiu      $16, $2, 0xD0
/* 5EE18 0015ED18 000017C6 */  lwc1       $f23, 0x0($16)
/* 5EE1C 0015ED1C 47B80046 */  neg.s      $f1, $f23
/* 5EE20 0015ED20 420D0046 */  mul.s      $f21, $f1, $f0
/* 5EE24 0015ED24 06A30046 */  mov.s      $f12, $f20
/* 5EE28 0015ED28 AC75040C */  jal        cosf
/* 5EE2C 0015ED2C 00000000 */   nop
/* 5EE30 0015ED30 21109D02 */  addu       $2, $20, $sp
/* 5EE34 0015ED34 C0005424 */  addiu      $20, $2, 0xC0
/* 5EE38 0015ED38 000098C6 */  lwc1       $f24, 0x0($20)
/* 5EE3C 0015ED3C 02C00046 */  mul.s      $f0, $f24, $f0
/* 5EE40 0015ED40 81AD0046 */  sub.s      $f22, $f21, $f0
/* 5EE44 0015ED44 06A30046 */  mov.s      $f12, $f20
/* 5EE48 0015ED48 2876040C */  jal        sinf
/* 5EE4C 0015ED4C 00000000 */   nop
/* 5EE50 0015ED50 47C00046 */  neg.s      $f1, $f24
/* 5EE54 0015ED54 420D0046 */  mul.s      $f21, $f1, $f0
/* 5EE58 0015ED58 06A30046 */  mov.s      $f12, $f20
/* 5EE5C 0015ED5C AC75040C */  jal        cosf
/* 5EE60 0015ED60 00000000 */   nop
/* 5EE64 0015ED64 02B80046 */  mul.s      $f0, $f23, $f0
/* 5EE68 0015ED68 40AD0046 */  add.s      $f21, $f21, $f0
/* 5EE6C 0015ED6C 06B30046 */  mov.s      $f12, $f22
/* 5EE70 0015ED70 2C44040C */  jal        fptosi
/* 5EE74 0015ED74 00000000 */   nop
/* 5EE78 0015ED78 0000438E */  lw         $3, 0x0($18)
/* 5EE7C 0015ED7C 00190300 */  sll        $3, $3, 4
/* 5EE80 0015ED80 21104300 */  addu       $2, $2, $3
/* 5EE84 0015ED84 006C4224 */  addiu      $2, $2, 0x6C00
/* 5EE88 0015ED88 00008244 */  mtc1       $2, $f0
/* 5EE8C 0015ED8C 00000000 */  nop
/* 5EE90 0015ED90 20008046 */  cvt.s.w    $f0, $f0
/* 5EE94 0015ED94 000080E6 */  swc1       $f0, 0x0($20)
/* 5EE98 0015ED98 0400428E */  lw         $2, 0x4($18)
/* 5EE9C 0015ED9C C0A00200 */  sll        $20, $2, 3
/* 5EEA0 0015EDA0 003F023C */  lui        $2, (0x3F000000 >> 16)
/* 5EEA4 0015EDA4 00008244 */  mtc1       $2, $f0
/* 5EEA8 0015EDA8 00000000 */  nop
/* 5EEAC 0015EDAC 02031546 */  mul.s      $f12, $f0, $f21
/* 5EEB0 0015EDB0 2C44040C */  jal        fptosi
/* 5EEB4 0015EDB4 00000000 */   nop
/* 5EEB8 0015EDB8 21105400 */  addu       $2, $2, $20
/* 5EEBC 0015EDBC 00794224 */  addiu      $2, $2, 0x7900
/* 5EEC0 0015EDC0 00008244 */  mtc1       $2, $f0
/* 5EEC4 0015EDC4 00000000 */  nop
/* 5EEC8 0015EDC8 20008046 */  cvt.s.w    $f0, $f0
/* 5EECC 0015EDCC 000000E6 */  swc1       $f0, 0x0($16)
/* 5EED0 0015EDD0 0100B526 */  addiu      $21, $21, 0x1
.L0015EDD4:
/* 5EED4 0015EDD4 0400A22A */  slti       $2, $21, 0x4
/* 5EED8 0015EDD8 C9FF4014 */  bnez       $2, .L0015ED00
/* 5EEDC 0015EDDC 00000000 */   nop
/* 5EEE0 0015EDE0 F000A227 */  addiu      $2, $sp, 0xF0
/* 5EEE4 0015EDE4 28266072 */  paddub     $4, $19, $0
/* 5EEE8 0015EDE8 4E000524 */  addiu      $5, $0, 0x4E
/* 5EEEC 0015EDEC 000046DC */  ld         $6, 0x0($2)
/* 5EEF0 0015EDF0 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EEF4 0015EDF4 00000000 */   nop
/* 5EEF8 0015EDF8 FF00E332 */  andi       $3, $23, 0xFF
/* 5EEFC 0015EDFC FF00C233 */  andi       $2, $fp, 0xFF
/* 5EF00 0015EE00 38120200 */  dsll       $2, $2, 8
/* 5EF04 0015EE04 25186200 */  or         $3, $3, $2
/* 5EF08 0015EE08 0001A293 */  lbu        $2, 0x100($sp)
/* 5EF0C 0015EE0C 38140200 */  dsll       $2, $2, 16
/* 5EF10 0015EE10 25184300 */  or         $3, $2, $3
/* 5EF14 0015EE14 0801A293 */  lbu        $2, 0x108($sp)
/* 5EF18 0015EE18 38160200 */  dsll       $2, $2, 24
/* 5EF1C 0015EE1C 25184300 */  or         $3, $2, $3
/* 5EF20 0015EE20 FC00A227 */  addiu      $2, $sp, 0xFC
/* 5EF24 0015EE24 0000429C */  lwu        $2, 0x0($2)
/* 5EF28 0015EE28 3C100200 */  dsll32     $2, $2, 0
/* 5EF2C 0015EE2C 25304300 */  or         $6, $2, $3
/* 5EF30 0015EE30 28266072 */  paddub     $4, $19, $0
/* 5EF34 0015EE34 01000524 */  addiu      $5, $0, 0x1
/* 5EF38 0015EE38 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EF3C 0015EE3C 00000000 */   nop
/* 5EF40 0015EE40 28266072 */  paddub     $4, $19, $0
/* 5EF44 0015EE44 06000524 */  addiu      $5, $0, 0x6
/* 5EF48 0015EE48 2800C6DE */  ld         $6, 0x28($22)
/* 5EF4C 0015EE4C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EF50 0015EE50 00000000 */   nop
/* 5EF54 0015EE54 0400228E */  lw         $2, 0x4($17)
/* 5EF58 0015EE58 00110200 */  sll        $2, $2, 4
/* 5EF5C 0015EE5C 381C0200 */  dsll       $3, $2, 16
/* 5EF60 0015EE60 0000228E */  lw         $2, 0x0($17)
/* 5EF64 0015EE64 00110200 */  sll        $2, $2, 4
/* 5EF68 0015EE68 25304300 */  or         $6, $2, $3
/* 5EF6C 0015EE6C 28266072 */  paddub     $4, $19, $0
/* 5EF70 0015EE70 03000524 */  addiu      $5, $0, 0x3
/* 5EF74 0015EE74 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EF78 0015EE78 00000000 */   nop
/* 5EF7C 0015EE7C C000ACC7 */  lwc1       $f12, 0xC0($sp)
/* 5EF80 0015EE80 9039040C */  jal        __fixunssfdi
/* 5EF84 0015EE84 00000000 */   nop
/* 5EF88 0015EE88 28864070 */  paddub     $16, $2, $0
/* 5EF8C 0015EE8C D000ACC7 */  lwc1       $f12, 0xD0($sp)
/* 5EF90 0015EE90 9039040C */  jal        __fixunssfdi
/* 5EF94 0015EE94 00000000 */   nop
/* 5EF98 0015EE98 38140200 */  dsll       $2, $2, 16
/* 5EF9C 0015EE9C 25300202 */  or         $6, $16, $2
/* 5EFA0 0015EEA0 28266072 */  paddub     $4, $19, $0
/* 5EFA4 0015EEA4 04000524 */  addiu      $5, $0, 0x4
/* 5EFA8 0015EEA8 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EFAC 0015EEAC 00000000 */   nop
/* 5EFB0 0015EEB0 0400228E */  lw         $2, 0x4($17)
/* 5EFB4 0015EEB4 00110200 */  sll        $2, $2, 4
/* 5EFB8 0015EEB8 38240200 */  dsll       $4, $2, 16
/* 5EFBC 0015EEBC 0000238E */  lw         $3, 0x0($17)
/* 5EFC0 0015EEC0 0800428E */  lw         $2, 0x8($18)
/* 5EFC4 0015EEC4 21106200 */  addu       $2, $3, $2
/* 5EFC8 0015EEC8 00110200 */  sll        $2, $2, 4
/* 5EFCC 0015EECC 25308200 */  or         $6, $4, $2
/* 5EFD0 0015EED0 28266072 */  paddub     $4, $19, $0
/* 5EFD4 0015EED4 03000524 */  addiu      $5, $0, 0x3
/* 5EFD8 0015EED8 0A84040C */  jal        sceVif1PkAddGsAD
/* 5EFDC 0015EEDC 00000000 */   nop
/* 5EFE0 0015EEE0 C400A227 */  addiu      $2, $sp, 0xC4
/* 5EFE4 0015EEE4 00004CC4 */  lwc1       $f12, 0x0($2)
/* 5EFE8 0015EEE8 9039040C */  jal        __fixunssfdi
/* 5EFEC 0015EEEC 00000000 */   nop
/* 5EFF0 0015EEF0 28864070 */  paddub     $16, $2, $0
/* 5EFF4 0015EEF4 D400A227 */  addiu      $2, $sp, 0xD4
/* 5EFF8 0015EEF8 00004CC4 */  lwc1       $f12, 0x0($2)
/* 5EFFC 0015EEFC 9039040C */  jal        __fixunssfdi
/* 5F000 0015EF00 00000000 */   nop
/* 5F004 0015EF04 38140200 */  dsll       $2, $2, 16
/* 5F008 0015EF08 25300202 */  or         $6, $16, $2
/* 5F00C 0015EF0C 28266072 */  paddub     $4, $19, $0
/* 5F010 0015EF10 04000524 */  addiu      $5, $0, 0x4
/* 5F014 0015EF14 0A84040C */  jal        sceVif1PkAddGsAD
/* 5F018 0015EF18 00000000 */   nop
/* 5F01C 0015EF1C 0400238E */  lw         $3, 0x4($17)
/* 5F020 0015EF20 0C00228E */  lw         $2, 0xC($17)
/* 5F024 0015EF24 21106200 */  addu       $2, $3, $2
/* 5F028 0015EF28 00110200 */  sll        $2, $2, 4
/* 5F02C 0015EF2C 381C0200 */  dsll       $3, $2, 16
/* 5F030 0015EF30 0000228E */  lw         $2, 0x0($17)
/* 5F034 0015EF34 00110200 */  sll        $2, $2, 4
/* 5F038 0015EF38 25304300 */  or         $6, $2, $3
/* 5F03C 0015EF3C 28266072 */  paddub     $4, $19, $0
/* 5F040 0015EF40 03000524 */  addiu      $5, $0, 0x3
/* 5F044 0015EF44 0A84040C */  jal        sceVif1PkAddGsAD
/* 5F048 0015EF48 00000000 */   nop
/* 5F04C 0015EF4C C800A227 */  addiu      $2, $sp, 0xC8
/* 5F050 0015EF50 00004CC4 */  lwc1       $f12, 0x0($2)
/* 5F054 0015EF54 9039040C */  jal        __fixunssfdi
/* 5F058 0015EF58 00000000 */   nop
/* 5F05C 0015EF5C 28864070 */  paddub     $16, $2, $0
/* 5F060 0015EF60 D800A227 */  addiu      $2, $sp, 0xD8
/* 5F064 0015EF64 00004CC4 */  lwc1       $f12, 0x0($2)
/* 5F068 0015EF68 9039040C */  jal        __fixunssfdi
/* 5F06C 0015EF6C 00000000 */   nop
/* 5F070 0015EF70 38140200 */  dsll       $2, $2, 16
/* 5F074 0015EF74 25300202 */  or         $6, $16, $2
/* 5F078 0015EF78 28266072 */  paddub     $4, $19, $0
/* 5F07C 0015EF7C 04000524 */  addiu      $5, $0, 0x4
/* 5F080 0015EF80 0A84040C */  jal        sceVif1PkAddGsAD
/* 5F084 0015EF84 00000000 */   nop
/* 5F088 0015EF88 0400238E */  lw         $3, 0x4($17)
/* 5F08C 0015EF8C 0C00228E */  lw         $2, 0xC($17)
/* 5F090 0015EF90 21106200 */  addu       $2, $3, $2
/* 5F094 0015EF94 00110200 */  sll        $2, $2, 4
/* 5F098 0015EF98 38240200 */  dsll       $4, $2, 16
/* 5F09C 0015EF9C 0000238E */  lw         $3, 0x0($17)
/* 5F0A0 0015EFA0 0800228E */  lw         $2, 0x8($17)
/* 5F0A4 0015EFA4 21106200 */  addu       $2, $3, $2
/* 5F0A8 0015EFA8 00110200 */  sll        $2, $2, 4
/* 5F0AC 0015EFAC 25304400 */  or         $6, $2, $4
/* 5F0B0 0015EFB0 28266072 */  paddub     $4, $19, $0
/* 5F0B4 0015EFB4 03000524 */  addiu      $5, $0, 0x3
/* 5F0B8 0015EFB8 0A84040C */  jal        sceVif1PkAddGsAD
/* 5F0BC 0015EFBC 00000000 */   nop
/* 5F0C0 0015EFC0 CC00A227 */  addiu      $2, $sp, 0xCC
/* 5F0C4 0015EFC4 00004CC4 */  lwc1       $f12, 0x0($2)
/* 5F0C8 0015EFC8 9039040C */  jal        __fixunssfdi
/* 5F0CC 0015EFCC 00000000 */   nop
/* 5F0D0 0015EFD0 28864070 */  paddub     $16, $2, $0
/* 5F0D4 0015EFD4 DC00A227 */  addiu      $2, $sp, 0xDC
/* 5F0D8 0015EFD8 00004CC4 */  lwc1       $f12, 0x0($2)
/* 5F0DC 0015EFDC 9039040C */  jal        __fixunssfdi
/* 5F0E0 0015EFE0 00000000 */   nop
/* 5F0E4 0015EFE4 38140200 */  dsll       $2, $2, 16
/* 5F0E8 0015EFE8 25300202 */  or         $6, $16, $2
/* 5F0EC 0015EFEC 28266072 */  paddub     $4, $19, $0
/* 5F0F0 0015EFF0 04000524 */  addiu      $5, $0, 0x4
/* 5F0F4 0015EFF4 0A84040C */  jal        sceVif1PkAddGsAD
/* 5F0F8 0015EFF8 00000000 */   nop
/* 5F0FC 0015EFFC E88B8227 */  addiu      $2, $gp, -0x7418
/* 5F100 0015F000 28266072 */  paddub     $4, $19, $0
/* 5F104 0015F004 47000524 */  addiu      $5, $0, 0x47
/* 5F108 0015F008 000046DC */  ld         $6, 0x0($2)
/* 5F10C 0015F00C 0A84040C */  jal        sceVif1PkAddGsAD
/* 5F110 0015F010 00000000 */   nop
/* 5F114 0015F014 F08B8227 */  addiu      $2, $gp, -0x7410
/* 5F118 0015F018 28266072 */  paddub     $4, $19, $0
/* 5F11C 0015F01C 4E000524 */  addiu      $5, $0, 0x4E
/* 5F120 0015F020 000046DC */  ld         $6, 0x0($2)
/* 5F124 0015F024 0A84040C */  jal        sceVif1PkAddGsAD
/* 5F128 0015F028 00000000 */   nop
/* 5F12C 0015F02C 28266072 */  paddub     $4, $19, $0
/* 5F130 0015F030 B683040C */  jal        sceVif1PkCloseGifTag
/* 5F134 0015F034 00000000 */   nop
/* 5F138 0015F038 28266072 */  paddub     $4, $19, $0
/* 5F13C 0015F03C A483040C */  jal        sceVif1PkCloseDirectCode
/* 5F140 0015F040 00000000 */   nop
/* 5F144 0015F044 B000BF7B */  lq         $31, 0xB0($sp)
/* 5F148 0015F048 A000BE7B */  lq         $fp, 0xA0($sp)
/* 5F14C 0015F04C 9000B77B */  lq         $23, 0x90($sp)
/* 5F150 0015F050 8000B67B */  lq         $22, 0x80($sp)
/* 5F154 0015F054 7000B57B */  lq         $21, 0x70($sp)
/* 5F158 0015F058 6000B47B */  lq         $20, 0x60($sp)
/* 5F15C 0015F05C 5000B37B */  lq         $19, 0x50($sp)
/* 5F160 0015F060 4000B27B */  lq         $18, 0x40($sp)
/* 5F164 0015F064 3000B17B */  lq         $17, 0x30($sp)
/* 5F168 0015F068 2000B07B */  lq         $16, 0x20($sp)
/* 5F16C 0015F06C 1000B8C7 */  lwc1       $f24, 0x10($sp)
/* 5F170 0015F070 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* 5F174 0015F074 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 5F178 0015F078 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 5F17C 0015F07C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 5F180 0015F080 0001BD27 */  addiu      $sp, $sp, 0x100
/* 5F184 0015F084 0800E003 */  jr         $31
/* 5F188 0015F088 00000000 */   nop
/* 5F18C 0015F08C 00000000 */  nop
