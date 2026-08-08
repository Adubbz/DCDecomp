.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel set2DSpriteRot__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iifUcUcUcUc
/* 05EBD0 0015EAD0 00FFBD27 */  addiu       $29, $29, -0x100
/* 05EBD4 0015EAD4 B000BF7F */  sq          $31, 0xB0($29)
/* 05EBD8 0015EAD8 A000BE7F */  sq          $30, 0xA0($29)
/* 05EBDC 0015EADC 9000B77F */  sq          $23, 0x90($29)
/* 05EBE0 0015EAE0 8000B67F */  sq          $22, 0x80($29)
/* 05EBE4 0015EAE4 7000B57F */  sq          $21, 0x70($29)
/* 05EBE8 0015EAE8 6000B47F */  sq          $20, 0x60($29)
/* 05EBEC 0015EAEC 5000B37F */  sq          $19, 0x50($29)
/* 05EBF0 0015EAF0 4000B27F */  sq          $18, 0x40($29)
/* 05EBF4 0015EAF4 3000B17F */  sq          $17, 0x30($29)
/* 05EBF8 0015EAF8 2000B07F */  sq          $16, 0x20($29)
/* 05EBFC 0015EAFC 1000B8E7 */  swc1        $f24, 0x10($29)
/* 05EC00 0015EB00 0C00B7E7 */  swc1        $f23, 0xC($29)
/* 05EC04 0015EB04 0800B6E7 */  swc1        $f22, 0x8($29)
/* 05EC08 0015EB08 0400B5E7 */  swc1        $f21, 0x4($29)
/* 05EC0C 0015EB0C 0000B4E7 */  swc1        $f20, 0x0($29)
/* 05EC10 0015EB10 289E8070 */  paddub      $19, $4, $0
/* 05EC14 0015EB14 28B6A070 */  paddub      $22, $5, $0
/* 05EC18 0015EB18 2896C070 */  paddub      $18, $6, $0
/* 05EC1C 0015EB1C 288EE070 */  paddub      $17, $7, $0
/* 05EC20 0015EB20 28A60071 */  paddub      $20, $8, $0
/* 05EC24 0015EB24 28862071 */  paddub      $16, $9, $0
/* 05EC28 0015EB28 06650046 */  mov.s       $f20, $f12
/* 05EC2C 0015EB2C 28BE4071 */  paddub      $23, $10, $0
/* 05EC30 0015EB30 28F66071 */  paddub      $30, $11, $0
/* 05EC34 0015EB34 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 05EC38 0015EB38 FC00A2AF */  sw          $2, 0xFC($29)
/* 05EC3C 0015EB3C 282E0070 */  paddub      $5, $0, $0
/* 05EC40 0015EB40 2083040C */  jal         sceVif1PkCnt
/* 05EC44 0015EB44 00000000 */   nop
/* 05EC48 0015EB48 28266072 */  paddub      $4, $19, $0
/* 05EC4C 0015EB4C 282E0070 */  paddub      $5, $0, $0
/* 05EC50 0015EB50 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 05EC54 0015EB54 00000000 */   nop
/* 05EC58 0015EB58 C701023C */  lui         $2, %hi(GiftagAD)
/* 05EC5C 0015EB5C C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 05EC60 0015EB60 28266072 */  paddub      $4, $19, $0
/* 05EC64 0015EB64 00004578 */  lq          $5, 0x0($2)
/* 05EC68 0015EB68 B083040C */  jal         sceVif1PkOpenGifTag
/* 05EC6C 0015EB6C 00000000 */   nop
/* 05EC70 0015EB70 F886828F */  lw          $2, -0x7908($28)
/* 05EC74 0015EB74 78110200 */  dsll        $2, $2, 5
/* 05EC78 0015EB78 41004634 */  ori         $6, $2, 0x41
/* 05EC7C 0015EB7C 28266072 */  paddub      $4, $19, $0
/* 05EC80 0015EB80 14000524 */  addiu       $5, $0, 0x14
/* 05EC84 0015EB84 0A84040C */  jal         sceVif1PkAddGsAD
/* 05EC88 0015EB88 00000000 */   nop
/* 05EC8C 0015EB8C 28266072 */  paddub      $4, $19, $0
/* 05EC90 0015EB90 282E0070 */  paddub      $5, $0, $0
/* 05EC94 0015EB94 D4010624 */  addiu       $6, $0, 0x1D4
/* 05EC98 0015EB98 0A84040C */  jal         sceVif1PkAddGsAD
/* 05EC9C 0015EB9C 00000000 */   nop
/* 05ECA0 0015EBA0 E800A327 */  addiu       $3, $29, 0xE8
/* 05ECA4 0015EBA4 E88B82DF */  ld          $2, -0x7418($28)
/* 05ECA8 0015EBA8 000062FC */  sd          $2, 0x0($3)
/* 05ECAC 0015EBAC E800A493 */  lbu         $4, 0xE8($29)
/* 05ECB0 0015EBB0 01000530 */  andi        $5, $0, 0x1
/* 05ECB4 0015EBB4 FEFF0224 */  addiu       $2, $0, -0x2
/* 05ECB8 0015EBB8 24208200 */  and         $4, $4, $2
/* 05ECBC 0015EBBC 25208500 */  or          $4, $4, $5
/* 05ECC0 0015EBC0 E800A4A3 */  sb          $4, 0xE8($29)
/* 05ECC4 0015EBC4 E800A697 */  lhu         $6, 0xE8($29)
/* 05ECC8 0015EBC8 FF000430 */  andi        $4, $0, 0xFF
/* 05ECCC 0015EBCC 00290400 */  sll         $5, $4, 4
/* 05ECD0 0015EBD0 0FF00424 */  addiu       $4, $0, -0xFF1
/* 05ECD4 0015EBD4 2420C400 */  and         $4, $6, $4
/* 05ECD8 0015EBD8 25208500 */  or          $4, $4, $5
/* 05ECDC 0015EBDC E800A4A7 */  sh          $4, 0xE8($29)
/* 05ECE0 0015EBE0 E800A593 */  lbu         $5, 0xE8($29)
/* 05ECE4 0015EBE4 02000664 */  daddiu      $6, $0, 0x2
/* 05ECE8 0015EBE8 F1FF0424 */  addiu       $4, $0, -0xF
/* 05ECEC 0015EBEC 2420A400 */  and         $4, $5, $4
/* 05ECF0 0015EBF0 25208600 */  or          $4, $4, $6
/* 05ECF4 0015EBF4 E800A4A3 */  sb          $4, 0xE8($29)
/* 05ECF8 0015EBF8 EA00A727 */  addiu       $7, $29, 0xEA
/* 05ECFC 0015EBFC 0000E590 */  lbu         $5, 0x0($7)
/* 05ED00 0015EC00 01000464 */  daddiu      $4, $0, 0x1
/* 05ED04 0015EC04 2410A200 */  and         $2, $5, $2
/* 05ED08 0015EC08 25104400 */  or          $2, $2, $4
/* 05ED0C 0015EC0C 0000E2A0 */  sb          $2, 0x0($7)
/* 05ED10 0015EC10 0000E490 */  lbu         $4, 0x0($7)
/* 05ED14 0015EC14 F9FF0224 */  addiu       $2, $0, -0x7
/* 05ED18 0015EC18 24108200 */  and         $2, $4, $2
/* 05ED1C 0015EC1C 25104600 */  or          $2, $2, $6
/* 05ED20 0015EC20 0000E2A0 */  sb          $2, 0x0($7)
/* 05ED24 0015EC24 28266072 */  paddub      $4, $19, $0
/* 05ED28 0015EC28 47000524 */  addiu       $5, $0, 0x47
/* 05ED2C 0015EC2C 000066DC */  ld          $6, 0x0($3)
/* 05ED30 0015EC30 0A84040C */  jal         sceVif1PkAddGsAD
/* 05ED34 0015EC34 00000000 */   nop
/* 05ED38 0015EC38 F000A327 */  addiu       $3, $29, 0xF0
/* 05ED3C 0015EC3C F08B82DF */  ld          $2, -0x7410($28)
/* 05ED40 0015EC40 000062FC */  sd          $2, 0x0($3)
/* 05ED44 0015EC44 F400A493 */  lbu         $4, 0xF4($29)
/* 05ED48 0015EC48 01000364 */  daddiu      $3, $0, 0x1
/* 05ED4C 0015EC4C FEFF0224 */  addiu       $2, $0, -0x2
/* 05ED50 0015EC50 24108200 */  and         $2, $4, $2
/* 05ED54 0015EC54 25104300 */  or          $2, $2, $3
/* 05ED58 0015EC58 F400A2A3 */  sb          $2, 0xF4($29)
/* 05ED5C 0015EC5C 23101400 */  negu        $2, $20
/* 05ED60 0015EC60 00110200 */  sll         $2, $2, 4
/* 05ED64 0015EC64 00008244 */  mtc1        $2, $f0
/* 05ED68 0015EC68 00000000 */  nop
/* 05ED6C 0015EC6C 20008046 */  cvt.s.w     $f0, $f0
/* 05ED70 0015EC70 C800A227 */  addiu       $2, $29, 0xC8
/* 05ED74 0015EC74 000040E4 */  swc1        $f0, 0x0($2)
/* 05ED78 0015EC78 C000A0E7 */  swc1        $f0, 0xC0($29)
/* 05ED7C 0015EC7C 0800428E */  lw          $2, 0x8($18)
/* 05ED80 0015EC80 23105400 */  subu        $2, $2, $20
/* 05ED84 0015EC84 00110200 */  sll         $2, $2, 4
/* 05ED88 0015EC88 FFFF4224 */  addiu       $2, $2, -0x1
/* 05ED8C 0015EC8C 00008244 */  mtc1        $2, $f0
/* 05ED90 0015EC90 00000000 */  nop
/* 05ED94 0015EC94 20008046 */  cvt.s.w     $f0, $f0
/* 05ED98 0015EC98 CC00A227 */  addiu       $2, $29, 0xCC
/* 05ED9C 0015EC9C 000040E4 */  swc1        $f0, 0x0($2)
/* 05EDA0 0015ECA0 C400A227 */  addiu       $2, $29, 0xC4
/* 05EDA4 0015ECA4 000040E4 */  swc1        $f0, 0x0($2)
/* 05EDA8 0015ECA8 23101000 */  negu        $2, $16
/* 05EDAC 0015ECAC 00110200 */  sll         $2, $2, 4
/* 05EDB0 0015ECB0 00008244 */  mtc1        $2, $f0
/* 05EDB4 0015ECB4 00000000 */  nop
/* 05EDB8 0015ECB8 20008046 */  cvt.s.w     $f0, $f0
/* 05EDBC 0015ECBC D400A227 */  addiu       $2, $29, 0xD4
/* 05EDC0 0015ECC0 000040E4 */  swc1        $f0, 0x0($2)
/* 05EDC4 0015ECC4 D000A0E7 */  swc1        $f0, 0xD0($29)
/* 05EDC8 0015ECC8 0C00428E */  lw          $2, 0xC($18)
/* 05EDCC 0015ECCC 23105000 */  subu        $2, $2, $16
/* 05EDD0 0015ECD0 00110200 */  sll         $2, $2, 4
/* 05EDD4 0015ECD4 FFFF4224 */  addiu       $2, $2, -0x1
/* 05EDD8 0015ECD8 00008244 */  mtc1        $2, $f0
/* 05EDDC 0015ECDC 00000000 */  nop
/* 05EDE0 0015ECE0 20008046 */  cvt.s.w     $f0, $f0
/* 05EDE4 0015ECE4 DC00A227 */  addiu       $2, $29, 0xDC
/* 05EDE8 0015ECE8 000040E4 */  swc1        $f0, 0x0($2)
/* 05EDEC 0015ECEC D800A227 */  addiu       $2, $29, 0xD8
/* 05EDF0 0015ECF0 000040E4 */  swc1        $f0, 0x0($2)
/* 05EDF4 0015ECF4 28AE0070 */  paddub      $21, $0, $0
/* 05EDF8 0015ECF8 36000010 */  b           .L0015EDD4
/* 05EDFC 0015ECFC 00000000 */   nop
.L0015ED00:
/* 05EE00 0015ED00 80A01500 */  sll         $20, $21, 2
/* 05EE04 0015ED04 06A30046 */  mov.s       $f12, $f20
/* 05EE08 0015ED08 2876040C */  jal         sinf
/* 05EE0C 0015ED0C 00000000 */   nop
/* 05EE10 0015ED10 21109D02 */  addu        $2, $20, $29
/* 05EE14 0015ED14 D0005024 */  addiu       $16, $2, 0xD0
/* 05EE18 0015ED18 000017C6 */  lwc1        $f23, 0x0($16)
/* 05EE1C 0015ED1C 47B80046 */  neg.s       $f1, $f23
/* 05EE20 0015ED20 420D0046 */  mul.s       $f21, $f1, $f0
/* 05EE24 0015ED24 06A30046 */  mov.s       $f12, $f20
/* 05EE28 0015ED28 AC75040C */  jal         cosf
/* 05EE2C 0015ED2C 00000000 */   nop
/* 05EE30 0015ED30 21109D02 */  addu        $2, $20, $29
/* 05EE34 0015ED34 C0005424 */  addiu       $20, $2, 0xC0
/* 05EE38 0015ED38 000098C6 */  lwc1        $f24, 0x0($20)
/* 05EE3C 0015ED3C 02C00046 */  mul.s       $f0, $f24, $f0
/* 05EE40 0015ED40 81AD0046 */  sub.s       $f22, $f21, $f0
/* 05EE44 0015ED44 06A30046 */  mov.s       $f12, $f20
/* 05EE48 0015ED48 2876040C */  jal         sinf
/* 05EE4C 0015ED4C 00000000 */   nop
/* 05EE50 0015ED50 47C00046 */  neg.s       $f1, $f24
/* 05EE54 0015ED54 420D0046 */  mul.s       $f21, $f1, $f0
/* 05EE58 0015ED58 06A30046 */  mov.s       $f12, $f20
/* 05EE5C 0015ED5C AC75040C */  jal         cosf
/* 05EE60 0015ED60 00000000 */   nop
/* 05EE64 0015ED64 02B80046 */  mul.s       $f0, $f23, $f0
/* 05EE68 0015ED68 40AD0046 */  add.s       $f21, $f21, $f0
/* 05EE6C 0015ED6C 06B30046 */  mov.s       $f12, $f22
/* 05EE70 0015ED70 2C44040C */  jal         fptosi
/* 05EE74 0015ED74 00000000 */   nop
/* 05EE78 0015ED78 0000438E */  lw          $3, 0x0($18)
/* 05EE7C 0015ED7C 00190300 */  sll         $3, $3, 4
/* 05EE80 0015ED80 21104300 */  addu        $2, $2, $3
/* 05EE84 0015ED84 006C4224 */  addiu       $2, $2, 0x6C00
/* 05EE88 0015ED88 00008244 */  mtc1        $2, $f0
/* 05EE8C 0015ED8C 00000000 */  nop
/* 05EE90 0015ED90 20008046 */  cvt.s.w     $f0, $f0
/* 05EE94 0015ED94 000080E6 */  swc1        $f0, 0x0($20)
/* 05EE98 0015ED98 0400428E */  lw          $2, 0x4($18)
/* 05EE9C 0015ED9C C0A00200 */  sll         $20, $2, 3
/* 05EEA0 0015EDA0 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 05EEA4 0015EDA4 00008244 */  mtc1        $2, $f0
/* 05EEA8 0015EDA8 00000000 */  nop
/* 05EEAC 0015EDAC 02031546 */  mul.s       $f12, $f0, $f21
/* 05EEB0 0015EDB0 2C44040C */  jal         fptosi
/* 05EEB4 0015EDB4 00000000 */   nop
/* 05EEB8 0015EDB8 21105400 */  addu        $2, $2, $20
/* 05EEBC 0015EDBC 00794224 */  addiu       $2, $2, 0x7900
/* 05EEC0 0015EDC0 00008244 */  mtc1        $2, $f0
/* 05EEC4 0015EDC4 00000000 */  nop
/* 05EEC8 0015EDC8 20008046 */  cvt.s.w     $f0, $f0
/* 05EECC 0015EDCC 000000E6 */  swc1        $f0, 0x0($16)
/* 05EED0 0015EDD0 0100B526 */  addiu       $21, $21, 0x1
.L0015EDD4:
/* 05EED4 0015EDD4 0400A22A */  slti        $2, $21, 0x4
/* 05EED8 0015EDD8 C9FF4014 */  bnez        $2, .L0015ED00
/* 05EEDC 0015EDDC 00000000 */   nop
/* 05EEE0 0015EDE0 F000A227 */  addiu       $2, $29, 0xF0
/* 05EEE4 0015EDE4 28266072 */  paddub      $4, $19, $0
/* 05EEE8 0015EDE8 4E000524 */  addiu       $5, $0, 0x4E
/* 05EEEC 0015EDEC 000046DC */  ld          $6, 0x0($2)
/* 05EEF0 0015EDF0 0A84040C */  jal         sceVif1PkAddGsAD
/* 05EEF4 0015EDF4 00000000 */   nop
/* 05EEF8 0015EDF8 FF00E332 */  andi        $3, $23, 0xFF
/* 05EEFC 0015EDFC FF00C233 */  andi        $2, $30, 0xFF
/* 05EF00 0015EE00 38120200 */  dsll        $2, $2, 8
/* 05EF04 0015EE04 25186200 */  or          $3, $3, $2
/* 05EF08 0015EE08 0001A293 */  lbu         $2, 0x100($29)
/* 05EF0C 0015EE0C 38140200 */  dsll        $2, $2, 16
/* 05EF10 0015EE10 25184300 */  or          $3, $2, $3
/* 05EF14 0015EE14 0801A293 */  lbu         $2, 0x108($29)
/* 05EF18 0015EE18 38160200 */  dsll        $2, $2, 24
/* 05EF1C 0015EE1C 25184300 */  or          $3, $2, $3
/* 05EF20 0015EE20 FC00A227 */  addiu       $2, $29, 0xFC
/* 05EF24 0015EE24 0000429C */  lwu         $2, 0x0($2)
/* 05EF28 0015EE28 3C100200 */  dsll32      $2, $2, 0
/* 05EF2C 0015EE2C 25304300 */  or          $6, $2, $3
/* 05EF30 0015EE30 28266072 */  paddub      $4, $19, $0
/* 05EF34 0015EE34 01000524 */  addiu       $5, $0, 0x1
/* 05EF38 0015EE38 0A84040C */  jal         sceVif1PkAddGsAD
/* 05EF3C 0015EE3C 00000000 */   nop
/* 05EF40 0015EE40 28266072 */  paddub      $4, $19, $0
/* 05EF44 0015EE44 06000524 */  addiu       $5, $0, 0x6
/* 05EF48 0015EE48 2800C6DE */  ld          $6, 0x28($22)
/* 05EF4C 0015EE4C 0A84040C */  jal         sceVif1PkAddGsAD
/* 05EF50 0015EE50 00000000 */   nop
/* 05EF54 0015EE54 0400228E */  lw          $2, 0x4($17)
/* 05EF58 0015EE58 00110200 */  sll         $2, $2, 4
/* 05EF5C 0015EE5C 381C0200 */  dsll        $3, $2, 16
/* 05EF60 0015EE60 0000228E */  lw          $2, 0x0($17)
/* 05EF64 0015EE64 00110200 */  sll         $2, $2, 4
/* 05EF68 0015EE68 25304300 */  or          $6, $2, $3
/* 05EF6C 0015EE6C 28266072 */  paddub      $4, $19, $0
/* 05EF70 0015EE70 03000524 */  addiu       $5, $0, 0x3
/* 05EF74 0015EE74 0A84040C */  jal         sceVif1PkAddGsAD
/* 05EF78 0015EE78 00000000 */   nop
/* 05EF7C 0015EE7C C000ACC7 */  lwc1        $f12, 0xC0($29)
/* 05EF80 0015EE80 9039040C */  jal         __fixunssfdi
/* 05EF84 0015EE84 00000000 */   nop
/* 05EF88 0015EE88 28864070 */  paddub      $16, $2, $0
/* 05EF8C 0015EE8C D000ACC7 */  lwc1        $f12, 0xD0($29)
/* 05EF90 0015EE90 9039040C */  jal         __fixunssfdi
/* 05EF94 0015EE94 00000000 */   nop
/* 05EF98 0015EE98 38140200 */  dsll        $2, $2, 16
/* 05EF9C 0015EE9C 25300202 */  or          $6, $16, $2
/* 05EFA0 0015EEA0 28266072 */  paddub      $4, $19, $0
/* 05EFA4 0015EEA4 04000524 */  addiu       $5, $0, 0x4
/* 05EFA8 0015EEA8 0A84040C */  jal         sceVif1PkAddGsAD
/* 05EFAC 0015EEAC 00000000 */   nop
/* 05EFB0 0015EEB0 0400228E */  lw          $2, 0x4($17)
/* 05EFB4 0015EEB4 00110200 */  sll         $2, $2, 4
/* 05EFB8 0015EEB8 38240200 */  dsll        $4, $2, 16
/* 05EFBC 0015EEBC 0000238E */  lw          $3, 0x0($17)
/* 05EFC0 0015EEC0 0800428E */  lw          $2, 0x8($18)
/* 05EFC4 0015EEC4 21106200 */  addu        $2, $3, $2
/* 05EFC8 0015EEC8 00110200 */  sll         $2, $2, 4
/* 05EFCC 0015EECC 25308200 */  or          $6, $4, $2
/* 05EFD0 0015EED0 28266072 */  paddub      $4, $19, $0
/* 05EFD4 0015EED4 03000524 */  addiu       $5, $0, 0x3
/* 05EFD8 0015EED8 0A84040C */  jal         sceVif1PkAddGsAD
/* 05EFDC 0015EEDC 00000000 */   nop
/* 05EFE0 0015EEE0 C400A227 */  addiu       $2, $29, 0xC4
/* 05EFE4 0015EEE4 00004CC4 */  lwc1        $f12, 0x0($2)
/* 05EFE8 0015EEE8 9039040C */  jal         __fixunssfdi
/* 05EFEC 0015EEEC 00000000 */   nop
/* 05EFF0 0015EEF0 28864070 */  paddub      $16, $2, $0
/* 05EFF4 0015EEF4 D400A227 */  addiu       $2, $29, 0xD4
/* 05EFF8 0015EEF8 00004CC4 */  lwc1        $f12, 0x0($2)
/* 05EFFC 0015EEFC 9039040C */  jal         __fixunssfdi
/* 05F000 0015EF00 00000000 */   nop
/* 05F004 0015EF04 38140200 */  dsll        $2, $2, 16
/* 05F008 0015EF08 25300202 */  or          $6, $16, $2
/* 05F00C 0015EF0C 28266072 */  paddub      $4, $19, $0
/* 05F010 0015EF10 04000524 */  addiu       $5, $0, 0x4
/* 05F014 0015EF14 0A84040C */  jal         sceVif1PkAddGsAD
/* 05F018 0015EF18 00000000 */   nop
/* 05F01C 0015EF1C 0400238E */  lw          $3, 0x4($17)
/* 05F020 0015EF20 0C00228E */  lw          $2, 0xC($17)
/* 05F024 0015EF24 21106200 */  addu        $2, $3, $2
/* 05F028 0015EF28 00110200 */  sll         $2, $2, 4
/* 05F02C 0015EF2C 381C0200 */  dsll        $3, $2, 16
/* 05F030 0015EF30 0000228E */  lw          $2, 0x0($17)
/* 05F034 0015EF34 00110200 */  sll         $2, $2, 4
/* 05F038 0015EF38 25304300 */  or          $6, $2, $3
/* 05F03C 0015EF3C 28266072 */  paddub      $4, $19, $0
/* 05F040 0015EF40 03000524 */  addiu       $5, $0, 0x3
/* 05F044 0015EF44 0A84040C */  jal         sceVif1PkAddGsAD
/* 05F048 0015EF48 00000000 */   nop
/* 05F04C 0015EF4C C800A227 */  addiu       $2, $29, 0xC8
/* 05F050 0015EF50 00004CC4 */  lwc1        $f12, 0x0($2)
/* 05F054 0015EF54 9039040C */  jal         __fixunssfdi
/* 05F058 0015EF58 00000000 */   nop
/* 05F05C 0015EF5C 28864070 */  paddub      $16, $2, $0
/* 05F060 0015EF60 D800A227 */  addiu       $2, $29, 0xD8
/* 05F064 0015EF64 00004CC4 */  lwc1        $f12, 0x0($2)
/* 05F068 0015EF68 9039040C */  jal         __fixunssfdi
/* 05F06C 0015EF6C 00000000 */   nop
/* 05F070 0015EF70 38140200 */  dsll        $2, $2, 16
/* 05F074 0015EF74 25300202 */  or          $6, $16, $2
/* 05F078 0015EF78 28266072 */  paddub      $4, $19, $0
/* 05F07C 0015EF7C 04000524 */  addiu       $5, $0, 0x4
/* 05F080 0015EF80 0A84040C */  jal         sceVif1PkAddGsAD
/* 05F084 0015EF84 00000000 */   nop
/* 05F088 0015EF88 0400238E */  lw          $3, 0x4($17)
/* 05F08C 0015EF8C 0C00228E */  lw          $2, 0xC($17)
/* 05F090 0015EF90 21106200 */  addu        $2, $3, $2
/* 05F094 0015EF94 00110200 */  sll         $2, $2, 4
/* 05F098 0015EF98 38240200 */  dsll        $4, $2, 16
/* 05F09C 0015EF9C 0000238E */  lw          $3, 0x0($17)
/* 05F0A0 0015EFA0 0800228E */  lw          $2, 0x8($17)
/* 05F0A4 0015EFA4 21106200 */  addu        $2, $3, $2
/* 05F0A8 0015EFA8 00110200 */  sll         $2, $2, 4
/* 05F0AC 0015EFAC 25304400 */  or          $6, $2, $4
/* 05F0B0 0015EFB0 28266072 */  paddub      $4, $19, $0
/* 05F0B4 0015EFB4 03000524 */  addiu       $5, $0, 0x3
/* 05F0B8 0015EFB8 0A84040C */  jal         sceVif1PkAddGsAD
/* 05F0BC 0015EFBC 00000000 */   nop
/* 05F0C0 0015EFC0 CC00A227 */  addiu       $2, $29, 0xCC
/* 05F0C4 0015EFC4 00004CC4 */  lwc1        $f12, 0x0($2)
/* 05F0C8 0015EFC8 9039040C */  jal         __fixunssfdi
/* 05F0CC 0015EFCC 00000000 */   nop
/* 05F0D0 0015EFD0 28864070 */  paddub      $16, $2, $0
/* 05F0D4 0015EFD4 DC00A227 */  addiu       $2, $29, 0xDC
/* 05F0D8 0015EFD8 00004CC4 */  lwc1        $f12, 0x0($2)
/* 05F0DC 0015EFDC 9039040C */  jal         __fixunssfdi
/* 05F0E0 0015EFE0 00000000 */   nop
/* 05F0E4 0015EFE4 38140200 */  dsll        $2, $2, 16
/* 05F0E8 0015EFE8 25300202 */  or          $6, $16, $2
/* 05F0EC 0015EFEC 28266072 */  paddub      $4, $19, $0
/* 05F0F0 0015EFF0 04000524 */  addiu       $5, $0, 0x4
/* 05F0F4 0015EFF4 0A84040C */  jal         sceVif1PkAddGsAD
/* 05F0F8 0015EFF8 00000000 */   nop
/* 05F0FC 0015EFFC E88B8227 */  addiu       $2, $28, -0x7418
/* 05F100 0015F000 28266072 */  paddub      $4, $19, $0
/* 05F104 0015F004 47000524 */  addiu       $5, $0, 0x47
/* 05F108 0015F008 000046DC */  ld          $6, 0x0($2)
/* 05F10C 0015F00C 0A84040C */  jal         sceVif1PkAddGsAD
/* 05F110 0015F010 00000000 */   nop
/* 05F114 0015F014 F08B8227 */  addiu       $2, $28, -0x7410
/* 05F118 0015F018 28266072 */  paddub      $4, $19, $0
/* 05F11C 0015F01C 4E000524 */  addiu       $5, $0, 0x4E
/* 05F120 0015F020 000046DC */  ld          $6, 0x0($2)
/* 05F124 0015F024 0A84040C */  jal         sceVif1PkAddGsAD
/* 05F128 0015F028 00000000 */   nop
/* 05F12C 0015F02C 28266072 */  paddub      $4, $19, $0
/* 05F130 0015F030 B683040C */  jal         sceVif1PkCloseGifTag
/* 05F134 0015F034 00000000 */   nop
/* 05F138 0015F038 28266072 */  paddub      $4, $19, $0
/* 05F13C 0015F03C A483040C */  jal         sceVif1PkCloseDirectCode
/* 05F140 0015F040 00000000 */   nop
/* 05F144 0015F044 B000BF7B */  lq          $31, 0xB0($29)
/* 05F148 0015F048 A000BE7B */  lq          $30, 0xA0($29)
/* 05F14C 0015F04C 9000B77B */  lq          $23, 0x90($29)
/* 05F150 0015F050 8000B67B */  lq          $22, 0x80($29)
/* 05F154 0015F054 7000B57B */  lq          $21, 0x70($29)
/* 05F158 0015F058 6000B47B */  lq          $20, 0x60($29)
/* 05F15C 0015F05C 5000B37B */  lq          $19, 0x50($29)
/* 05F160 0015F060 4000B27B */  lq          $18, 0x40($29)
/* 05F164 0015F064 3000B17B */  lq          $17, 0x30($29)
/* 05F168 0015F068 2000B07B */  lq          $16, 0x20($29)
/* 05F16C 0015F06C 1000B8C7 */  lwc1        $f24, 0x10($29)
/* 05F170 0015F070 0C00B7C7 */  lwc1        $f23, 0xC($29)
/* 05F174 0015F074 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 05F178 0015F078 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 05F17C 0015F07C 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 05F180 0015F080 0001BD27 */  addiu       $29, $29, 0x100
/* 05F184 0015F084 0800E003 */  jr          $31
/* 05F188 0015F088 00000000 */   nop
/* 05F18C 0015F08C 00000000 */  nop
