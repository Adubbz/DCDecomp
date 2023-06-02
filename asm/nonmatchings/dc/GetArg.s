.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetArg__FR9input_strPiPPv
/* 3ADE0 0013ACE0 80FEBD27 */  addiu      $sp, $sp, -0x180
/* 3ADE4 0013ACE4 7000BF7F */  sq         $31, 0x70($sp)
/* 3ADE8 0013ACE8 6000B67F */  sq         $22, 0x60($sp)
/* 3ADEC 0013ACEC 5000B57F */  sq         $21, 0x50($sp)
/* 3ADF0 0013ACF0 4000B47F */  sq         $20, 0x40($sp)
/* 3ADF4 0013ACF4 3000B37F */  sq         $19, 0x30($sp)
/* 3ADF8 0013ACF8 2000B27F */  sq         $18, 0x20($sp)
/* 3ADFC 0013ACFC 1000B17F */  sq         $17, 0x10($sp)
/* 3AE00 0013AD00 0000B07F */  sq         $16, 0x0($sp)
/* 3AE04 0013AD04 28968070 */  paddub     $18, $4, $0
/* 3AE08 0013AD08 288EA070 */  paddub     $17, $5, $0
/* 3AE0C 0013AD0C 2886C070 */  paddub     $16, $6, $0
/* 3AE10 0013AD10 0000A28C */  lw         $2, 0x0($5)
/* 3AE14 0013AD14 04004104 */  bgez       $2, .L0013AD28
/* 3AE18 0013AD18 00000000 */   nop
/* 3AE1C 0013AD1C 01000224 */  addiu      $2, $0, 0x1
/* 3AE20 0013AD20 B2000010 */  b          .L0013AFEC
/* 3AE24 0013AD24 00000000 */   nop
.L0013AD28:
/* 3AE28 0013AD28 5CEC040C */  jal        SkipSpace__FR9input_str
/* 3AE2C 0013AD2C 00000000 */   nop
/* 3AE30 0013AD30 04004014 */  bnez       $2, .L0013AD44
/* 3AE34 0013AD34 00000000 */   nop
/* 3AE38 0013AD38 28160070 */  paddub     $2, $0, $0
/* 3AE3C 0013AD3C AB000010 */  b          .L0013AFEC
/* 3AE40 0013AD40 00000000 */   nop
.L0013AD44:
/* 3AE44 0013AD44 289E0070 */  paddub     $19, $0, $0
.L0013AD48:
/* 3AE48 0013AD48 28166072 */  paddub     $2, $19, $0
/* 3AE4C 0013AD4C 01007326 */  addiu      $19, $19, 0x1
/* 3AE50 0013AD50 80100200 */  sll        $2, $2, 2
/* 3AE54 0013AD54 21102202 */  addu       $2, $17, $2
/* 3AE58 0013AD58 0000428C */  lw         $2, 0x0($2)
/* 3AE5C 0013AD5C FAFF4104 */  bgez       $2, .L0013AD48
/* 3AE60 0013AD60 00000000 */   nop
/* 3AE64 0013AD64 28AE0070 */  paddub     $21, $0, $0
/* 3AE68 0013AD68 9B000010 */  b          .L0013AFD8
/* 3AE6C 0013AD6C 00000000 */   nop
.L0013AD70:
/* 3AE70 0013AD70 28B60070 */  paddub     $22, $0, $0
/* 3AE74 0013AD74 28264072 */  paddub     $4, $18, $0
/* 3AE78 0013AD78 5CEC040C */  jal        SkipSpace__FR9input_str
/* 3AE7C 0013AD7C 00000000 */   nop
/* 3AE80 0013AD80 04004014 */  bnez       $2, .L0013AD94
/* 3AE84 0013AD84 00000000 */   nop
/* 3AE88 0013AD88 28160070 */  paddub     $2, $0, $0
/* 3AE8C 0013AD8C 97000010 */  b          .L0013AFEC
/* 3AE90 0013AD90 00000000 */   nop
.L0013AD94:
/* 3AE94 0013AD94 0000428E */  lw         $2, 0x0($18)
/* 3AE98 0013AD98 0800438E */  lw         $3, 0x8($18)
/* 3AE9C 0013AD9C 21104300 */  addu       $2, $2, $3
/* 3AEA0 0013ADA0 00005490 */  lbu        $20, 0x0($2)
/* 3AEA4 0013ADA4 01006224 */  addiu      $2, $3, 0x1
/* 3AEA8 0013ADA8 080042AE */  sw         $2, 0x8($18)
/* 3AEAC 0013ADAC 0400438E */  lw         $3, 0x4($18)
/* 3AEB0 0013ADB0 0800428E */  lw         $2, 0x8($18)
/* 3AEB4 0013ADB4 2A086200 */  slt        $at, $3, $2
/* 3AEB8 0013ADB8 01000224 */  addiu      $2, $0, 0x1
/* 3AEBC 0013ADBC 0B100100 */  movn       $2, $0, $at
/* 3AEC0 0013ADC0 01000010 */  b          .L0013ADC8
/* 3AEC4 0013ADC4 00000000 */   nop
.L0013ADC8:
/* 3AEC8 0013ADC8 04004014 */  bnez       $2, .L0013ADDC
/* 3AECC 0013ADCC 00000000 */   nop
/* 3AED0 0013ADD0 28160070 */  paddub     $2, $0, $0
/* 3AED4 0013ADD4 85000010 */  b          .L0013AFEC
/* 3AED8 0013ADD8 00000000 */   nop
.L0013ADDC:
/* 3AEDC 0013ADDC 2C000224 */  addiu      $2, $0, 0x2C
/* 3AEE0 0013ADE0 0C008212 */  beq        $20, $2, .L0013AE14
/* 3AEE4 0013ADE4 00000000 */   nop
/* 3AEE8 0013ADE8 3C261400 */  dsll32     $4, $20, 24
/* 3AEEC 0013ADEC 3F260400 */  dsra32     $4, $4, 24
/* 3AEF0 0013ADF0 84EC040C */  jal        CheckChar__Fc
/* 3AEF4 0013ADF4 00000000 */   nop
/* 3AEF8 0013ADF8 06004010 */  beqz       $2, .L0013AE14
/* 3AEFC 0013ADFC 00000000 */   nop
/* 3AF00 0013AE00 2110DD02 */  addu       $2, $22, $sp
/* 3AF04 0013AE04 800054A0 */  sb         $20, 0x80($2)
/* 3AF08 0013AE08 0100D626 */  addiu      $22, $22, 0x1
/* 3AF0C 0013AE0C E1FF0010 */  b          .L0013AD94
/* 3AF10 0013AE10 00000000 */   nop
.L0013AE14:
/* 3AF14 0013AE14 2110DD02 */  addu       $2, $22, $sp
/* 3AF18 0013AE18 800040A0 */  sb         $0, 0x80($2)
/* 3AF1C 0013AE1C 80A01500 */  sll        $20, $21, 2
/* 3AF20 0013AE20 21103402 */  addu       $2, $17, $20
/* 3AF24 0013AE24 0000438C */  lw         $3, 0x0($2)
/* 3AF28 0013AE28 02000224 */  addiu      $2, $0, 0x2
/* 3AF2C 0013AE2C 42006210 */  beq        $3, $2, .L0013AF38
/* 3AF30 0013AE30 00000000 */   nop
/* 3AF34 0013AE34 01001624 */  addiu      $22, $0, 0x1
/* 3AF38 0013AE38 24007610 */  beq        $3, $22, .L0013AECC
/* 3AF3C 0013AE3C 00000000 */   nop
/* 3AF40 0013AE40 03006010 */  beqz       $3, .L0013AE50
/* 3AF44 0013AE44 00000000 */   nop
/* 3AF48 0013AE48 5F000010 */  b          .L0013AFC8
/* 3AF4C 0013AE4C 00000000 */   nop
.L0013AE50:
/* 3AF50 0013AE50 8000A383 */  lb         $3, 0x80($sp)
/* 3AF54 0013AE54 22000224 */  addiu      $2, $0, 0x22
/* 3AF58 0013AE58 04006210 */  beq        $3, $2, .L0013AE6C
/* 3AF5C 0013AE5C 00000000 */   nop
/* 3AF60 0013AE60 FFFF0224 */  addiu      $2, $0, -0x1
/* 3AF64 0013AE64 61000010 */  b          .L0013AFEC
/* 3AF68 0013AE68 00000000 */   nop
.L0013AE6C:
/* 3AF6C 0013AE6C 2110DD02 */  addu       $2, $22, $sp
/* 3AF70 0013AE70 80004424 */  addiu      $4, $2, 0x80
/* 3AF74 0013AE74 00008380 */  lb         $3, 0x0($4)
/* 3AF78 0013AE78 22000224 */  addiu      $2, $0, 0x22
/* 3AF7C 0013AE7C 04006214 */  bne        $3, $2, .L0013AE90
/* 3AF80 0013AE80 00000000 */   nop
/* 3AF84 0013AE84 000080A0 */  sb         $0, 0x0($4)
/* 3AF88 0013AE88 09000010 */  b          .L0013AEB0
/* 3AF8C 0013AE8C 00000000 */   nop
.L0013AE90:
/* 3AF90 0013AE90 04006014 */  bnez       $3, .L0013AEA4
/* 3AF94 0013AE94 00000000 */   nop
/* 3AF98 0013AE98 FFFF0224 */  addiu      $2, $0, -0x1
/* 3AF9C 0013AE9C 53000010 */  b          .L0013AFEC
/* 3AFA0 0013AEA0 00000000 */   nop
.L0013AEA4:
/* 3AFA4 0013AEA4 0100D626 */  addiu      $22, $22, 0x1
/* 3AFA8 0013AEA8 F0FF0010 */  b          .L0013AE6C
/* 3AFAC 0013AEAC 00000000 */   nop
.L0013AEB0:
/* 3AFB0 0013AEB0 21101402 */  addu       $2, $16, $20
/* 3AFB4 0013AEB4 0000448C */  lw         $4, 0x0($2)
/* 3AFB8 0013AEB8 8100A527 */  addiu      $5, $sp, 0x81
/* 3AFBC 0013AEBC 5A15040C */  jal        strcpy
/* 3AFC0 0013AEC0 00000000 */   nop
/* 3AFC4 0013AEC4 43000010 */  b          .L0013AFD4
/* 3AFC8 0013AEC8 00000000 */   nop
.L0013AECC:
/* 3AFCC 0013AECC 28B60070 */  paddub     $22, $0, $0
/* 3AFD0 0013AED0 0D000010 */  b          .L0013AF08
/* 3AFD4 0013AED4 00000000 */   nop
.L0013AED8:
/* 3AFD8 0013AED8 3C1E0200 */  dsll32     $3, $2, 24
/* 3AFDC 0013AEDC 3F1E0300 */  dsra32     $3, $3, 24
/* 3AFE0 0013AEE0 30006228 */  slti       $2, $3, 0x30
/* 3AFE4 0013AEE4 04004014 */  bnez       $2, .L0013AEF8
/* 3AFE8 0013AEE8 00000000 */   nop
/* 3AFEC 0013AEEC 3A006128 */  slti       $at, $3, 0x3A
/* 3AFF0 0013AEF0 04002014 */  bnez       $at, .L0013AF04
/* 3AFF4 0013AEF4 00000000 */   nop
.L0013AEF8:
/* 3AFF8 0013AEF8 FFFF0224 */  addiu      $2, $0, -0x1
/* 3AFFC 0013AEFC 3B000010 */  b          .L0013AFEC
/* 3B000 0013AF00 00000000 */   nop
.L0013AF04:
/* 3B004 0013AF04 0100D626 */  addiu      $22, $22, 0x1
.L0013AF08:
/* 3B008 0013AF08 2110DD02 */  addu       $2, $22, $sp
/* 3B00C 0013AF0C 80004280 */  lb         $2, 0x80($2)
/* 3B010 0013AF10 F1FF4014 */  bnez       $2, .L0013AED8
/* 3B014 0013AF14 00000000 */   nop
/* 3B018 0013AF18 8000A427 */  addiu      $4, $sp, 0x80
/* 3B01C 0013AF1C 8E00040C */  jal        atoi
/* 3B020 0013AF20 00000000 */   nop
/* 3B024 0013AF24 21181402 */  addu       $3, $16, $20
/* 3B028 0013AF28 0000638C */  lw         $3, 0x0($3)
/* 3B02C 0013AF2C 000062AC */  sw         $2, 0x0($3)
/* 3B030 0013AF30 28000010 */  b          .L0013AFD4
/* 3B034 0013AF34 00000000 */   nop
.L0013AF38:
/* 3B038 0013AF38 28B60070 */  paddub     $22, $0, $0
/* 3B03C 0013AF3C 13000010 */  b          .L0013AF8C
/* 3B040 0013AF40 00000000 */   nop
.L0013AF44:
/* 3B044 0013AF44 3C1E0200 */  dsll32     $3, $2, 24
/* 3B048 0013AF48 3F1E0300 */  dsra32     $3, $3, 24
/* 3B04C 0013AF4C 30006228 */  slti       $2, $3, 0x30
/* 3B050 0013AF50 04004014 */  bnez       $2, .L0013AF64
/* 3B054 0013AF54 00000000 */   nop
/* 3B058 0013AF58 3A006128 */  slti       $at, $3, 0x3A
/* 3B05C 0013AF5C 0A002014 */  bnez       $at, .L0013AF88
/* 3B060 0013AF60 00000000 */   nop
.L0013AF64:
/* 3B064 0013AF64 2E000224 */  addiu      $2, $0, 0x2E
/* 3B068 0013AF68 07006210 */  beq        $3, $2, .L0013AF88
/* 3B06C 0013AF6C 00000000 */   nop
/* 3B070 0013AF70 2D000224 */  addiu      $2, $0, 0x2D
/* 3B074 0013AF74 04006210 */  beq        $3, $2, .L0013AF88
/* 3B078 0013AF78 00000000 */   nop
/* 3B07C 0013AF7C FFFF0224 */  addiu      $2, $0, -0x1
/* 3B080 0013AF80 1A000010 */  b          .L0013AFEC
/* 3B084 0013AF84 00000000 */   nop
.L0013AF88:
/* 3B088 0013AF88 0100D626 */  addiu      $22, $22, 0x1
.L0013AF8C:
/* 3B08C 0013AF8C 2110DD02 */  addu       $2, $22, $sp
/* 3B090 0013AF90 80004280 */  lb         $2, 0x80($2)
/* 3B094 0013AF94 EBFF4014 */  bnez       $2, .L0013AF44
/* 3B098 0013AF98 00000000 */   nop
/* 3B09C 0013AF9C 8000A427 */  addiu      $4, $sp, 0x80
/* 3B0A0 0013AFA0 8600040C */  jal        atof
/* 3B0A4 0013AFA4 00000000 */   nop
/* 3B0A8 0013AFA8 28264070 */  paddub     $4, $2, $0
/* 3B0AC 0013AFAC 9241040C */  jal        dptofp
/* 3B0B0 0013AFB0 00000000 */   nop
/* 3B0B4 0013AFB4 21101402 */  addu       $2, $16, $20
/* 3B0B8 0013AFB8 0000428C */  lw         $2, 0x0($2)
/* 3B0BC 0013AFBC 000040E4 */  swc1       $f0, 0x0($2)
/* 3B0C0 0013AFC0 04000010 */  b          .L0013AFD4
/* 3B0C4 0013AFC4 00000000 */   nop
.L0013AFC8:
/* 3B0C8 0013AFC8 FFFF0224 */  addiu      $2, $0, -0x1
/* 3B0CC 0013AFCC 07000010 */  b          .L0013AFEC
/* 3B0D0 0013AFD0 00000000 */   nop
.L0013AFD4:
/* 3B0D4 0013AFD4 0100B526 */  addiu      $21, $21, 0x1
.L0013AFD8:
/* 3B0D8 0013AFD8 FFFF6226 */  addiu      $2, $19, -0x1
/* 3B0DC 0013AFDC 2A10A202 */  slt        $2, $21, $2
/* 3B0E0 0013AFE0 63FF4014 */  bnez       $2, .L0013AD70
/* 3B0E4 0013AFE4 00000000 */   nop
/* 3B0E8 0013AFE8 01000224 */  addiu      $2, $0, 0x1
.L0013AFEC:
/* 3B0EC 0013AFEC 7000BF7B */  lq         $31, 0x70($sp)
/* 3B0F0 0013AFF0 6000B67B */  lq         $22, 0x60($sp)
/* 3B0F4 0013AFF4 5000B57B */  lq         $21, 0x50($sp)
/* 3B0F8 0013AFF8 4000B47B */  lq         $20, 0x40($sp)
/* 3B0FC 0013AFFC 3000B37B */  lq         $19, 0x30($sp)
/* 3B100 0013B000 2000B27B */  lq         $18, 0x20($sp)
/* 3B104 0013B004 1000B17B */  lq         $17, 0x10($sp)
/* 3B108 0013B008 0000B07B */  lq         $16, 0x0($sp)
/* 3B10C 0013B00C 8001BD27 */  addiu      $sp, $sp, 0x180
/* 3B110 0013B010 0800E003 */  jr         $31
/* 3B114 0013B014 00000000 */   nop
/* 3B118 0013B018 00000000 */  nop
/* 3B11C 0013B01C 00000000 */  nop
