.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitItemPolygonView__FiP1
/* 12AD30 0022AC30 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 12AD34 0022AC34 1000BF7F */  sq         $31, 0x10($sp)
/* 12AD38 0022AC38 0000B07F */  sq         $16, 0x0($sp)
/* 12AD3C 0022AC3C 28368070 */  paddub     $6, $4, $0
/* 12AD40 0022AC40 2886A070 */  paddub     $16, $5, $0
/* 12AD44 0022AC44 5100C228 */  slti       $2, $6, 0x51
/* 12AD48 0022AC48 04004014 */  bnez       $2, .L0022AC5C
/* 12AD4C 0022AC4C 00000000 */   nop
/* 12AD50 0022AC50 0101C228 */  slti       $2, $6, 0x101
/* 12AD54 0022AC54 04004014 */  bnez       $2, .L0022AC68
/* 12AD58 0022AC58 00000000 */   nop
.L0022AC5C:
/* 12AD5C 0022AC5C 28160070 */  paddub     $2, $0, $0
/* 12AD60 0022AC60 2A000010 */  b          .L0022AD0C
/* 12AD64 0022AC64 00000000 */   nop
.L0022AC68:
/* 12AD68 0022AC68 2000A427 */  addiu      $4, $sp, 0x20
/* 12AD6C 0022AC6C 6000A527 */  addiu      $5, $sp, 0x60
/* 12AD70 0022AC70 48DC060C */  jal        BtGetItemNamePath__FPcPci
/* 12AD74 0022AC74 00000000 */   nop
/* 12AD78 0022AC78 30FB040C */  jal        StartReadBG__Fv
/* 12AD7C 0022AC7C 00000000 */   nop
/* 12AD80 0022AC80 989780AF */  sw         $0, -0x6868($gp)
/* 12AD84 0022AC84 28260072 */  paddub     $4, $16, $0
/* 12AD88 0022AC88 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 12AD8C 0022AC8C 00000000 */   nop
/* 12AD90 0022AC90 28864070 */  paddub     $16, $2, $0
/* 12AD94 0022AC94 2000A427 */  addiu      $4, $sp, 0x20
/* 12AD98 0022AC98 282E0072 */  paddub     $5, $16, $0
/* 12AD9C 0022AC9C AC00A627 */  addiu      $6, $sp, 0xAC
/* 12ADA0 0022ACA0 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 12ADA4 0022ACA4 00000000 */   nop
/* 12ADA8 0022ACA8 04004014 */  bnez       $2, .L0022ACBC
/* 12ADAC 0022ACAC 00000000 */   nop
/* 12ADB0 0022ACB0 01000224 */  addiu      $2, $0, 0x1
/* 12ADB4 0022ACB4 15000010 */  b          .L0022AD0C
/* 12ADB8 0022ACB8 00000000 */   nop
.L0022ACBC:
/* 12ADBC 0022ACBC AC00A28F */  lw         $2, 0xAC($sp)
/* 12ADC0 0022ACC0 03110200 */  sra        $2, $2, 4
/* 12ADC4 0022ACC4 00110200 */  sll        $2, $2, 4
/* 12ADC8 0022ACC8 21100202 */  addu       $2, $16, $2
/* 12ADCC 0022ACCC 10004224 */  addiu      $2, $2, 0x10
/* 12ADD0 0022ACD0 28264070 */  paddub     $4, $2, $0
/* 12ADD4 0022ACD4 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 12ADD8 0022ACD8 00000000 */   nop
/* 12ADDC 0022ACDC 6000A427 */  addiu      $4, $sp, 0x60
/* 12ADE0 0022ACE0 282E4070 */  paddub     $5, $2, $0
/* 12ADE4 0022ACE4 AC00A627 */  addiu      $6, $sp, 0xAC
/* 12ADE8 0022ACE8 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 12ADEC 0022ACEC 00000000 */   nop
/* 12ADF0 0022ACF0 04004014 */  bnez       $2, .L0022AD04
/* 12ADF4 0022ACF4 00000000 */   nop
/* 12ADF8 0022ACF8 01000224 */  addiu      $2, $0, 0x1
/* 12ADFC 0022ACFC 03000010 */  b          .L0022AD0C
/* 12AE00 0022AD00 00000000 */   nop
.L0022AD04:
/* 12AE04 0022AD04 949780AF */  sw         $0, -0x686C($gp)
/* 12AE08 0022AD08 28160070 */  paddub     $2, $0, $0
.L0022AD0C:
/* 12AE0C 0022AD0C 1000BF7B */  lq         $31, 0x10($sp)
/* 12AE10 0022AD10 0000B07B */  lq         $16, 0x0($sp)
/* 12AE14 0022AD14 B000BD27 */  addiu      $sp, $sp, 0xB0
/* 12AE18 0022AD18 0800E003 */  jr         $31
/* 12AE1C 0022AD1C 00000000 */   nop
