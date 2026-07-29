.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ieee754_sqrtf
/* 01ADB0 0011ACB0 00600244 */  mfc1        $2, $f12
/* 01ADB4 0011ACB4 2D284000 */  daddu       $5, $2, $0
/* 01ADB8 0011ACB8 807F033C */  lui         $3, (0x7F800000 >> 16)
/* 01ADBC 0011ACBC 2410A300 */  and         $2, $5, $3
/* 01ADC0 0011ACC0 05004314 */  bne         $2, $3, .L0011ACD8
/* 01ADC4 0011ACC4 00000000 */   nop
/* 01ADC8 0011ACC8 02600C46 */  mul.s       $f0, $f12, $f12
/* 01ADCC 0011ACCC 0800E003 */  jr          $31
/* 01ADD0 0011ACD0 00000C46 */   add.s      $f0, $f0, $f12
/* 01ADD4 0011ACD4 00000000 */  nop
.L0011ACD8:
/* 01ADD8 0011ACD8 0E00A01C */  bgtz        $5, .L0011AD14
/* 01ADDC 0011ACDC C3350500 */   sra        $6, $5, 23
/* 01ADE0 0011ACE0 FF7F023C */  lui         $2, (0x7FFFFFFF >> 16)
/* 01ADE4 0011ACE4 FFFF4234 */  ori         $2, $2, (0x7FFFFFFF & 0xFFFF)
/* 01ADE8 0011ACE8 2410A200 */  and         $2, $5, $2
/* 01ADEC 0011ACEC 07004010 */  beqz        $2, .L0011AD0C
/* 01ADF0 0011ACF0 06600046 */   mov.s      $f0, $f12
/* 01ADF4 0011ACF4 0700A104 */  bgez        $5, .L0011AD14
/* 01ADF8 0011ACF8 00000000 */   nop
/* 01ADFC 0011ACFC 01600C46 */  sub.s       $f0, $f12, $f12
/* 01AE00 0011AD00 00000000 */  nop
/* 01AE04 0011AD04 00000000 */  nop
/* 01AE08 0011AD08 03000046 */  div.s       $f0, $f0, $f0
.L0011AD0C:
/* 01AE0C 0011AD0C 0800E003 */  jr          $31
/* 01AE10 0011AD10 00000000 */   nop
.L0011AD14:
/* 01AE14 0011AD14 1200C014 */  bnez        $6, .L0011AD60
/* 01AE18 0011AD18 7F00023C */   lui        $2, (0x7FFFFF >> 16)
/* 01AE1C 0011AD1C 8000023C */  lui         $2, (0x800000 >> 16)
/* 01AE20 0011AD20 2410A200 */  and         $2, $5, $2
/* 01AE24 0011AD24 0B004014 */  bnez        $2, .L0011AD54
/* 01AE28 0011AD28 2D200000 */   daddu      $4, $0, $0
/* 01AE2C 0011AD2C 01000324 */  addiu       $3, $0, 0x1
.L0011AD30:
/* 01AE30 0011AD30 40280500 */  sll         $5, $5, 1
/* 01AE34 0011AD34 8000023C */  lui         $2, (0x800000 >> 16)
/* 01AE38 0011AD38 2410A200 */  and         $2, $5, $2
/* 01AE3C 0011AD3C 01008424 */  addiu       $4, $4, 0x1
/* 01AE40 0011AD40 00000000 */  nop
/* 01AE44 0011AD44 FAFF4010 */  beqz        $2, .L0011AD30
/* 01AE48 0011AD48 00000000 */   nop
/* 01AE4C 0011AD4C 03000010 */  b           .L0011AD5C
/* 01AE50 0011AD50 23306400 */   subu       $6, $3, $4
.L0011AD54:
/* 01AE54 0011AD54 01000324 */  addiu       $3, $0, 0x1
/* 01AE58 0011AD58 23306400 */  subu        $6, $3, $4
.L0011AD5C:
/* 01AE5C 0011AD5C 7F00023C */  lui         $2, (0x7FFFFF >> 16)
.L0011AD60:
/* 01AE60 0011AD60 81FFC624 */  addiu       $6, $6, -0x7F
/* 01AE64 0011AD64 FFFF4234 */  ori         $2, $2, (0x7FFFFF & 0xFFFF)
/* 01AE68 0011AD68 0100C430 */  andi        $4, $6, 0x1
/* 01AE6C 0011AD6C 8000033C */  lui         $3, (0x800000 >> 16)
/* 01AE70 0011AD70 2410A200 */  and         $2, $5, $2
/* 01AE74 0011AD74 43300600 */  sra         $6, $6, 1
/* 01AE78 0011AD78 25284300 */  or          $5, $2, $3
/* 01AE7C 0011AD7C 04288500 */  sllv        $5, $5, $4
/* 01AE80 0011AD80 C0450600 */  sll         $8, $6, 23
/* 01AE84 0011AD84 40280500 */  sll         $5, $5, 1
/* 01AE88 0011AD88 2D380000 */  daddu       $7, $0, $0
/* 01AE8C 0011AD8C 2D200000 */  daddu       $4, $0, $0
/* 01AE90 0011AD90 0001063C */  lui         $6, (0x1000000 >> 16)
/* 01AE94 0011AD94 00000000 */  nop
.L0011AD98:
/* 01AE98 0011AD98 2118E600 */  addu        $3, $7, $6
/* 01AE9C 0011AD9C 2A10A300 */  slt         $2, $5, $3
/* 01AEA0 0011ADA0 05004054 */  bnel        $2, $0, .L0011ADB8
/* 01AEA4 0011ADA4 42300600 */   srl        $6, $6, 1
/* 01AEA8 0011ADA8 2328A300 */  subu        $5, $5, $3
/* 01AEAC 0011ADAC 21386600 */  addu        $7, $3, $6
/* 01AEB0 0011ADB0 21208600 */  addu        $4, $4, $6
/* 01AEB4 0011ADB4 42300600 */  srl         $6, $6, 1
.L0011ADB8:
/* 01AEB8 0011ADB8 F7FFC014 */  bnez        $6, .L0011AD98
/* 01AEBC 0011ADBC 40280500 */   sll        $5, $5, 1
/* 01AEC0 0011ADC0 0200A010 */  beqz        $5, .L0011ADCC
/* 01AEC4 0011ADC4 01008230 */   andi       $2, $4, 0x1
/* 01AEC8 0011ADC8 21208200 */  addu        $4, $4, $2
.L0011ADCC:
/* 01AECC 0011ADCC 43200400 */  sra         $4, $4, 1
/* 01AED0 0011ADD0 003F033C */  lui         $3, (0x3F000000 >> 16)
/* 01AED4 0011ADD4 21288300 */  addu        $5, $4, $3
/* 01AED8 0011ADD8 2110A800 */  addu        $2, $5, $8
/* 01AEDC 0011ADDC 00008244 */  mtc1        $2, $f0
/* 01AEE0 0011ADE0 0800E003 */  jr          $31
/* 01AEE4 0011ADE4 00000000 */   nop
