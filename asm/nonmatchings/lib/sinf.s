.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sinf
/* 1D9A0 0011D8A0 00600244 */  mfc1       $2, $f12
/* 1D9A4 0011D8A4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1D9A8 0011D8A8 2D204000 */  daddu      $4, $2, $0
/* 1D9AC 0011D8AC FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 1D9B0 0011D8B0 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 1D9B4 0011D8B4 493F023C */  lui        $2, (0x3F490FD8 >> 16)
/* 1D9B8 0011D8B8 24208300 */  and        $4, $4, $3
/* 1D9BC 0011D8BC D80F4234 */  ori        $2, $2, (0x3F490FD8 & 0xFFFF)
/* 1D9C0 0011D8C0 2A104400 */  slt        $2, $2, $4
/* 1D9C4 0011D8C4 06004014 */  bnez       $2, .L0011D8E0
/* 1D9C8 0011D8C8 1000BFFF */   sd        $31, 0x10($sp)
/* 1D9CC 0011D8CC 00688044 */  mtc1       $0, $f13
/* 1D9D0 0011D8D0 0872040C */  jal        __kernel_sinf
/* 1D9D4 0011D8D4 2D200000 */   daddu     $4, $0, $0
/* 1D9D8 0011D8D8 2B000010 */  b          .L0011D988
/* 1D9DC 0011D8DC 1000BFDF */   ld        $31, 0x10($sp)
.L0011D8E0:
/* 1D9E0 0011D8E0 7F7F023C */  lui        $2, (0x7F7FFFFF >> 16)
/* 1D9E4 0011D8E4 FFFF4234 */  ori        $2, $2, (0x7F7FFFFF & 0xFFFF)
/* 1D9E8 0011D8E8 2A104400 */  slt        $2, $2, $4
/* 1D9EC 0011D8EC 03004010 */  beqz       $2, .L0011D8FC
/* 1D9F0 0011D8F0 00000000 */   nop
/* 1D9F4 0011D8F4 23000010 */  b          .L0011D984
/* 1D9F8 0011D8F8 01600C46 */   sub.s     $f0, $f12, $f12
.L0011D8FC:
/* 1D9FC 0011D8FC 346A040C */  jal        __ieee754_rem_pio2f
/* 1DA00 0011D900 2D20A003 */   daddu     $4, $sp, $0
/* 1DA04 0011D904 03004330 */  andi       $3, $2, 0x3
/* 1DA08 0011D908 01000224 */  addiu      $2, $0, 0x1
/* 1DA0C 0011D90C 10006210 */  beq        $3, $2, .L0011D950
/* 1DA10 0011D910 02006228 */   slti      $2, $3, 0x2
/* 1DA14 0011D914 05004010 */  beqz       $2, .L0011D92C
/* 1DA18 0011D918 02000224 */   addiu     $2, $0, 0x2
/* 1DA1C 0011D91C 07006010 */  beqz       $3, .L0011D93C
/* 1DA20 0011D920 0000ACC7 */   lwc1      $f12, 0x0($sp)
/* 1DA24 0011D924 14000010 */  b          .L0011D978
/* 1DA28 0011D928 00000000 */   nop
.L0011D92C:
/* 1DA2C 0011D92C 0D006210 */  beq        $3, $2, .L0011D964
/* 1DA30 0011D930 0000ACC7 */   lwc1      $f12, 0x0($sp)
/* 1DA34 0011D934 10000010 */  b          .L0011D978
/* 1DA38 0011D938 00000000 */   nop
.L0011D93C:
/* 1DA3C 0011D93C 01000424 */  addiu      $4, $0, 0x1
/* 1DA40 0011D940 0872040C */  jal        __kernel_sinf
/* 1DA44 0011D944 0400ADC7 */   lwc1      $f13, 0x4($sp)
/* 1DA48 0011D948 0F000010 */  b          .L0011D988
/* 1DA4C 0011D94C 1000BFDF */   ld        $31, 0x10($sp)
.L0011D950:
/* 1DA50 0011D950 0000ACC7 */  lwc1       $f12, 0x0($sp)
/* 1DA54 0011D954 5E6F040C */  jal        __kernel_cosf
/* 1DA58 0011D958 0400ADC7 */   lwc1      $f13, 0x4($sp)
/* 1DA5C 0011D95C 0A000010 */  b          .L0011D988
/* 1DA60 0011D960 1000BFDF */   ld        $31, 0x10($sp)
.L0011D964:
/* 1DA64 0011D964 01000424 */  addiu      $4, $0, 0x1
/* 1DA68 0011D968 0872040C */  jal        __kernel_sinf
/* 1DA6C 0011D96C 0400ADC7 */   lwc1      $f13, 0x4($sp)
/* 1DA70 0011D970 04000010 */  b          .L0011D984
/* 1DA74 0011D974 07000046 */   neg.s     $f0, $f0
.L0011D978:
/* 1DA78 0011D978 5E6F040C */  jal        __kernel_cosf
/* 1DA7C 0011D97C 0400ADC7 */   lwc1      $f13, 0x4($sp)
/* 1DA80 0011D980 07000046 */  neg.s      $f0, $f0
.L0011D984:
/* 1DA84 0011D984 1000BFDF */  ld         $31, 0x10($sp)
.L0011D988:
/* 1DA88 0011D988 0800E003 */  jr         $31
/* 1DA8C 0011D98C 2000BD27 */   addiu     $sp, $sp, 0x20
