.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel HamonProcess__Fv
/* 01C900 01DC8600 90FFBD27 */  addiu       $29, $29, -0x70
/* 01C904 01DC8604 4000BF7F */  sq          $31, 0x40($29)
/* 01C908 01DC8608 3000B37F */  sq          $19, 0x30($29)
/* 01C90C 01DC860C 2000B27F */  sq          $18, 0x20($29)
/* 01C910 01DC8610 1000B17F */  sq          $17, 0x10($29)
/* 01C914 01DC8614 0000B07F */  sq          $16, 0x0($29)
/* 01C918 01DC8618 5000A427 */  addiu       $4, $29, 0x50
/* 01C91C 01DC861C 2500023C */  lui         $2, %hi(ambientlight)
/* 01C920 01DC8620 001C4524 */  addiu       $5, $2, %lo(ambientlight)
/* 01C924 01DC8624 0C86040C */  jal         sceVu0CopyVector
/* 01C928 01DC8628 00000000 */   nop
/* 01C92C 01DC862C 28860070 */  paddub      $16, $0, $0
/* 01C930 01DC8630 B0000010 */  b           .L01DC88F4_2CE0F4
/* 01C934 01DC8634 00000000 */   nop
.L01DC8638_2CDE38:
/* 01C938 01DC8638 0898828F */  lw          $2, -0x67F8($28)
/* 01C93C 01DC863C 0E004014 */  bnez        $2, .L01DC8678_2CDE78
/* 01C940 01DC8640 00000000 */   nop
/* 01C944 01DC8644 80181000 */  sll         $3, $16, 2
/* 01C948 01DC8648 E301023C */  lui         $2, %hi(HScale)
/* 01C94C 01DC864C C0D24224 */  addiu       $2, $2, %lo(HScale)
/* 01C950 01DC8650 21104300 */  addu        $2, $2, $3
/* 01C954 01DC8654 000041C4 */  lwc1        $f1, 0x0($2)
/* 01C958 01DC8658 C88280C7 */  lwc1        $f0, -0x7D38($28)
/* 01C95C 01DC865C 34080046 */  c.lt.s      $f1, $f0
/* 01C960 01DC8660 00000000 */  nop
/* 01C964 01DC8664 04000045 */  bc1f        .L01DC8678_2CDE78
/* 01C968 01DC8668 00000000 */   nop
/* 01C96C 01DC866C EC8380C7 */  lwc1        $f0, -0x7C14($28)
/* 01C970 01DC8670 00080046 */  add.s       $f0, $f1, $f0
/* 01C974 01DC8674 000040E4 */  swc1        $f0, 0x0($2)
.L01DC8678_2CDE78:
/* 01C978 01DC8678 80881000 */  sll         $17, $16, 2
/* 01C97C 01DC867C E301023C */  lui         $2, %hi(HScale)
/* 01C980 01DC8680 C0D24224 */  addiu       $2, $2, %lo(HScale)
/* 01C984 01DC8684 21985100 */  addu        $19, $2, $17
/* 01C988 01DC8688 000061C6 */  lwc1        $f1, 0x0($19)
/* 01C98C 01DC868C 00008044 */  mtc1        $0, $f0
/* 01C990 01DC8690 00000000 */  nop
/* 01C994 01DC8694 36080046 */  c.le.s      $f1, $f0
/* 01C998 01DC8698 00000000 */  nop
/* 01C99C 01DC869C 94000145 */  bc1t        .L01DC88F0_2CE0F0
/* 01C9A0 01DC86A0 00000000 */   nop
/* 01C9A4 01DC86A4 DE01023C */  lui         $2, %hi(se$1302)
/* 01C9A8 01DC86A8 D0B04224 */  addiu       $2, $2, %lo(se$1302)
/* 01C9AC 01DC86AC 21905100 */  addu        $18, $2, $17
/* 01C9B0 01DC86B0 0000428E */  lw          $2, 0x0($18)
/* 01C9B4 01DC86B4 3A004014 */  bnez        $2, .L01DC87A0_2CDFA0
/* 01C9B8 01DC86B8 00000000 */   nop
/* 01C9BC 01DC86BC 04000224 */  addiu       $2, $0, 0x4
/* 01C9C0 01DC86C0 2F000212 */  beq         $16, $2, .L01DC8780_2CDF80
/* 01C9C4 01DC86C4 00000000 */   nop
/* 01C9C8 01DC86C8 03000224 */  addiu       $2, $0, 0x3
/* 01C9CC 01DC86CC 24000212 */  beq         $16, $2, .L01DC8760_2CDF60
/* 01C9D0 01DC86D0 00000000 */   nop
/* 01C9D4 01DC86D4 02000224 */  addiu       $2, $0, 0x2
/* 01C9D8 01DC86D8 19000212 */  beq         $16, $2, .L01DC8740_2CDF40
/* 01C9DC 01DC86DC 00000000 */   nop
/* 01C9E0 01DC86E0 01000224 */  addiu       $2, $0, 0x1
/* 01C9E4 01DC86E4 0E000212 */  beq         $16, $2, .L01DC8720_2CDF20
/* 01C9E8 01DC86E8 00000000 */   nop
/* 01C9EC 01DC86EC 03000012 */  beqz        $16, .L01DC86FC_2CDEFC
/* 01C9F0 01DC86F0 00000000 */   nop
/* 01C9F4 01DC86F4 28000010 */  b           .L01DC8798_2CDF98
/* 01C9F8 01DC86F8 00000000 */   nop
.L01DC86FC_2CDEFC:
/* 01C9FC 01DC86FC 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 01CA00 01DC8700 00608244 */  mtc1        $2, $f12
/* 01CA04 01DC8704 0E000424 */  addiu       $4, $0, 0xE
/* 01CA08 01DC8708 28000524 */  addiu       $5, $0, 0x28
/* 01CA0C 01DC870C 2E000624 */  addiu       $6, $0, 0x2E
/* 01CA10 01DC8710 84C4760C */  jal         OpPlayVolSE__Fiiif
/* 01CA14 01DC8714 00000000 */   nop
/* 01CA18 01DC8718 1F000010 */  b           .L01DC8798_2CDF98
/* 01CA1C 01DC871C 00000000 */   nop
.L01DC8720_2CDF20:
/* 01CA20 01DC8720 0E000424 */  addiu       $4, $0, 0xE
/* 01CA24 01DC8724 28000524 */  addiu       $5, $0, 0x28
/* 01CA28 01DC8728 2E000624 */  addiu       $6, $0, 0x2E
/* 01CA2C 01DC872C 70818CC7 */  lwc1        $f12, -0x7E90($28)
/* 01CA30 01DC8730 84C4760C */  jal         OpPlayVolSE__Fiiif
/* 01CA34 01DC8734 00000000 */   nop
/* 01CA38 01DC8738 17000010 */  b           .L01DC8798_2CDF98
/* 01CA3C 01DC873C 00000000 */   nop
.L01DC8740_2CDF40:
/* 01CA40 01DC8740 0E000424 */  addiu       $4, $0, 0xE
/* 01CA44 01DC8744 28000524 */  addiu       $5, $0, 0x28
/* 01CA48 01DC8748 2E000624 */  addiu       $6, $0, 0x2E
/* 01CA4C 01DC874C A0808CC7 */  lwc1        $f12, -0x7F60($28)
/* 01CA50 01DC8750 84C4760C */  jal         OpPlayVolSE__Fiiif
/* 01CA54 01DC8754 00000000 */   nop
/* 01CA58 01DC8758 0F000010 */  b           .L01DC8798_2CDF98
/* 01CA5C 01DC875C 00000000 */   nop
.L01DC8760_2CDF60:
/* 01CA60 01DC8760 0E000424 */  addiu       $4, $0, 0xE
/* 01CA64 01DC8764 28000524 */  addiu       $5, $0, 0x28
/* 01CA68 01DC8768 2E000624 */  addiu       $6, $0, 0x2E
/* 01CA6C 01DC876C 00848CC7 */  lwc1        $f12, -0x7C00($28)
/* 01CA70 01DC8770 84C4760C */  jal         OpPlayVolSE__Fiiif
/* 01CA74 01DC8774 00000000 */   nop
/* 01CA78 01DC8778 07000010 */  b           .L01DC8798_2CDF98
/* 01CA7C 01DC877C 00000000 */   nop
.L01DC8780_2CDF80:
/* 01CA80 01DC8780 0E000424 */  addiu       $4, $0, 0xE
/* 01CA84 01DC8784 28000524 */  addiu       $5, $0, 0x28
/* 01CA88 01DC8788 2E000624 */  addiu       $6, $0, 0x2E
/* 01CA8C 01DC878C 90828CC7 */  lwc1        $f12, -0x7D70($28)
/* 01CA90 01DC8790 84C4760C */  jal         OpPlayVolSE__Fiiif
/* 01CA94 01DC8794 00000000 */   nop
.L01DC8798_2CDF98:
/* 01CA98 01DC8798 01000224 */  addiu       $2, $0, 0x1
/* 01CA9C 01DC879C 000042AE */  sw          $2, 0x0($18)
.L01DC87A0_2CDFA0:
/* 01CAA0 01DC87A0 0400012A */  slti        $1, $16, 0x4
/* 01CAA4 01DC87A4 52002010 */  beqz        $1, .L01DC88F0_2CE0F0
/* 01CAA8 01DC87A8 00000000 */   nop
/* 01CAAC 01DC87AC 00006CC6 */  lwc1        $f12, 0x0($19)
/* 01CAB0 01DC87B0 E301023C */  lui         $2, %hi(Hamon)
/* 01CAB4 01DC87B4 B0D24224 */  addiu       $2, $2, %lo(Hamon)
/* 01CAB8 01DC87B8 21885100 */  addu        $17, $2, $17
/* 01CABC 01DC87BC 0000248E */  lw          $4, 0x0($17)
/* 01CAC0 01DC87C0 46630046 */  mov.s       $f13, $f12
/* 01CAC4 01DC87C4 86630046 */  mov.s       $f14, $f12
/* 01CAC8 01DC87C8 D49F040C */  jal         SetScale__6CFrameFfff
/* 01CACC 01DC87CC 00000000 */   nop
/* 01CAD0 01DC87D0 00009044 */  mtc1        $16, $f0
/* 01CAD4 01DC87D4 00000000 */  nop
/* 01CAD8 01DC87D8 60008046 */  cvt.s.w     $f1, $f0
/* 01CADC 01DC87DC C842023C */  lui         $2, (0x42C80000 >> 16)
/* 01CAE0 01DC87E0 00008244 */  mtc1        $2, $f0
/* 01CAE4 01DC87E4 00000000 */  nop
/* 01CAE8 01DC87E8 43080046 */  div.s       $f1, $f1, $f0
/* 01CAEC 01DC87EC 048480C7 */  lwc1        $f0, -0x7BFC($28)
/* 01CAF0 01DC87F0 40030146 */  add.s       $f13, $f0, $f1
/* 01CAF4 01DC87F4 00708044 */  mtc1        $0, $f14
/* 01CAF8 01DC87F8 00000000 */  nop
/* 01CAFC 01DC87FC 06730046 */  mov.s       $f12, $f14
/* 01CB00 01DC8800 0000248E */  lw          $4, 0x0($17)
/* 01CB04 01DC8804 A09F040C */  jal         SetPosition__6CFrameFfff
/* 01CB08 01DC8808 00000000 */   nop
/* 01CB0C 01DC880C 2042023C */  lui         $2, (0x42200000 >> 16)
/* 01CB10 01DC8810 00088244 */  mtc1        $2, $f1
/* 01CB14 01DC8814 000060C6 */  lwc1        $f0, 0x0($19)
/* 01CB18 01DC8818 42080046 */  mul.s       $f1, $f1, $f0
/* 01CB1C 01DC881C 0043023C */  lui         $2, (0x43000000 >> 16)
/* 01CB20 01DC8820 00008244 */  mtc1        $2, $f0
/* 01CB24 01DC8824 00000000 */  nop
/* 01CB28 01DC8828 41000146 */  sub.s       $f1, $f0, $f1
/* 01CB2C 01DC882C 5C00A227 */  addiu       $2, $29, 0x5C
/* 01CB30 01DC8830 000041E4 */  swc1        $f1, 0x0($2)
/* 01CB34 01DC8834 00008044 */  mtc1        $0, $f0
/* 01CB38 01DC8838 00000000 */  nop
/* 01CB3C 01DC883C 34080046 */  c.lt.s      $f1, $f0
/* 01CB40 01DC8840 00000000 */  nop
/* 01CB44 01DC8844 02000045 */  bc1f        .L01DC8850_2CE050
/* 01CB48 01DC8848 00000000 */   nop
/* 01CB4C 01DC884C 000040AC */  sw          $0, 0x0($2)
.L01DC8850_2CE050:
/* 01CB50 01DC8850 5000A427 */  addiu       $4, $29, 0x50
/* 01CB54 01DC8854 40B7040C */  jal         MGSetAmbient__FPf
/* 01CB58 01DC8858 00000000 */   nop
/* 01CB5C 01DC885C 6800A527 */  addiu       $5, $29, 0x68
/* 01CB60 01DC8860 F88B82DF */  ld          $2, -0x7408($28)
/* 01CB64 01DC8864 0000A2FC */  sd          $2, 0x0($5)
/* 01CB68 01DC8868 6800A393 */  lbu         $3, 0x68($29)
/* 01CB6C 01DC886C 03000630 */  andi        $6, $0, 0x3
/* 01CB70 01DC8870 FCFF0224 */  addiu       $2, $0, -0x4
/* 01CB74 01DC8874 24106200 */  and         $2, $3, $2
/* 01CB78 01DC8878 25104600 */  or          $2, $2, $6
/* 01CB7C 01DC887C 6800A2A3 */  sb          $2, 0x68($29)
/* 01CB80 01DC8880 6800A493 */  lbu         $4, 0x68($29)
/* 01CB84 01DC8884 08000364 */  daddiu      $3, $0, 0x8
/* 01CB88 01DC8888 F3FF0224 */  addiu       $2, $0, -0xD
/* 01CB8C 01DC888C 24108200 */  and         $2, $4, $2
/* 01CB90 01DC8890 25104300 */  or          $2, $2, $3
/* 01CB94 01DC8894 6800A2A3 */  sb          $2, 0x68($29)
/* 01CB98 01DC8898 6800A493 */  lbu         $4, 0x68($29)
/* 01CB9C 01DC889C 00190600 */  sll         $3, $6, 4
/* 01CBA0 01DC88A0 CFFF0224 */  addiu       $2, $0, -0x31
/* 01CBA4 01DC88A4 24108200 */  and         $2, $4, $2
/* 01CBA8 01DC88A8 25104300 */  or          $2, $2, $3
/* 01CBAC 01DC88AC 6800A2A3 */  sb          $2, 0x68($29)
/* 01CBB0 01DC88B0 6800A493 */  lbu         $4, 0x68($29)
/* 01CBB4 01DC88B4 40000364 */  daddiu      $3, $0, 0x40
/* 01CBB8 01DC88B8 3FFF0224 */  addiu       $2, $0, -0xC1
/* 01CBBC 01DC88BC 24108200 */  and         $2, $4, $2
/* 01CBC0 01DC88C0 25104300 */  or          $2, $2, $3
/* 01CBC4 01DC88C4 6800A2A3 */  sb          $2, 0x68($29)
/* 01CBC8 01DC88C8 D48B848F */  lw          $4, -0x742C($28)
/* 01CBCC 01DC88CC 086F050C */  jal         setAlphaFlag__FP13sceVif1PacketP10sceGsAlpha
/* 01CBD0 01DC88D0 00000000 */   nop
/* 01CBD4 01DC88D4 0000248E */  lw          $4, 0x0($17)
/* 01CBD8 01DC88D8 60BB040C */  jal         MGDraw__FP6CFrame
/* 01CBDC 01DC88DC 00000000 */   nop
/* 01CBE0 01DC88E0 D48B848F */  lw          $4, -0x742C($28)
/* 01CBE4 01DC88E4 F88B8527 */  addiu       $5, $28, -0x7408
/* 01CBE8 01DC88E8 086F050C */  jal         setAlphaFlag__FP13sceVif1PacketP10sceGsAlpha
/* 01CBEC 01DC88EC 00000000 */   nop
.L01DC88F0_2CE0F0:
/* 01CBF0 01DC88F0 01001026 */  addiu       $16, $16, 0x1
.L01DC88F4_2CE0F4:
/* 01CBF4 01DC88F4 0500022A */  slti        $2, $16, 0x5
/* 01CBF8 01DC88F8 4FFF4014 */  bnez        $2, .L01DC8638_2CDE38
/* 01CBFC 01DC88FC 00000000 */   nop
/* 01CC00 01DC8900 2500023C */  lui         $2, %hi(ambientlight)
/* 01CC04 01DC8904 001C4424 */  addiu       $4, $2, %lo(ambientlight)
/* 01CC08 01DC8908 40B7040C */  jal         MGSetAmbient__FPf
/* 01CC0C 01DC890C 00000000 */   nop
/* 01CC10 01DC8910 4000BF7B */  lq          $31, 0x40($29)
/* 01CC14 01DC8914 3000B37B */  lq          $19, 0x30($29)
/* 01CC18 01DC8918 2000B27B */  lq          $18, 0x20($29)
/* 01CC1C 01DC891C 1000B17B */  lq          $17, 0x10($29)
/* 01CC20 01DC8920 0000B07B */  lq          $16, 0x0($29)
/* 01CC24 01DC8924 7000BD27 */  addiu       $29, $29, 0x70
/* 01CC28 01DC8928 0800E003 */  jr          $31
/* 01CC2C 01DC892C 00000000 */   nop
