.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel cosf
/* 1D7B0 0011D6B0 00600244 */  mfc1       $2, $f12
/* 1D7B4 0011D6B4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1D7B8 0011D6B8 2D204000 */  daddu      $4, $2, $0
/* 1D7BC 0011D6BC FF7F033C */  lui        $3, (0x7FFFFFFF >> 16)
/* 1D7C0 0011D6C0 FFFF6334 */  ori        $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 1D7C4 0011D6C4 493F023C */  lui        $2, (0x3F490FD8 >> 16)
/* 1D7C8 0011D6C8 24208300 */  and        $4, $4, $3
/* 1D7CC 0011D6CC D80F4234 */  ori        $2, $2, (0x3F490FD8 & 0xFFFF)
/* 1D7D0 0011D6D0 2A104400 */  slt        $2, $2, $4
/* 1D7D4 0011D6D4 06004014 */  bnez       $2, .L0011D6F0
/* 1D7D8 0011D6D8 1000BFFF */   sd        $31, 0x10($sp)
/* 1D7DC 0011D6DC 00688044 */  mtc1       $0, $f13
/* 1D7E0 0011D6E0 5E6F040C */  jal        __kernel_cosf
/* 1D7E4 0011D6E4 00000000 */   nop
/* 1D7E8 0011D6E8 29000010 */  b          .L0011D790
/* 1D7EC 0011D6EC 1000BFDF */   ld        $31, 0x10($sp)
.L0011D6F0:
/* 1D7F0 0011D6F0 7F7F023C */  lui        $2, (0x7F7FFFFF >> 16)
/* 1D7F4 0011D6F4 FFFF4234 */  ori        $2, $2, (0x7F7FFFFF & 0xFFFF)
/* 1D7F8 0011D6F8 2A104400 */  slt        $2, $2, $4
/* 1D7FC 0011D6FC 03004010 */  beqz       $2, .L0011D70C
/* 1D800 0011D700 00000000 */   nop
/* 1D804 0011D704 21000010 */  b          .L0011D78C
/* 1D808 0011D708 01600C46 */   sub.s     $f0, $f12, $f12
.L0011D70C:
/* 1D80C 0011D70C 346A040C */  jal        __ieee754_rem_pio2f
/* 1D810 0011D710 2D20A003 */   daddu     $4, $sp, $0
/* 1D814 0011D714 03004330 */  andi       $3, $2, 0x3
/* 1D818 0011D718 01000224 */  addiu      $2, $0, 0x1
/* 1D81C 0011D71C 0F006210 */  beq        $3, $2, .L0011D75C
/* 1D820 0011D720 02006228 */   slti      $2, $3, 0x2
/* 1D824 0011D724 05004010 */  beqz       $2, .L0011D73C
/* 1D828 0011D728 02000224 */   addiu     $2, $0, 0x2
/* 1D82C 0011D72C 07006010 */  beqz       $3, .L0011D74C
/* 1D830 0011D730 0000ACC7 */   lwc1      $f12, 0x0($sp)
/* 1D834 0011D734 13000010 */  b          .L0011D784
/* 1D838 0011D738 01000424 */   addiu     $4, $0, 0x1
.L0011D73C:
/* 1D83C 0011D73C 0D006210 */  beq        $3, $2, .L0011D774
/* 1D840 0011D740 0000ACC7 */   lwc1      $f12, 0x0($sp)
/* 1D844 0011D744 0F000010 */  b          .L0011D784
/* 1D848 0011D748 01000424 */   addiu     $4, $0, 0x1
.L0011D74C:
/* 1D84C 0011D74C 5E6F040C */  jal        __kernel_cosf
/* 1D850 0011D750 0400ADC7 */   lwc1      $f13, 0x4($sp)
/* 1D854 0011D754 0E000010 */  b          .L0011D790
/* 1D858 0011D758 1000BFDF */   ld        $31, 0x10($sp)
.L0011D75C:
/* 1D85C 0011D75C 0000ACC7 */  lwc1       $f12, 0x0($sp)
/* 1D860 0011D760 01000424 */  addiu      $4, $0, 0x1
/* 1D864 0011D764 0872040C */  jal        __kernel_sinf
/* 1D868 0011D768 0400ADC7 */   lwc1      $f13, 0x4($sp)
/* 1D86C 0011D76C 07000010 */  b          .L0011D78C
/* 1D870 0011D770 07000046 */   neg.s     $f0, $f0
.L0011D774:
/* 1D874 0011D774 5E6F040C */  jal        __kernel_cosf
/* 1D878 0011D778 0400ADC7 */   lwc1      $f13, 0x4($sp)
/* 1D87C 0011D77C 03000010 */  b          .L0011D78C
/* 1D880 0011D780 07000046 */   neg.s     $f0, $f0
.L0011D784:
/* 1D884 0011D784 0872040C */  jal        __kernel_sinf
/* 1D888 0011D788 0400ADC7 */   lwc1      $f13, 0x4($sp)
.L0011D78C:
/* 1D88C 0011D78C 1000BFDF */  ld         $31, 0x10($sp)
.L0011D790:
/* 1D890 0011D790 0800E003 */  jr         $31
/* 1D894 0011D794 2000BD27 */   addiu     $sp, $sp, 0x20
