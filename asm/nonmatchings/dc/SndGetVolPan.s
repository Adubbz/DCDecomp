.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndGetVolPan__FPfPfPfff
/* 5AD00 0015AC00 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 5AD04 0015AC04 5000BF7F */  sq         $31, 0x50($sp)
/* 5AD08 0015AC08 4000B37F */  sq         $19, 0x40($sp)
/* 5AD0C 0015AC0C 3000B27F */  sq         $18, 0x30($sp)
/* 5AD10 0015AC10 2000B17F */  sq         $17, 0x20($sp)
/* 5AD14 0015AC14 1000B07F */  sq         $16, 0x10($sp)
/* 5AD18 0015AC18 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 5AD1C 0015AC1C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 5AD20 0015AC20 28968070 */  paddub     $18, $4, $0
/* 5AD24 0015AC24 288EA070 */  paddub     $17, $5, $0
/* 5AD28 0015AC28 2886C070 */  paddub     $16, $6, $0
/* 5AD2C 0015AC2C 46650046 */  mov.s      $f21, $f12
/* 5AD30 0015AC30 066D0046 */  mov.s      $f20, $f13
/* 5AD34 0015AC34 28260072 */  paddub     $4, $16, $0
/* 5AD38 0015AC38 D001023C */  lui        $2, %hi(camera_pos)
/* 5AD3C 0015AC3C 10B54524 */  addiu      $5, $2, %lo(camera_pos)
/* 5AD40 0015AC40 648D040C */  jal        DistVector__FPfPf
/* 5AD44 0015AC44 00000000 */   nop
/* 5AD48 0015AC48 81001546 */  sub.s      $f2, $f0, $f21
/* 5AD4C 0015AC4C 41A01546 */  sub.s      $f1, $f20, $f21
/* 5AD50 0015AC50 83100146 */  div.s      $f2, $f2, $f1
/* 5AD54 0015AC54 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 5AD58 0015AC58 00088244 */  mtc1       $2, $f1
/* 5AD5C 0015AC5C 00000000 */  nop
/* 5AD60 0015AC60 41080246 */  sub.s      $f1, $f1, $f2
/* 5AD64 0015AC64 36001446 */  c.le.s     $f0, $f20
/* 5AD68 0015AC68 00000000 */  nop
/* 5AD6C 0015AC6C 02000145 */  bc1t       .L0015AC78
/* 5AD70 0015AC70 00000000 */   nop
/* 5AD74 0015AC74 00088044 */  mtc1       $0, $f1
.L0015AC78:
/* 5AD78 0015AC78 34001546 */  c.lt.s     $f0, $f21
/* 5AD7C 0015AC7C 00000000 */  nop
/* 5AD80 0015AC80 03000045 */  bc1f       .L0015AC90
/* 5AD84 0015AC84 00000000 */   nop
/* 5AD88 0015AC88 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 5AD8C 0015AC8C 00088244 */  mtc1       $2, $f1
.L0015AC90:
/* 5AD90 0015AC90 000041E6 */  swc1       $f1, 0x0($18)
/* 5AD94 0015AC94 000020AE */  sw         $0, 0x0($17)
/* 5AD98 0015AC98 6000A427 */  addiu      $4, $sp, 0x60
/* 5AD9C 0015AC9C D001023C */  lui        $2, %hi(camera_dir)
/* 5ADA0 0015ACA0 20B54524 */  addiu      $5, $2, %lo(camera_dir)
/* 5ADA4 0015ACA4 0C86040C */  jal        sceVu0CopyVector
/* 5ADA8 0015ACA8 00000000 */   nop
/* 5ADAC 0015ACAC 6400B327 */  addiu      $19, $sp, 0x64
/* 5ADB0 0015ACB0 000060AE */  sw         $0, 0x0($19)
/* 5ADB4 0015ACB4 6000A427 */  addiu      $4, $sp, 0x60
/* 5ADB8 0015ACB8 282E8070 */  paddub     $5, $4, $0
/* 5ADBC 0015ACBC 9285040C */  jal        sceVu0Normalize
/* 5ADC0 0015ACC0 00000000 */   nop
/* 5ADC4 0015ACC4 6800A0C7 */  lwc1       $f0, 0x68($sp)
/* 5ADC8 0015ACC8 7000A0E7 */  swc1       $f0, 0x70($sp)
/* 5ADCC 0015ACCC 7400A0AF */  sw         $0, 0x74($sp)
/* 5ADD0 0015ACD0 6000A0C7 */  lwc1       $f0, 0x60($sp)
/* 5ADD4 0015ACD4 07000046 */  neg.s      $f0, $f0
/* 5ADD8 0015ACD8 7800A0E7 */  swc1       $f0, 0x78($sp)
/* 5ADDC 0015ACDC 6000A427 */  addiu      $4, $sp, 0x60
/* 5ADE0 0015ACE0 282E0072 */  paddub     $5, $16, $0
/* 5ADE4 0015ACE4 D001023C */  lui        $2, %hi(camera_pos)
/* 5ADE8 0015ACE8 10B54624 */  addiu      $6, $2, %lo(camera_pos)
/* 5ADEC 0015ACEC EE85040C */  jal        sceVu0SubVector
/* 5ADF0 0015ACF0 00000000 */   nop
/* 5ADF4 0015ACF4 000060AE */  sw         $0, 0x0($19)
/* 5ADF8 0015ACF8 6000A427 */  addiu      $4, $sp, 0x60
/* 5ADFC 0015ACFC 282E8070 */  paddub     $5, $4, $0
/* 5AE00 0015AD00 9285040C */  jal        sceVu0Normalize
/* 5AE04 0015AD04 00000000 */   nop
/* 5AE08 0015AD08 6000A427 */  addiu      $4, $sp, 0x60
/* 5AE0C 0015AD0C 7000A527 */  addiu      $5, $sp, 0x70
/* 5AE10 0015AD10 8885040C */  jal        sceVu0InnerProduct
/* 5AE14 0015AD14 00000000 */   nop
/* 5AE18 0015AD18 47000046 */  neg.s      $f1, $f0
/* 5AE1C 0015AD1C 01000324 */  addiu      $3, $0, 0x1
/* 5AE20 0015AD20 00008044 */  mtc1       $0, $f0
/* 5AE24 0015AD24 00000000 */  nop
/* 5AE28 0015AD28 34080046 */  c.lt.s     $f1, $f0
/* 5AE2C 0015AD2C 00000000 */  nop
/* 5AE30 0015AD30 02000045 */  bc1f       .L0015AD3C
/* 5AE34 0015AD34 00000000 */   nop
/* 5AE38 0015AD38 FFFF0324 */  addiu      $3, $0, -0x1
.L0015AD3C:
/* 5AE3C 0015AD3C 00008044 */  mtc1       $0, $f0
/* 5AE40 0015AD40 00000000 */  nop
/* 5AE44 0015AD44 34080046 */  c.lt.s     $f1, $f0
/* 5AE48 0015AD48 00000000 */  nop
/* 5AE4C 0015AD4C 04000045 */  bc1f       .L0015AD60
/* 5AE50 0015AD50 00000000 */   nop
/* 5AE54 0015AD54 47080046 */  neg.s      $f1, $f1
/* 5AE58 0015AD58 01000010 */  b          .L0015AD60
/* 5AE5C 0015AD5C 00000000 */   nop
.L0015AD60:
/* 5AE60 0015AD60 42080146 */  mul.s      $f1, $f1, $f1
/* 5AE64 0015AD64 42080146 */  mul.s      $f1, $f1, $f1
/* 5AE68 0015AD68 00008344 */  mtc1       $3, $f0
/* 5AE6C 0015AD6C 00000000 */  nop
/* 5AE70 0015AD70 20008046 */  cvt.s.w    $f0, $f0
/* 5AE74 0015AD74 42000146 */  mul.s      $f1, $f0, $f1
/* 5AE78 0015AD78 D48080C7 */  lwc1       $f0, -0x7F2C($gp)
/* 5AE7C 0015AD7C 42000146 */  mul.s      $f1, $f0, $f1
/* 5AE80 0015AD80 000021E6 */  swc1       $f1, 0x0($17)
/* 5AE84 0015AD84 00008044 */  mtc1       $0, $f0
/* 5AE88 0015AD88 00000000 */  nop
/* 5AE8C 0015AD8C 34080046 */  c.lt.s     $f1, $f0
/* 5AE90 0015AD90 00000000 */  nop
/* 5AE94 0015AD94 04000045 */  bc1f       .L0015ADA8
/* 5AE98 0015AD98 00000000 */   nop
/* 5AE9C 0015AD9C 47080046 */  neg.s      $f1, $f1
/* 5AEA0 0015ADA0 01000010 */  b          .L0015ADA8
/* 5AEA4 0015ADA4 00000000 */   nop
.L0015ADA8:
/* 5AEA8 0015ADA8 7C8080C7 */  lwc1       $f0, -0x7F84($gp)
/* 5AEAC 0015ADAC 42000146 */  mul.s      $f1, $f0, $f1
/* 5AEB0 0015ADB0 D48080C7 */  lwc1       $f0, -0x7F2C($gp)
/* 5AEB4 0015ADB4 40000146 */  add.s      $f1, $f0, $f1
/* 5AEB8 0015ADB8 000040C6 */  lwc1       $f0, 0x0($18)
/* 5AEBC 0015ADBC 42000146 */  mul.s      $f1, $f0, $f1
/* 5AEC0 0015ADC0 000041E6 */  swc1       $f1, 0x0($18)
/* 5AEC4 0015ADC4 D88080C7 */  lwc1       $f0, -0x7F28($gp)
/* 5AEC8 0015ADC8 02080046 */  mul.s      $f0, $f1, $f0
/* 5AECC 0015ADCC 000040E6 */  swc1       $f0, 0x0($18)
/* 5AED0 0015ADD0 5000BF7B */  lq         $31, 0x50($sp)
/* 5AED4 0015ADD4 4000B37B */  lq         $19, 0x40($sp)
/* 5AED8 0015ADD8 3000B27B */  lq         $18, 0x30($sp)
/* 5AEDC 0015ADDC 2000B17B */  lq         $17, 0x20($sp)
/* 5AEE0 0015ADE0 1000B07B */  lq         $16, 0x10($sp)
/* 5AEE4 0015ADE4 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 5AEE8 0015ADE8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 5AEEC 0015ADEC 8000BD27 */  addiu      $sp, $sp, 0x80
/* 5AEF0 0015ADF0 0800E003 */  jr         $31
/* 5AEF4 0015ADF4 00000000 */   nop
/* 5AEF8 0015ADF8 00000000 */  nop
/* 5AEFC 0015ADFC 00000000 */  nop
