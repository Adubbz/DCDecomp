.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel read_pad__FP10PAD_STATUSii
/* 2AA00 0012A900 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 2AA04 0012A904 9000BF7F */  sq         $31, 0x90($sp)
/* 2AA08 0012A908 8000BE7F */  sq         $fp, 0x80($sp)
/* 2AA0C 0012A90C 7000B77F */  sq         $23, 0x70($sp)
/* 2AA10 0012A910 6000B67F */  sq         $22, 0x60($sp)
/* 2AA14 0012A914 5000B57F */  sq         $21, 0x50($sp)
/* 2AA18 0012A918 4000B47F */  sq         $20, 0x40($sp)
/* 2AA1C 0012A91C 3000B37F */  sq         $19, 0x30($sp)
/* 2AA20 0012A920 2000B27F */  sq         $18, 0x20($sp)
/* 2AA24 0012A924 1000B17F */  sq         $17, 0x10($sp)
/* 2AA28 0012A928 0000B07F */  sq         $16, 0x0($sp)
/* 2AA2C 0012A92C 28BE8070 */  paddub     $23, $4, $0
/* 2AA30 0012A930 28B6A070 */  paddub     $22, $5, $0
/* 2AA34 0012A934 28AEC070 */  paddub     $21, $6, $0
/* 2AA38 0012A938 1400F026 */  addiu      $16, $23, 0x14
/* 2AA3C 0012A93C 1800F126 */  addiu      $17, $23, 0x18
/* 2AA40 0012A940 1C00FE26 */  addiu      $fp, $23, 0x1C
/* 2AA44 0012A944 2000F226 */  addiu      $18, $23, 0x20
/* 2AA48 0012A948 2400F326 */  addiu      $19, $23, 0x24
/* 2AA4C 0012A94C 2826C072 */  paddub     $4, $22, $0
/* 2AA50 0012A950 282EA072 */  paddub     $5, $21, $0
/* 2AA54 0012A954 D87E040C */  jal        scePadGetState
/* 2AA58 0012A958 00000000 */   nop
/* 2AA5C 0012A95C 000022AE */  sw         $2, 0x0($17)
/* 2AA60 0012A960 0000228E */  lw         $2, 0x0($17)
/* 2AA64 0012A964 02004014 */  bnez       $2, .L0012A970
/* 2AA68 0012A968 00000000 */   nop
/* 2AA6C 0012A96C 000000AE */  sw         $0, 0x0($16)
.L0012A970:
/* 2AA70 0012A970 28A60070 */  paddub     $20, $0, $0
/* 2AA74 0012A974 0000038E */  lw         $3, 0x0($16)
/* 2AA78 0012A978 47000224 */  addiu      $2, $0, 0x47
/* 2AA7C 0012A97C B4006210 */  beq        $3, $2, .L0012AC50
/* 2AA80 0012A980 00000000 */   nop
/* 2AA84 0012A984 46000224 */  addiu      $2, $0, 0x46
/* 2AA88 0012A988 8E006210 */  beq        $3, $2, .L0012ABC4
/* 2AA8C 0012A98C 00000000 */   nop
/* 2AA90 0012A990 2A000224 */  addiu      $2, $0, 0x2A
/* 2AA94 0012A994 81006210 */  beq        $3, $2, .L0012AB9C
/* 2AA98 0012A998 00000000 */   nop
/* 2AA9C 0012A99C 29000224 */  addiu      $2, $0, 0x29
/* 2AAA0 0012A9A0 70006210 */  beq        $3, $2, .L0012AB64
/* 2AAA4 0012A9A4 00000000 */   nop
/* 2AAA8 0012A9A8 28000224 */  addiu      $2, $0, 0x28
/* 2AAAC 0012A9AC 5E006210 */  beq        $3, $2, .L0012AB28
/* 2AAB0 0012A9B0 00000000 */   nop
/* 2AAB4 0012A9B4 03006010 */  beqz       $3, .L0012A9C4
/* 2AAB8 0012A9B8 00000000 */   nop
/* 2AABC 0012A9BC AF000010 */  b          .L0012AC7C
/* 2AAC0 0012A9C0 00000000 */   nop
.L0012A9C4:
/* 2AAC4 0012A9C4 0000238E */  lw         $3, 0x0($17)
/* 2AAC8 0012A9C8 06000224 */  addiu      $2, $0, 0x6
/* 2AACC 0012A9CC 04006210 */  beq        $3, $2, .L0012A9E0
/* 2AAD0 0012A9D0 00000000 */   nop
/* 2AAD4 0012A9D4 02000224 */  addiu      $2, $0, 0x2
/* 2AAD8 0012A9D8 C4006214 */  bne        $3, $2, .L0012ACEC
/* 2AADC 0012A9DC 00000000 */   nop
.L0012A9E0:
/* 2AAE0 0012A9E0 2826C072 */  paddub     $4, $22, $0
/* 2AAE4 0012A9E4 282EA072 */  paddub     $5, $21, $0
/* 2AAE8 0012A9E8 01000624 */  addiu      $6, $0, 0x1
/* 2AAEC 0012A9EC 283E0070 */  paddub     $7, $0, $0
/* 2AAF0 0012A9F0 D07F040C */  jal        scePadInfoMode
/* 2AAF4 0012A9F4 00000000 */   nop
/* 2AAF8 0012A9F8 288E4070 */  paddub     $17, $2, $0
/* 2AAFC 0012A9FC BB002012 */  beqz       $17, .L0012ACEC
/* 2AB00 0012AA00 00000000 */   nop
/* 2AB04 0012AA04 2826C072 */  paddub     $4, $22, $0
/* 2AB08 0012AA08 282EA072 */  paddub     $5, $21, $0
/* 2AB0C 0012AA0C 02000624 */  addiu      $6, $0, 0x2
/* 2AB10 0012AA10 283E0070 */  paddub     $7, $0, $0
/* 2AB14 0012AA14 D07F040C */  jal        scePadInfoMode
/* 2AB18 0012AA18 00000000 */   nop
/* 2AB1C 0012AA1C 0000C2AF */  sw         $2, 0x0($fp)
/* 2AB20 0012AA20 0000C28F */  lw         $2, 0x0($fp)
/* 2AB24 0012AA24 02004018 */  blez       $2, .L0012AA30
/* 2AB28 0012AA28 00000000 */   nop
/* 2AB2C 0012AA2C 288E4070 */  paddub     $17, $2, $0
.L0012AA30:
/* 2AB30 0012AA30 00030224 */  addiu      $2, $0, 0x300
/* 2AB34 0012AA34 34002212 */  beq        $17, $2, .L0012AB08
/* 2AB38 0012AA38 00000000 */   nop
/* 2AB3C 0012AA3C 00010224 */  addiu      $2, $0, 0x100
/* 2AB40 0012AA40 2D002212 */  beq        $17, $2, .L0012AAF8
/* 2AB44 0012AA44 00000000 */   nop
/* 2AB48 0012AA48 07000224 */  addiu      $2, $0, 0x7
/* 2AB4C 0012AA4C 26002212 */  beq        $17, $2, .L0012AAE8
/* 2AB50 0012AA50 00000000 */   nop
/* 2AB54 0012AA54 06000224 */  addiu      $2, $0, 0x6
/* 2AB58 0012AA58 1F002212 */  beq        $17, $2, .L0012AAD8
/* 2AB5C 0012AA5C 00000000 */   nop
/* 2AB60 0012AA60 05000224 */  addiu      $2, $0, 0x5
/* 2AB64 0012AA64 18002212 */  beq        $17, $2, .L0012AAC8
/* 2AB68 0012AA68 00000000 */   nop
/* 2AB6C 0012AA6C 04000224 */  addiu      $2, $0, 0x4
/* 2AB70 0012AA70 11002212 */  beq        $17, $2, .L0012AAB8
/* 2AB74 0012AA74 00000000 */   nop
/* 2AB78 0012AA78 03000224 */  addiu      $2, $0, 0x3
/* 2AB7C 0012AA7C 0A002212 */  beq        $17, $2, .L0012AAA8
/* 2AB80 0012AA80 00000000 */   nop
/* 2AB84 0012AA84 02000224 */  addiu      $2, $0, 0x2
/* 2AB88 0012AA88 03002212 */  beq        $17, $2, .L0012AA98
/* 2AB8C 0012AA8C 00000000 */   nop
/* 2AB90 0012AA90 21000010 */  b          .L0012AB18
/* 2AB94 0012AA94 00000000 */   nop
.L0012AA98:
/* 2AB98 0012AA98 63000224 */  addiu      $2, $0, 0x63
/* 2AB9C 0012AA9C 000002AE */  sw         $2, 0x0($16)
/* 2ABA0 0012AAA0 92000010 */  b          .L0012ACEC
/* 2ABA4 0012AAA4 00000000 */   nop
.L0012AAA8:
/* 2ABA8 0012AAA8 63000224 */  addiu      $2, $0, 0x63
/* 2ABAC 0012AAAC 000002AE */  sw         $2, 0x0($16)
/* 2ABB0 0012AAB0 8E000010 */  b          .L0012ACEC
/* 2ABB4 0012AAB4 00000000 */   nop
.L0012AAB8:
/* 2ABB8 0012AAB8 28000224 */  addiu      $2, $0, 0x28
/* 2ABBC 0012AABC 000002AE */  sw         $2, 0x0($16)
/* 2ABC0 0012AAC0 8A000010 */  b          .L0012ACEC
/* 2ABC4 0012AAC4 00000000 */   nop
.L0012AAC8:
/* 2ABC8 0012AAC8 63000224 */  addiu      $2, $0, 0x63
/* 2ABCC 0012AACC 000002AE */  sw         $2, 0x0($16)
/* 2ABD0 0012AAD0 86000010 */  b          .L0012ACEC
/* 2ABD4 0012AAD4 00000000 */   nop
.L0012AAD8:
/* 2ABD8 0012AAD8 63000224 */  addiu      $2, $0, 0x63
/* 2ABDC 0012AADC 000002AE */  sw         $2, 0x0($16)
/* 2ABE0 0012AAE0 82000010 */  b          .L0012ACEC
/* 2ABE4 0012AAE4 00000000 */   nop
.L0012AAE8:
/* 2ABE8 0012AAE8 46000224 */  addiu      $2, $0, 0x46
/* 2ABEC 0012AAEC 000002AE */  sw         $2, 0x0($16)
/* 2ABF0 0012AAF0 7E000010 */  b          .L0012ACEC
/* 2ABF4 0012AAF4 00000000 */   nop
.L0012AAF8:
/* 2ABF8 0012AAF8 63000224 */  addiu      $2, $0, 0x63
/* 2ABFC 0012AAFC 000002AE */  sw         $2, 0x0($16)
/* 2AC00 0012AB00 7A000010 */  b          .L0012ACEC
/* 2AC04 0012AB04 00000000 */   nop
.L0012AB08:
/* 2AC08 0012AB08 63000224 */  addiu      $2, $0, 0x63
/* 2AC0C 0012AB0C 000002AE */  sw         $2, 0x0($16)
/* 2AC10 0012AB10 76000010 */  b          .L0012ACEC
/* 2AC14 0012AB14 00000000 */   nop
.L0012AB18:
/* 2AC18 0012AB18 63000224 */  addiu      $2, $0, 0x63
/* 2AC1C 0012AB1C 000002AE */  sw         $2, 0x0($16)
/* 2AC20 0012AB20 72000010 */  b          .L0012ACEC
/* 2AC24 0012AB24 00000000 */   nop
.L0012AB28:
/* 2AC28 0012AB28 2826C072 */  paddub     $4, $22, $0
/* 2AC2C 0012AB2C 282EA072 */  paddub     $5, $21, $0
/* 2AC30 0012AB30 02000624 */  addiu      $6, $0, 0x2
/* 2AC34 0012AB34 283E0070 */  paddub     $7, $0, $0
/* 2AC38 0012AB38 D07F040C */  jal        scePadInfoMode
/* 2AC3C 0012AB3C 00000000 */   nop
/* 2AC40 0012AB40 05004014 */  bnez       $2, .L0012AB58
/* 2AC44 0012AB44 00000000 */   nop
/* 2AC48 0012AB48 63000224 */  addiu      $2, $0, 0x63
/* 2AC4C 0012AB4C 000002AE */  sw         $2, 0x0($16)
/* 2AC50 0012AB50 66000010 */  b          .L0012ACEC
/* 2AC54 0012AB54 00000000 */   nop
.L0012AB58:
/* 2AC58 0012AB58 0000028E */  lw         $2, 0x0($16)
/* 2AC5C 0012AB5C 01004224 */  addiu      $2, $2, 0x1
/* 2AC60 0012AB60 000002AE */  sw         $2, 0x0($16)
.L0012AB64:
/* 2AC64 0012AB64 2826C072 */  paddub     $4, $22, $0
/* 2AC68 0012AB68 282EA072 */  paddub     $5, $21, $0
/* 2AC6C 0012AB6C 01000624 */  addiu      $6, $0, 0x1
/* 2AC70 0012AB70 03000724 */  addiu      $7, $0, 0x3
/* 2AC74 0012AB74 1E80040C */  jal        scePadSetMainMode
/* 2AC78 0012AB78 00000000 */   nop
/* 2AC7C 0012AB7C 01000324 */  addiu      $3, $0, 0x1
/* 2AC80 0012AB80 5A004314 */  bne        $2, $3, .L0012ACEC
/* 2AC84 0012AB84 00000000 */   nop
/* 2AC88 0012AB88 0000028E */  lw         $2, 0x0($16)
/* 2AC8C 0012AB8C 01004224 */  addiu      $2, $2, 0x1
/* 2AC90 0012AB90 000002AE */  sw         $2, 0x0($16)
/* 2AC94 0012AB94 55000010 */  b          .L0012ACEC
/* 2AC98 0012AB98 00000000 */   nop
.L0012AB9C:
/* 2AC9C 0012AB9C 2826C072 */  paddub     $4, $22, $0
/* 2ACA0 0012ABA0 282EA072 */  paddub     $5, $21, $0
/* 2ACA4 0012ABA4 D87E040C */  jal        scePadGetState
/* 2ACA8 0012ABA8 00000000 */   nop
/* 2ACAC 0012ABAC 05000324 */  addiu      $3, $0, 0x5
/* 2ACB0 0012ABB0 4E004310 */  beq        $2, $3, .L0012ACEC
/* 2ACB4 0012ABB4 00000000 */   nop
/* 2ACB8 0012ABB8 000000AE */  sw         $0, 0x0($16)
/* 2ACBC 0012ABBC 4B000010 */  b          .L0012ACEC
/* 2ACC0 0012ABC0 00000000 */   nop
.L0012ABC4:
/* 2ACC4 0012ABC4 2826C072 */  paddub     $4, $22, $0
/* 2ACC8 0012ABC8 282EA072 */  paddub     $5, $21, $0
/* 2ACCC 0012ABCC FFFF0624 */  addiu      $6, $0, -0x1
/* 2ACD0 0012ABD0 283E0070 */  paddub     $7, $0, $0
/* 2ACD4 0012ABD4 407F040C */  jal        scePadInfoAct
/* 2ACD8 0012ABD8 00000000 */   nop
/* 2ACDC 0012ABDC 03004014 */  bnez       $2, .L0012ABEC
/* 2ACE0 0012ABE0 00000000 */   nop
/* 2ACE4 0012ABE4 63000224 */  addiu      $2, $0, 0x63
/* 2ACE8 0012ABE8 000002AE */  sw         $2, 0x0($16)
.L0012ABEC:
/* 2ACEC 0012ABEC 2E00E0A2 */  sb         $0, 0x2E($23)
/* 2ACF0 0012ABF0 01000224 */  addiu      $2, $0, 0x1
/* 2ACF4 0012ABF4 2F00E2A2 */  sb         $2, 0x2F($23)
/* 2ACF8 0012ABF8 02000424 */  addiu      $4, $0, 0x2
/* 2ACFC 0012ABFC 05000010 */  b          .L0012AC14
/* 2AD00 0012AC00 00000000 */   nop
.L0012AC04:
/* 2AD04 0012AC04 FF000324 */  addiu      $3, $0, 0xFF
/* 2AD08 0012AC08 21109700 */  addu       $2, $4, $23
/* 2AD0C 0012AC0C 2E0043A0 */  sb         $3, 0x2E($2)
/* 2AD10 0012AC10 01008424 */  addiu      $4, $4, 0x1
.L0012AC14:
/* 2AD14 0012AC14 06008228 */  slti       $2, $4, 0x6
/* 2AD18 0012AC18 FAFF4014 */  bnez       $2, .L0012AC04
/* 2AD1C 0012AC1C 00000000 */   nop
/* 2AD20 0012AC20 2826C072 */  paddub     $4, $22, $0
/* 2AD24 0012AC24 282EA072 */  paddub     $5, $21, $0
/* 2AD28 0012AC28 2E00E626 */  addiu      $6, $23, 0x2E
/* 2AD2C 0012AC2C 6480040C */  jal        scePadSetActAlign
/* 2AD30 0012AC30 00000000 */   nop
/* 2AD34 0012AC34 2D004010 */  beqz       $2, .L0012ACEC
/* 2AD38 0012AC38 00000000 */   nop
/* 2AD3C 0012AC3C 0000028E */  lw         $2, 0x0($16)
/* 2AD40 0012AC40 01004224 */  addiu      $2, $2, 0x1
/* 2AD44 0012AC44 000002AE */  sw         $2, 0x0($16)
/* 2AD48 0012AC48 28000010 */  b          .L0012ACEC
/* 2AD4C 0012AC4C 00000000 */   nop
.L0012AC50:
/* 2AD50 0012AC50 2826C072 */  paddub     $4, $22, $0
/* 2AD54 0012AC54 282EA072 */  paddub     $5, $21, $0
/* 2AD58 0012AC58 D87E040C */  jal        scePadGetState
/* 2AD5C 0012AC5C 00000000 */   nop
/* 2AD60 0012AC60 05000324 */  addiu      $3, $0, 0x5
/* 2AD64 0012AC64 21004310 */  beq        $2, $3, .L0012ACEC
/* 2AD68 0012AC68 00000000 */   nop
/* 2AD6C 0012AC6C 63000224 */  addiu      $2, $0, 0x63
/* 2AD70 0012AC70 000002AE */  sw         $2, 0x0($16)
/* 2AD74 0012AC74 1D000010 */  b          .L0012ACEC
/* 2AD78 0012AC78 00000000 */   nop
.L0012AC7C:
/* 2AD7C 0012AC7C 0000238E */  lw         $3, 0x0($17)
/* 2AD80 0012AC80 06000224 */  addiu      $2, $0, 0x6
/* 2AD84 0012AC84 04006210 */  beq        $3, $2, .L0012AC98
/* 2AD88 0012AC88 00000000 */   nop
/* 2AD8C 0012AC8C 02000224 */  addiu      $2, $0, 0x2
/* 2AD90 0012AC90 16006214 */  bne        $3, $2, .L0012ACEC
/* 2AD94 0012AC94 00000000 */   nop
.L0012AC98:
/* 2AD98 0012AC98 2826E072 */  paddub     $4, $23, $0
/* 2AD9C 0012AC9C 282EC072 */  paddub     $5, $22, $0
/* 2ADA0 0012ACA0 2836A072 */  paddub     $6, $21, $0
/* 2ADA4 0012ACA4 0CAA040C */  jal        pad_button_read__FP10PAD_STATUSii
/* 2ADA8 0012ACA8 00000000 */   nop
/* 2ADAC 0012ACAC 000042AE */  sw         $2, 0x0($18)
/* 2ADB0 0012ACB0 0E004010 */  beqz       $2, .L0012ACEC
/* 2ADB4 0012ACB4 00000000 */   nop
/* 2ADB8 0012ACB8 0000638E */  lw         $3, 0x0($19)
/* 2ADBC 0012ACBC 08006010 */  beqz       $3, .L0012ACE0
/* 2ADC0 0012ACC0 00000000 */   nop
/* 2ADC4 0012ACC4 0000428E */  lw         $2, 0x0($18)
/* 2ADC8 0012ACC8 05004310 */  beq        $2, $3, .L0012ACE0
/* 2ADCC 0012ACCC 00000000 */   nop
/* 2ADD0 0012ACD0 000060AE */  sw         $0, 0x0($19)
/* 2ADD4 0012ACD4 000000AE */  sw         $0, 0x0($16)
/* 2ADD8 0012ACD8 02000010 */  b          .L0012ACE4
/* 2ADDC 0012ACDC 00000000 */   nop
.L0012ACE0:
/* 2ADE0 0012ACE0 01001424 */  addiu      $20, $0, 0x1
.L0012ACE4:
/* 2ADE4 0012ACE4 0000428E */  lw         $2, 0x0($18)
/* 2ADE8 0012ACE8 000062AE */  sw         $2, 0x0($19)
.L0012ACEC:
/* 2ADEC 0012ACEC 07008016 */  bnez       $20, .L0012AD0C
/* 2ADF0 0012ACF0 00000000 */   nop
/* 2ADF4 0012ACF4 0000E0AE */  sw         $0, 0x0($23)
/* 2ADF8 0012ACF8 80000224 */  addiu      $2, $0, 0x80
/* 2ADFC 0012ACFC 0400E2AE */  sw         $2, 0x4($23)
/* 2AE00 0012AD00 0800E2AE */  sw         $2, 0x8($23)
/* 2AE04 0012AD04 0C00E2AE */  sw         $2, 0xC($23)
/* 2AE08 0012AD08 1000E2AE */  sw         $2, 0x10($23)
.L0012AD0C:
/* 2AE0C 0012AD0C 0000438E */  lw         $3, 0x0($18)
/* 2AE10 0012AD10 04000224 */  addiu      $2, $0, 0x4
/* 2AE14 0012AD14 06006214 */  bne        $3, $2, .L0012AD30
/* 2AE18 0012AD18 00000000 */   nop
/* 2AE1C 0012AD1C 80000224 */  addiu      $2, $0, 0x80
/* 2AE20 0012AD20 0400E2AE */  sw         $2, 0x4($23)
/* 2AE24 0012AD24 0800E2AE */  sw         $2, 0x8($23)
/* 2AE28 0012AD28 0C00E2AE */  sw         $2, 0xC($23)
/* 2AE2C 0012AD2C 1000E2AE */  sw         $2, 0x10($23)
.L0012AD30:
/* 2AE30 0012AD30 28160070 */  paddub     $2, $0, $0
/* 2AE34 0012AD34 9000BF7B */  lq         $31, 0x90($sp)
/* 2AE38 0012AD38 8000BE7B */  lq         $fp, 0x80($sp)
/* 2AE3C 0012AD3C 7000B77B */  lq         $23, 0x70($sp)
/* 2AE40 0012AD40 6000B67B */  lq         $22, 0x60($sp)
/* 2AE44 0012AD44 5000B57B */  lq         $21, 0x50($sp)
/* 2AE48 0012AD48 4000B47B */  lq         $20, 0x40($sp)
/* 2AE4C 0012AD4C 3000B37B */  lq         $19, 0x30($sp)
/* 2AE50 0012AD50 2000B27B */  lq         $18, 0x20($sp)
/* 2AE54 0012AD54 1000B17B */  lq         $17, 0x10($sp)
/* 2AE58 0012AD58 0000B07B */  lq         $16, 0x0($sp)
/* 2AE5C 0012AD5C A000BD27 */  addiu      $sp, $sp, 0xA0
/* 2AE60 0012AD60 0800E003 */  jr         $31
/* 2AE64 0012AD64 00000000 */   nop
/* 2AE68 0012AD68 00000000 */  nop
/* 2AE6C 0012AD6C 00000000 */  nop
