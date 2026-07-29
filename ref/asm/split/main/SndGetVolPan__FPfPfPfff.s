.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndGetVolPan__FPfPfPfff
/* 05AD00 0015AC00 80FFBD27 */  addiu       $29, $29, -0x80
/* 05AD04 0015AC04 5000BF7F */  sq          $31, 0x50($29)
/* 05AD08 0015AC08 4000B37F */  sq          $19, 0x40($29)
/* 05AD0C 0015AC0C 3000B27F */  sq          $18, 0x30($29)
/* 05AD10 0015AC10 2000B17F */  sq          $17, 0x20($29)
/* 05AD14 0015AC14 1000B07F */  sq          $16, 0x10($29)
/* 05AD18 0015AC18 0400B5E7 */  swc1        $f21, 0x4($29)
/* 05AD1C 0015AC1C 0000B4E7 */  swc1        $f20, 0x0($29)
/* 05AD20 0015AC20 28968070 */  paddub      $18, $4, $0
/* 05AD24 0015AC24 288EA070 */  paddub      $17, $5, $0
/* 05AD28 0015AC28 2886C070 */  paddub      $16, $6, $0
/* 05AD2C 0015AC2C 46650046 */  mov.s       $f21, $f12
/* 05AD30 0015AC30 066D0046 */  mov.s       $f20, $f13
/* 05AD34 0015AC34 28260072 */  paddub      $4, $16, $0
/* 05AD38 0015AC38 D001023C */  lui         $2, %hi(camera_pos)
/* 05AD3C 0015AC3C 10B54524 */  addiu       $5, $2, %lo(camera_pos)
/* 05AD40 0015AC40 648D040C */  jal         DistVector__FPfPf
/* 05AD44 0015AC44 00000000 */   nop
/* 05AD48 0015AC48 81001546 */  sub.s       $f2, $f0, $f21
/* 05AD4C 0015AC4C 41A01546 */  sub.s       $f1, $f20, $f21
/* 05AD50 0015AC50 83100146 */  div.s       $f2, $f2, $f1
/* 05AD54 0015AC54 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 05AD58 0015AC58 00088244 */  mtc1        $2, $f1
/* 05AD5C 0015AC5C 00000000 */  nop
/* 05AD60 0015AC60 41080246 */  sub.s       $f1, $f1, $f2
/* 05AD64 0015AC64 36001446 */  c.le.s      $f0, $f20
/* 05AD68 0015AC68 00000000 */  nop
/* 05AD6C 0015AC6C 02000145 */  bc1t        .L0015AC78
/* 05AD70 0015AC70 00000000 */   nop
/* 05AD74 0015AC74 00088044 */  mtc1        $0, $f1
.L0015AC78:
/* 05AD78 0015AC78 34001546 */  c.lt.s      $f0, $f21
/* 05AD7C 0015AC7C 00000000 */  nop
/* 05AD80 0015AC80 03000045 */  bc1f        .L0015AC90
/* 05AD84 0015AC84 00000000 */   nop
/* 05AD88 0015AC88 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 05AD8C 0015AC8C 00088244 */  mtc1        $2, $f1
.L0015AC90:
/* 05AD90 0015AC90 000041E6 */  swc1        $f1, 0x0($18)
/* 05AD94 0015AC94 000020AE */  sw          $0, 0x0($17)
/* 05AD98 0015AC98 6000A427 */  addiu       $4, $29, 0x60
/* 05AD9C 0015AC9C D001023C */  lui         $2, %hi(camera_dir)
/* 05ADA0 0015ACA0 20B54524 */  addiu       $5, $2, %lo(camera_dir)
/* 05ADA4 0015ACA4 0C86040C */  jal         sceVu0CopyVector
/* 05ADA8 0015ACA8 00000000 */   nop
/* 05ADAC 0015ACAC 6400B327 */  addiu       $19, $29, 0x64
/* 05ADB0 0015ACB0 000060AE */  sw          $0, 0x0($19)
/* 05ADB4 0015ACB4 6000A427 */  addiu       $4, $29, 0x60
/* 05ADB8 0015ACB8 282E8070 */  paddub      $5, $4, $0
/* 05ADBC 0015ACBC 9285040C */  jal         sceVu0Normalize
/* 05ADC0 0015ACC0 00000000 */   nop
/* 05ADC4 0015ACC4 6800A0C7 */  lwc1        $f0, 0x68($29)
/* 05ADC8 0015ACC8 7000A0E7 */  swc1        $f0, 0x70($29)
/* 05ADCC 0015ACCC 7400A0AF */  sw          $0, 0x74($29)
/* 05ADD0 0015ACD0 6000A0C7 */  lwc1        $f0, 0x60($29)
/* 05ADD4 0015ACD4 07000046 */  neg.s       $f0, $f0
/* 05ADD8 0015ACD8 7800A0E7 */  swc1        $f0, 0x78($29)
/* 05ADDC 0015ACDC 6000A427 */  addiu       $4, $29, 0x60
/* 05ADE0 0015ACE0 282E0072 */  paddub      $5, $16, $0
/* 05ADE4 0015ACE4 D001023C */  lui         $2, %hi(camera_pos)
/* 05ADE8 0015ACE8 10B54624 */  addiu       $6, $2, %lo(camera_pos)
/* 05ADEC 0015ACEC EE85040C */  jal         sceVu0SubVector
/* 05ADF0 0015ACF0 00000000 */   nop
/* 05ADF4 0015ACF4 000060AE */  sw          $0, 0x0($19)
/* 05ADF8 0015ACF8 6000A427 */  addiu       $4, $29, 0x60
/* 05ADFC 0015ACFC 282E8070 */  paddub      $5, $4, $0
/* 05AE00 0015AD00 9285040C */  jal         sceVu0Normalize
/* 05AE04 0015AD04 00000000 */   nop
/* 05AE08 0015AD08 6000A427 */  addiu       $4, $29, 0x60
/* 05AE0C 0015AD0C 7000A527 */  addiu       $5, $29, 0x70
/* 05AE10 0015AD10 8885040C */  jal         sceVu0InnerProduct
/* 05AE14 0015AD14 00000000 */   nop
/* 05AE18 0015AD18 47000046 */  neg.s       $f1, $f0
/* 05AE1C 0015AD1C 01000324 */  addiu       $3, $0, 0x1
/* 05AE20 0015AD20 00008044 */  mtc1        $0, $f0
/* 05AE24 0015AD24 00000000 */  nop
/* 05AE28 0015AD28 34080046 */  c.lt.s      $f1, $f0
/* 05AE2C 0015AD2C 00000000 */  nop
/* 05AE30 0015AD30 02000045 */  bc1f        .L0015AD3C
/* 05AE34 0015AD34 00000000 */   nop
/* 05AE38 0015AD38 FFFF0324 */  addiu       $3, $0, -0x1
.L0015AD3C:
/* 05AE3C 0015AD3C 00008044 */  mtc1        $0, $f0
/* 05AE40 0015AD40 00000000 */  nop
/* 05AE44 0015AD44 34080046 */  c.lt.s      $f1, $f0
/* 05AE48 0015AD48 00000000 */  nop
/* 05AE4C 0015AD4C 04000045 */  bc1f        .L0015AD60
/* 05AE50 0015AD50 00000000 */   nop
/* 05AE54 0015AD54 47080046 */  neg.s       $f1, $f1
/* 05AE58 0015AD58 01000010 */  b           .L0015AD60
/* 05AE5C 0015AD5C 00000000 */   nop
.L0015AD60:
/* 05AE60 0015AD60 42080146 */  mul.s       $f1, $f1, $f1
/* 05AE64 0015AD64 42080146 */  mul.s       $f1, $f1, $f1
/* 05AE68 0015AD68 00008344 */  mtc1        $3, $f0
/* 05AE6C 0015AD6C 00000000 */  nop
/* 05AE70 0015AD70 20008046 */  cvt.s.w     $f0, $f0
/* 05AE74 0015AD74 42000146 */  mul.s       $f1, $f0, $f1
/* 05AE78 0015AD78 D48080C7 */  lwc1        $f0, -0x7F2C($28)
/* 05AE7C 0015AD7C 42000146 */  mul.s       $f1, $f0, $f1
/* 05AE80 0015AD80 000021E6 */  swc1        $f1, 0x0($17)
/* 05AE84 0015AD84 00008044 */  mtc1        $0, $f0
/* 05AE88 0015AD88 00000000 */  nop
/* 05AE8C 0015AD8C 34080046 */  c.lt.s      $f1, $f0
/* 05AE90 0015AD90 00000000 */  nop
/* 05AE94 0015AD94 04000045 */  bc1f        .L0015ADA8
/* 05AE98 0015AD98 00000000 */   nop
/* 05AE9C 0015AD9C 47080046 */  neg.s       $f1, $f1
/* 05AEA0 0015ADA0 01000010 */  b           .L0015ADA8
/* 05AEA4 0015ADA4 00000000 */   nop
.L0015ADA8:
/* 05AEA8 0015ADA8 7C8080C7 */  lwc1        $f0, -0x7F84($28)
/* 05AEAC 0015ADAC 42000146 */  mul.s       $f1, $f0, $f1
/* 05AEB0 0015ADB0 D48080C7 */  lwc1        $f0, -0x7F2C($28)
/* 05AEB4 0015ADB4 40000146 */  add.s       $f1, $f0, $f1
/* 05AEB8 0015ADB8 000040C6 */  lwc1        $f0, 0x0($18)
/* 05AEBC 0015ADBC 42000146 */  mul.s       $f1, $f0, $f1
/* 05AEC0 0015ADC0 000041E6 */  swc1        $f1, 0x0($18)
/* 05AEC4 0015ADC4 D88080C7 */  lwc1        $f0, -0x7F28($28)
/* 05AEC8 0015ADC8 02080046 */  mul.s       $f0, $f1, $f0
/* 05AECC 0015ADCC 000040E6 */  swc1        $f0, 0x0($18)
/* 05AED0 0015ADD0 5000BF7B */  lq          $31, 0x50($29)
/* 05AED4 0015ADD4 4000B37B */  lq          $19, 0x40($29)
/* 05AED8 0015ADD8 3000B27B */  lq          $18, 0x30($29)
/* 05AEDC 0015ADDC 2000B17B */  lq          $17, 0x20($29)
/* 05AEE0 0015ADE0 1000B07B */  lq          $16, 0x10($29)
/* 05AEE4 0015ADE4 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 05AEE8 0015ADE8 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 05AEEC 0015ADEC 8000BD27 */  addiu       $29, $29, 0x80
/* 05AEF0 0015ADF0 0800E003 */  jr          $31
/* 05AEF4 0015ADF4 00000000 */   nop
/* 05AEF8 0015ADF8 00000000 */  nop
/* 05AEFC 0015ADFC 00000000 */  nop
