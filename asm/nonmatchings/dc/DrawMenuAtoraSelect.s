.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMenuAtoraSelect__Fv
/* 11AB80 0021AA80 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 11AB84 0021AA84 1000BF7F */  sq         $31, 0x10($sp)
/* 11AB88 0021AA88 0000B07F */  sq         $16, 0x0($sp)
/* 11AB8C 0021AA8C 80000424 */  addiu      $4, $0, 0x80
/* 11AB90 0021AA90 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AB94 0021AA94 5C82258C */  lw         $5, -0x7DA4($at)
/* 11AB98 0021AA98 02000324 */  addiu      $3, $0, 0x2
/* 11AB9C 0021AA9C 0B00A310 */  beq        $5, $3, .L0021AACC
/* 11ABA0 0021AAA0 00000000 */   nop
/* 11ABA4 0021AAA4 01000324 */  addiu      $3, $0, 0x1
/* 11ABA8 0021AAA8 0300A310 */  beq        $5, $3, .L0021AAB8
/* 11ABAC 0021AAAC 00000000 */   nop
/* 11ABB0 0021AAB0 0A000010 */  b          .L0021AADC
/* 11ABB4 0021AAB4 00000000 */   nop
.L0021AAB8:
/* 11ABB8 0021AAB8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11ABBC 0021AABC 6082238C */  lw         $3, -0x7DA0($at)
/* 11ABC0 0021AAC0 C0200300 */  sll        $4, $3, 3
/* 11ABC4 0021AAC4 05000010 */  b          .L0021AADC
/* 11ABC8 0021AAC8 00000000 */   nop
.L0021AACC:
/* 11ABCC 0021AACC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11ABD0 0021AAD0 6082238C */  lw         $3, -0x7DA0($at)
/* 11ABD4 0021AAD4 C0180300 */  sll        $3, $3, 3
/* 11ABD8 0021AAD8 23208300 */  subu       $4, $4, $3
.L0021AADC:
/* 11ABDC 0021AADC 02008104 */  bgez       $4, .L0021AAE8
/* 11ABE0 0021AAE0 00000000 */   nop
/* 11ABE4 0021AAE4 28260070 */  paddub     $4, $0, $0
.L0021AAE8:
/* 11ABE8 0021AAE8 81008128 */  slti       $at, $4, 0x81
/* 11ABEC 0021AAEC 02002014 */  bnez       $at, .L0021AAF8
/* 11ABF0 0021AAF0 00000000 */   nop
/* 11ABF4 0021AAF4 80000424 */  addiu      $4, $0, 0x80
.L0021AAF8:
/* 11ABF8 0021AAF8 08000324 */  addiu      $3, $0, 0x8
/* 11ABFC 0021AAFC D300A310 */  beq        $5, $3, .L0021AE4C
/* 11AC00 0021AB00 00000000 */   nop
/* 11AC04 0021AB04 A06B080C */  jal        DrawAtoraSelect__Fi
/* 11AC08 0021AB08 00000000 */   nop
/* 11AC0C 0021AB0C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AC10 0021AB10 5C82228C */  lw         $2, -0x7DA4($at)
/* 11AC14 0021AB14 11004014 */  bnez       $2, .L0021AB5C
/* 11AC18 0021AB18 00000000 */   nop
/* 11AC1C 0021AB1C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AC20 0021AB20 50822CC4 */  lwc1       $f12, -0x7DB0($at)
/* 11AC24 0021AB24 2C44040C */  jal        fptosi
/* 11AC28 0021AB28 00000000 */   nop
/* 11AC2C 0021AB2C 28864070 */  paddub     $16, $2, $0
/* 11AC30 0021AB30 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AC34 0021AB34 54822CC4 */  lwc1       $f12, -0x7DAC($at)
/* 11AC38 0021AB38 2C44040C */  jal        fptosi
/* 11AC3C 0021AB3C 00000000 */   nop
/* 11AC40 0021AB40 28260072 */  paddub     $4, $16, $0
/* 11AC44 0021AB44 282E4070 */  paddub     $5, $2, $0
/* 11AC48 0021AB48 01000624 */  addiu      $6, $0, 0x1
/* 11AC4C 0021AB4C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AC50 0021AB50 5882278C */  lw         $7, -0x7DA8($at)
/* 11AC54 0021AB54 D05B080C */  jal        DrawMenuObjectVibe__Fiiii
/* 11AC58 0021AB58 00000000 */   nop
.L0021AB5C:
/* 11AC5C 0021AB5C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AC60 0021AB60 5C82228C */  lw         $2, -0x7DA4($at)
/* 11AC64 0021AB64 0B004010 */  beqz       $2, .L0021AB94
/* 11AC68 0021AB68 00000000 */   nop
/* 11AC6C 0021AB6C E896828F */  lw         $2, -0x6918($gp)
/* 11AC70 0021AB70 08004010 */  beqz       $2, .L0021AB94
/* 11AC74 0021AB74 00000000 */   nop
/* 11AC78 0021AB78 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AC7C 0021AB7C 6082228C */  lw         $2, -0x7DA0($at)
/* 11AC80 0021AB80 01004224 */  addiu      $2, $2, 0x1
/* 11AC84 0021AB84 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AC88 0021AB88 608222AC */  sw         $2, -0x7DA0($at)
/* 11AC8C 0021AB8C 03000010 */  b          .L0021AB9C
/* 11AC90 0021AB90 00000000 */   nop
.L0021AB94:
/* 11AC94 0021AB94 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AC98 0021AB98 608220AC */  sw         $0, -0x7DA0($at)
.L0021AB9C:
/* 11AC9C 0021AB9C C701023C */  lui        $2, %hi(TexManager)
/* 11ACA0 0021ABA0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11ACA4 0021ABA4 2A00023C */  lui        $2, %hi(_1502)
/* 11ACA8 0021ABA8 68EA4524 */  addiu      $5, $2, %lo(_1502)
/* 11ACAC 0021ABAC FFFF0624 */  addiu      $6, $0, -0x1
/* 11ACB0 0021ABB0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11ACB4 0021ABB4 00000000 */   nop
/* 11ACB8 0021ABB8 00004384 */  lh         $3, 0x0($2)
/* 11ACBC 0021ABBC 2000A3A7 */  sh         $3, 0x20($sp)
/* 11ACC0 0021ABC0 02004384 */  lh         $3, 0x2($2)
/* 11ACC4 0021ABC4 2200A3A7 */  sh         $3, 0x22($sp)
/* 11ACC8 0021ABC8 04004384 */  lh         $3, 0x4($2)
/* 11ACCC 0021ABCC 2400A3A7 */  sh         $3, 0x24($sp)
/* 11ACD0 0021ABD0 06004384 */  lh         $3, 0x6($2)
/* 11ACD4 0021ABD4 2600A3A7 */  sh         $3, 0x26($sp)
/* 11ACD8 0021ABD8 08004724 */  addiu      $7, $2, 0x8
/* 11ACDC 0021ABDC 2800A627 */  addiu      $6, $sp, 0x28
/* 11ACE0 0021ABE0 04000524 */  addiu      $5, $0, 0x4
.L0021ABE4:
/* 11ACE4 0021ABE4 0000E48C */  lw         $4, 0x0($7)
/* 11ACE8 0021ABE8 0400E38C */  lw         $3, 0x4($7)
/* 11ACEC 0021ABEC 0800E724 */  addiu      $7, $7, 0x8
/* 11ACF0 0021ABF0 FFFFA524 */  addiu      $5, $5, -0x1
/* 11ACF4 0021ABF4 0000C4AC */  sw         $4, 0x0($6)
/* 11ACF8 0021ABF8 0400C3AC */  sw         $3, 0x4($6)
/* 11ACFC 0021ABFC 0800C624 */  addiu      $6, $6, 0x8
/* 11AD00 0021AC00 F8FFA01C */  bgtz       $5, .L0021ABE4
/* 11AD04 0021AC04 00000000 */   nop
/* 11AD08 0021AC08 280043DC */  ld         $3, 0x28($2)
/* 11AD0C 0021AC0C 4800A527 */  addiu      $5, $sp, 0x48
/* 11AD10 0021AC10 0000A3FC */  sd         $3, 0x0($5)
/* 11AD14 0021AC14 300043DC */  ld         $3, 0x30($2)
/* 11AD18 0021AC18 5000A3FF */  sd         $3, 0x50($sp)
/* 11AD1C 0021AC1C 5800A327 */  addiu      $3, $sp, 0x58
/* 11AD20 0021AC20 380043C4 */  lwc1       $f3, 0x38($2)
/* 11AD24 0021AC24 3C0042C4 */  lwc1       $f2, 0x3C($2)
/* 11AD28 0021AC28 400041C4 */  lwc1       $f1, 0x40($2)
/* 11AD2C 0021AC2C 440040C4 */  lwc1       $f0, 0x44($2)
/* 11AD30 0021AC30 000063E4 */  swc1       $f3, 0x0($3)
/* 11AD34 0021AC34 040062E4 */  swc1       $f2, 0x4($3)
/* 11AD38 0021AC38 080061E4 */  swc1       $f1, 0x8($3)
/* 11AD3C 0021AC3C 0C0060E4 */  swc1       $f0, 0xC($3)
/* 11AD40 0021AC40 4800438C */  lw         $3, 0x48($2)
/* 11AD44 0021AC44 6800A3AF */  sw         $3, 0x68($sp)
/* 11AD48 0021AC48 4C00428C */  lw         $2, 0x4C($2)
/* 11AD4C 0021AC4C 6C00A2AF */  sw         $2, 0x6C($sp)
/* 11AD50 0021AC50 0400A490 */  lbu        $4, 0x4($5)
/* 11AD54 0021AC54 01000230 */  andi       $2, $0, 0x1
/* 11AD58 0021AC58 80180200 */  sll        $3, $2, 2
/* 11AD5C 0021AC5C FBFF0224 */  addiu      $2, $0, -0x5
/* 11AD60 0021AC60 24108200 */  and        $2, $4, $2
/* 11AD64 0021AC64 25104300 */  or         $2, $2, $3
/* 11AD68 0021AC68 0400A2A0 */  sb         $2, 0x4($5)
/* 11AD6C 0021AC6C 8800A427 */  addiu      $4, $sp, 0x88
/* 11AD70 0021AC70 008C82DF */  ld         $2, -0x7400($gp)
/* 11AD74 0021AC74 000082FC */  sd         $2, 0x0($4)
/* 11AD78 0021AC78 8900A593 */  lbu        $5, 0x89($sp)
/* 11AD7C 0021AC7C 80000364 */  daddiu     $3, $0, 0x80
/* 11AD80 0021AC80 7FFF0224 */  addiu      $2, $0, -0x81
/* 11AD84 0021AC84 2410A200 */  and        $2, $5, $2
/* 11AD88 0021AC88 25104300 */  or         $2, $2, $3
/* 11AD8C 0021AC8C 8900A2A3 */  sb         $2, 0x89($sp)
/* 11AD90 0021AC90 80000224 */  addiu      $2, $0, 0x80
/* 11AD94 0021AC94 8800A2A3 */  sb         $2, 0x88($sp)
/* 11AD98 0021AC98 18BC040C */  jal        MGSetGsTEXA__FP9sceGsTexa
/* 11AD9C 0021AC9C 00000000 */   nop
/* 11ADA0 0021ACA0 28560070 */  paddub     $10, $0, $0
/* 11ADA4 0021ACA4 28860070 */  paddub     $16, $0, $0
/* 11ADA8 0021ACA8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11ADAC 0021ACAC 5C82238C */  lw         $3, -0x7DA4($at)
/* 11ADB0 0021ACB0 02000224 */  addiu      $2, $0, 0x2
/* 11ADB4 0021ACB4 20006210 */  beq        $3, $2, .L0021AD38
/* 11ADB8 0021ACB8 00000000 */   nop
/* 11ADBC 0021ACBC 09000224 */  addiu      $2, $0, 0x9
/* 11ADC0 0021ACC0 16006210 */  beq        $3, $2, .L0021AD1C
/* 11ADC4 0021ACC4 00000000 */   nop
/* 11ADC8 0021ACC8 07000224 */  addiu      $2, $0, 0x7
/* 11ADCC 0021ACCC 0E006210 */  beq        $3, $2, .L0021AD08
/* 11ADD0 0021ACD0 00000000 */   nop
/* 11ADD4 0021ACD4 01000224 */  addiu      $2, $0, 0x1
/* 11ADD8 0021ACD8 03006210 */  beq        $3, $2, .L0021ACE8
/* 11ADDC 0021ACDC 00000000 */   nop
/* 11ADE0 0021ACE0 1A000010 */  b          .L0021AD4C
/* 11ADE4 0021ACE4 00000000 */   nop
.L0021ACE8:
/* 11ADE8 0021ACE8 80000424 */  addiu      $4, $0, 0x80
/* 11ADEC 0021ACEC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11ADF0 0021ACF0 6082238C */  lw         $3, -0x7DA0($at)
/* 11ADF4 0021ACF4 C0100300 */  sll        $2, $3, 3
/* 11ADF8 0021ACF8 23104300 */  subu       $2, $2, $3
/* 11ADFC 0021ACFC 23508200 */  subu       $10, $4, $2
/* 11AE00 0021AD00 12000010 */  b          .L0021AD4C
/* 11AE04 0021AD04 00000000 */   nop
.L0021AD08:
/* 11AE08 0021AD08 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AE0C 0021AD0C 6082228C */  lw         $2, -0x7DA0($at)
/* 11AE10 0021AD10 40800200 */  sll        $16, $2, 1
/* 11AE14 0021AD14 0D000010 */  b          .L0021AD4C
/* 11AE18 0021AD18 00000000 */   nop
.L0021AD1C:
/* 11AE1C 0021AD1C 80000324 */  addiu      $3, $0, 0x80
/* 11AE20 0021AD20 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AE24 0021AD24 6082228C */  lw         $2, -0x7DA0($at)
/* 11AE28 0021AD28 40100200 */  sll        $2, $2, 1
/* 11AE2C 0021AD2C 23806200 */  subu       $16, $3, $2
/* 11AE30 0021AD30 06000010 */  b          .L0021AD4C
/* 11AE34 0021AD34 00000000 */   nop
.L0021AD38:
/* 11AE38 0021AD38 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AE3C 0021AD3C 6082238C */  lw         $3, -0x7DA0($at)
/* 11AE40 0021AD40 80100300 */  sll        $2, $3, 2
/* 11AE44 0021AD44 21104300 */  addu       $2, $2, $3
/* 11AE48 0021AD48 40004A24 */  addiu      $10, $2, 0x40
.L0021AD4C:
/* 11AE4C 0021AD4C 02004105 */  bgez       $10, .L0021AD58
/* 11AE50 0021AD50 00000000 */   nop
/* 11AE54 0021AD54 28560070 */  paddub     $10, $0, $0
.L0021AD58:
/* 11AE58 0021AD58 81004129 */  slti       $at, $10, 0x81
/* 11AE5C 0021AD5C 02002014 */  bnez       $at, .L0021AD68
/* 11AE60 0021AD60 00000000 */   nop
/* 11AE64 0021AD64 80000A24 */  addiu      $10, $0, 0x80
.L0021AD68:
/* 11AE68 0021AD68 02000106 */  bgez       $16, .L0021AD74
/* 11AE6C 0021AD6C 00000000 */   nop
/* 11AE70 0021AD70 28860070 */  paddub     $16, $0, $0
.L0021AD74:
/* 11AE74 0021AD74 8100012A */  slti       $at, $16, 0x81
/* 11AE78 0021AD78 02002014 */  bnez       $at, .L0021AD84
/* 11AE7C 0021AD7C 00000000 */   nop
/* 11AE80 0021AD80 80001024 */  addiu      $16, $0, 0x80
.L0021AD84:
/* 11AE84 0021AD84 40010224 */  addiu      $2, $0, 0x140
/* 11AE88 0021AD88 7000A2AF */  sw         $2, 0x70($sp)
/* 11AE8C 0021AD8C 7400A0AF */  sw         $0, 0x74($sp)
/* 11AE90 0021AD90 7800A2AF */  sw         $2, 0x78($sp)
/* 11AE94 0021AD94 C0010224 */  addiu      $2, $0, 0x1C0
/* 11AE98 0021AD98 7C00A2AF */  sw         $2, 0x7C($sp)
/* 11AE9C 0021AD9C 2000A427 */  addiu      $4, $sp, 0x20
/* 11AEA0 0021ADA0 7000A527 */  addiu      $5, $sp, 0x70
/* 11AEA4 0021ADA4 2836A070 */  paddub     $6, $5, $0
/* 11AEA8 0021ADA8 40000724 */  addiu      $7, $0, 0x40
/* 11AEAC 0021ADAC 2846E070 */  paddub     $8, $7, $0
/* 11AEB0 0021ADB0 284EE070 */  paddub     $9, $7, $0
/* 11AEB4 0021ADB4 E4B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
/* 11AEB8 0021ADB8 00000000 */   nop
/* 11AEBC 0021ADBC 28260070 */  paddub     $4, $0, $0
/* 11AEC0 0021ADC0 18BC040C */  jal        MGSetGsTEXA__FP9sceGsTexa
/* 11AEC4 0021ADC4 00000000 */   nop
/* 11AEC8 0021ADC8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AECC 0021ADCC 5C82248C */  lw         $4, -0x7DA4($at)
/* 11AED0 0021ADD0 07000324 */  addiu      $3, $0, 0x7
/* 11AED4 0021ADD4 04008310 */  beq        $4, $3, .L0021ADE8
/* 11AED8 0021ADD8 00000000 */   nop
/* 11AEDC 0021ADDC 09000324 */  addiu      $3, $0, 0x9
/* 11AEE0 0021ADE0 04008314 */  bne        $4, $3, .L0021ADF4
/* 11AEE4 0021ADE4 00000000 */   nop
.L0021ADE8:
/* 11AEE8 0021ADE8 28260072 */  paddub     $4, $16, $0
/* 11AEEC 0021ADEC A0B4080C */  jal        AllFadeForMenu__Fi
/* 11AEF0 0021ADF0 00000000 */   nop
.L0021ADF4:
/* 11AEF4 0021ADF4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AEF8 0021ADF8 5C82248C */  lw         $4, -0x7DA4($at)
/* 11AEFC 0021ADFC 0A000324 */  addiu      $3, $0, 0xA
/* 11AF00 0021AE00 0F008314 */  bne        $4, $3, .L0021AE40
/* 11AF04 0021AE04 00000000 */   nop
/* 11AF08 0021AE08 05000224 */  addiu      $2, $0, 0x5
/* 11AF0C 0021AE0C DA01013C */  lui        $at, (0x1DA3B64 >> 16)
/* 11AF10 0021AE10 643B22AC */  sw         $2, (0x1DA3B64 & 0xFFFF)($at)
/* 11AF14 0021AE14 80000224 */  addiu      $2, $0, 0x80
/* 11AF18 0021AE18 DA01013C */  lui        $at, (0x1DA51E4 >> 16)
/* 11AF1C 0021AE1C E45122AC */  sw         $2, (0x1DA51E4 & 0xFFFF)($at)
/* 11AF20 0021AE20 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 11AF24 0021AE24 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 11AF28 0021AE28 B8000524 */  addiu      $5, $0, 0xB8
/* 11AF2C 0021AE2C 96000624 */  addiu      $6, $0, 0x96
/* 11AF30 0021AE30 F067080C */  jal        DrawMsgAtraWarning__FP6ClsMesii
/* 11AF34 0021AE34 00000000 */   nop
/* 11AF38 0021AE38 04000010 */  b          .L0021AE4C
/* 11AF3C 0021AE3C 00000000 */   nop
.L0021AE40:
/* 11AF40 0021AE40 FFFF0324 */  addiu      $3, $0, -0x1
/* 11AF44 0021AE44 DA01013C */  lui        $at, (0x1DA51CC >> 16)
/* 11AF48 0021AE48 CC5123AC */  sw         $3, (0x1DA51CC & 0xFFFF)($at)
.L0021AE4C:
/* 11AF4C 0021AE4C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AF50 0021AE50 5C82248C */  lw         $4, -0x7DA4($at)
/* 11AF54 0021AE54 08000324 */  addiu      $3, $0, 0x8
/* 11AF58 0021AE58 03008314 */  bne        $4, $3, .L0021AE68
/* 11AF5C 0021AE5C 00000000 */   nop
/* 11AF60 0021AE60 D0CC080C */  jal        EastKingEventDraw__Fv
/* 11AF64 0021AE64 00000000 */   nop
.L0021AE68:
/* 11AF68 0021AE68 1000BF7B */  lq         $31, 0x10($sp)
/* 11AF6C 0021AE6C 0000B07B */  lq         $16, 0x0($sp)
/* 11AF70 0021AE70 9000BD27 */  addiu      $sp, $sp, 0x90
/* 11AF74 0021AE74 0800E003 */  jr         $31
/* 11AF78 0021AE78 00000000 */   nop
/* 11AF7C 0021AE7C 00000000 */  nop
