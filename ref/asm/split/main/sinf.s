.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sinf
/* 01D9A0 0011D8A0 00600244 */  mfc1        $2, $f12
/* 01D9A4 0011D8A4 E0FFBD27 */  addiu       $29, $29, -0x20
/* 01D9A8 0011D8A8 2D204000 */  daddu       $4, $2, $0
/* 01D9AC 0011D8AC FF7F033C */  lui         $3, (0x7FFFFFFF >> 16)
/* 01D9B0 0011D8B0 FFFF6334 */  ori         $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 01D9B4 0011D8B4 493F023C */  lui         $2, (0x3F490FD8 >> 16)
/* 01D9B8 0011D8B8 24208300 */  and         $4, $4, $3
/* 01D9BC 0011D8BC D80F4234 */  ori         $2, $2, (0x3F490FD8 & 0xFFFF)
/* 01D9C0 0011D8C0 2A104400 */  slt         $2, $2, $4
/* 01D9C4 0011D8C4 06004014 */  bnez        $2, .L0011D8E0
/* 01D9C8 0011D8C8 1000BFFF */   sd         $31, 0x10($29)
/* 01D9CC 0011D8CC 00688044 */  mtc1        $0, $f13
/* 01D9D0 0011D8D0 0872040C */  jal         __kernel_sinf
/* 01D9D4 0011D8D4 2D200000 */   daddu      $4, $0, $0
/* 01D9D8 0011D8D8 2B000010 */  b           .L0011D988
/* 01D9DC 0011D8DC 1000BFDF */   ld         $31, 0x10($29)
.L0011D8E0:
/* 01D9E0 0011D8E0 7F7F023C */  lui         $2, (0x7F7FFFFF >> 16)
/* 01D9E4 0011D8E4 FFFF4234 */  ori         $2, $2, (0x7F7FFFFF & 0xFFFF)
/* 01D9E8 0011D8E8 2A104400 */  slt         $2, $2, $4
/* 01D9EC 0011D8EC 03004010 */  beqz        $2, .L0011D8FC
/* 01D9F0 0011D8F0 00000000 */   nop
/* 01D9F4 0011D8F4 23000010 */  b           .L0011D984
/* 01D9F8 0011D8F8 01600C46 */   sub.s      $f0, $f12, $f12
.L0011D8FC:
/* 01D9FC 0011D8FC 346A040C */  jal         __ieee754_rem_pio2f
/* 01DA00 0011D900 2D20A003 */   daddu      $4, $29, $0
/* 01DA04 0011D904 03004330 */  andi        $3, $2, 0x3
/* 01DA08 0011D908 01000224 */  addiu       $2, $0, 0x1
/* 01DA0C 0011D90C 10006210 */  beq         $3, $2, .L0011D950
/* 01DA10 0011D910 02006228 */   slti       $2, $3, 0x2
/* 01DA14 0011D914 05004010 */  beqz        $2, .L0011D92C
/* 01DA18 0011D918 02000224 */   addiu      $2, $0, 0x2
/* 01DA1C 0011D91C 07006010 */  beqz        $3, .L0011D93C
/* 01DA20 0011D920 0000ACC7 */   lwc1       $f12, 0x0($29)
/* 01DA24 0011D924 14000010 */  b           .L0011D978
/* 01DA28 0011D928 00000000 */   nop
.L0011D92C:
/* 01DA2C 0011D92C 0D006210 */  beq         $3, $2, .L0011D964
/* 01DA30 0011D930 0000ACC7 */   lwc1       $f12, 0x0($29)
/* 01DA34 0011D934 10000010 */  b           .L0011D978
/* 01DA38 0011D938 00000000 */   nop
.L0011D93C:
/* 01DA3C 0011D93C 01000424 */  addiu       $4, $0, 0x1
/* 01DA40 0011D940 0872040C */  jal         __kernel_sinf
/* 01DA44 0011D944 0400ADC7 */   lwc1       $f13, 0x4($29)
/* 01DA48 0011D948 0F000010 */  b           .L0011D988
/* 01DA4C 0011D94C 1000BFDF */   ld         $31, 0x10($29)
.L0011D950:
/* 01DA50 0011D950 0000ACC7 */  lwc1        $f12, 0x0($29)
/* 01DA54 0011D954 5E6F040C */  jal         __kernel_cosf
/* 01DA58 0011D958 0400ADC7 */   lwc1       $f13, 0x4($29)
/* 01DA5C 0011D95C 0A000010 */  b           .L0011D988
/* 01DA60 0011D960 1000BFDF */   ld         $31, 0x10($29)
.L0011D964:
/* 01DA64 0011D964 01000424 */  addiu       $4, $0, 0x1
/* 01DA68 0011D968 0872040C */  jal         __kernel_sinf
/* 01DA6C 0011D96C 0400ADC7 */   lwc1       $f13, 0x4($29)
/* 01DA70 0011D970 04000010 */  b           .L0011D984
/* 01DA74 0011D974 07000046 */   neg.s      $f0, $f0
.L0011D978:
/* 01DA78 0011D978 5E6F040C */  jal         __kernel_cosf
/* 01DA7C 0011D97C 0400ADC7 */   lwc1       $f13, 0x4($29)
/* 01DA80 0011D980 07000046 */  neg.s       $f0, $f0
.L0011D984:
/* 01DA84 0011D984 1000BFDF */  ld          $31, 0x10($29)
.L0011D988:
/* 01DA88 0011D988 0800E003 */  jr          $31
/* 01DA8C 0011D98C 2000BD27 */   addiu      $29, $29, 0x20
