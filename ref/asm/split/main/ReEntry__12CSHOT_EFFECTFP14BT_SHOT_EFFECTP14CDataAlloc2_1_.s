.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ReEntry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTP14CDataAlloc2_1_
/* 0AD910 001AD810 80FFBD27 */  addiu       $29, $29, -0x80
/* 0AD914 001AD814 7000BF7F */  sq          $31, 0x70($29)
/* 0AD918 001AD818 6000B67F */  sq          $22, 0x60($29)
/* 0AD91C 001AD81C 5000B57F */  sq          $21, 0x50($29)
/* 0AD920 001AD820 4000B47F */  sq          $20, 0x40($29)
/* 0AD924 001AD824 3000B37F */  sq          $19, 0x30($29)
/* 0AD928 001AD828 2000B27F */  sq          $18, 0x20($29)
/* 0AD92C 001AD82C 1000B17F */  sq          $17, 0x10($29)
/* 0AD930 001AD830 0000B07F */  sq          $16, 0x0($29)
/* 0AD934 001AD834 28B68070 */  paddub      $22, $4, $0
/* 0AD938 001AD838 28AEA070 */  paddub      $21, $5, $0
/* 0AD93C 001AD83C 28A6C070 */  paddub      $20, $6, $0
/* 0AD940 001AD840 28860070 */  paddub      $16, $0, $0
/* 0AD944 001AD844 21010010 */  b           .L001ADCCC
/* 0AD948 001AD848 00000000 */   nop
.L001AD84C:
/* 0AD94C 001AD84C B0110224 */  addiu       $2, $0, 0x11B0
/* 0AD950 001AD850 18880202 */  mult        $17, $16, $2
/* 0AD954 001AD854 2190D102 */  addu        $18, $22, $17
/* 0AD958 001AD858 C0114426 */  addiu       $4, $18, 0x11C0
/* 0AD95C 001AD85C 1000C526 */  addiu       $5, $22, 0x10
/* 0AD960 001AD860 780C050C */  jal         func_001431E0
/* 0AD964 001AD864 00000000 */   nop
/* 0AD968 001AD868 C000C0C6 */  lwc1        $f0, 0xC0($22)
/* 0AD96C 001AD86C 281E4072 */  paddub      $3, $18, $0
/* 0AD970 001AD870 701260E4 */  swc1        $f0, 0x1270($3)
/* 0AD974 001AD874 C400C0C6 */  lwc1        $f0, 0xC4($22)
/* 0AD978 001AD878 741260E4 */  swc1        $f0, 0x1274($3)
/* 0AD97C 001AD87C C800C0C6 */  lwc1        $f0, 0xC8($22)
/* 0AD980 001AD880 781260E4 */  swc1        $f0, 0x1278($3)
/* 0AD984 001AD884 CC00C28E */  lw          $2, 0xCC($22)
/* 0AD988 001AD888 7C127324 */  addiu       $19, $3, 0x127C
/* 0AD98C 001AD88C 7C1262AC */  sw          $2, 0x127C($3)
/* 0AD990 001AD890 D000C28E */  lw          $2, 0xD0($22)
/* 0AD994 001AD894 801262AC */  sw          $2, 0x1280($3)
/* 0AD998 001AD898 D400C3C6 */  lwc1        $f3, 0xD4($22)
/* 0AD99C 001AD89C D800C2C6 */  lwc1        $f2, 0xD8($22)
/* 0AD9A0 001AD8A0 DC00C1C6 */  lwc1        $f1, 0xDC($22)
/* 0AD9A4 001AD8A4 E000C0C6 */  lwc1        $f0, 0xE0($22)
/* 0AD9A8 001AD8A8 841263E4 */  swc1        $f3, 0x1284($3)
/* 0AD9AC 001AD8AC 881262E4 */  swc1        $f2, 0x1288($3)
/* 0AD9B0 001AD8B0 8C1261E4 */  swc1        $f1, 0x128C($3)
/* 0AD9B4 001AD8B4 901260E4 */  swc1        $f0, 0x1290($3)
/* 0AD9B8 001AD8B8 E400C28E */  lw          $2, 0xE4($22)
/* 0AD9BC 001AD8BC 941262AC */  sw          $2, 0x1294($3)
/* 0AD9C0 001AD8C0 E800C28E */  lw          $2, 0xE8($22)
/* 0AD9C4 001AD8C4 981262AC */  sw          $2, 0x1298($3)
/* 0AD9C8 001AD8C8 EC00C626 */  addiu       $6, $22, 0xEC
/* 0AD9CC 001AD8CC 9C126524 */  addiu       $5, $3, 0x129C
/* 0AD9D0 001AD8D0 3E000424 */  addiu       $4, $0, 0x3E
.L001AD8D4:
/* 0AD9D4 001AD8D4 0000C38C */  lw          $3, 0x0($6)
/* 0AD9D8 001AD8D8 0400C28C */  lw          $2, 0x4($6)
/* 0AD9DC 001AD8DC 0800C624 */  addiu       $6, $6, 0x8
/* 0AD9E0 001AD8E0 FFFF8424 */  addiu       $4, $4, -0x1
/* 0AD9E4 001AD8E4 0000A3AC */  sw          $3, 0x0($5)
/* 0AD9E8 001AD8E8 0400A2AC */  sw          $2, 0x4($5)
/* 0AD9EC 001AD8EC 0800A524 */  addiu       $5, $5, 0x8
/* 0AD9F0 001AD8F0 F8FF801C */  bgtz        $4, .L001AD8D4
/* 0AD9F4 001AD8F4 00000000 */   nop
/* 0AD9F8 001AD8F8 DC02C28E */  lw          $2, 0x2DC($22)
/* 0AD9FC 001AD8FC 21183602 */  addu        $3, $17, $22
/* 0ADA00 001AD900 8C1462AC */  sw          $2, 0x148C($3)
/* 0ADA04 001AD904 E002C28E */  lw          $2, 0x2E0($22)
/* 0ADA08 001AD908 901462AC */  sw          $2, 0x1490($3)
/* 0ADA0C 001AD90C F002C626 */  addiu       $6, $22, 0x2F0
/* 0ADA10 001AD910 A0146524 */  addiu       $5, $3, 0x14A0
/* 0ADA14 001AD914 04000424 */  addiu       $4, $0, 0x4
.L001AD918:
/* 0ADA18 001AD918 0000C378 */  lq          $3, 0x0($6)
/* 0ADA1C 001AD91C 1000C278 */  lq          $2, 0x10($6)
/* 0ADA20 001AD920 2000C624 */  addiu       $6, $6, 0x20
/* 0ADA24 001AD924 FFFF8424 */  addiu       $4, $4, -0x1
/* 0ADA28 001AD928 0000A37C */  sq          $3, 0x0($5)
/* 0ADA2C 001AD92C 1000A27C */  sq          $2, 0x10($5)
/* 0ADA30 001AD930 2000A524 */  addiu       $5, $5, 0x20
/* 0ADA34 001AD934 F8FF801C */  bgtz        $4, .L001AD918
/* 0ADA38 001AD938 00000000 */   nop
/* 0ADA3C 001AD93C 21103602 */  addu        $2, $17, $22
/* 0ADA40 001AD940 7003C626 */  addiu       $6, $22, 0x370
/* 0ADA44 001AD944 20154524 */  addiu       $5, $2, 0x1520
/* 0ADA48 001AD948 04000424 */  addiu       $4, $0, 0x4
.L001AD94C:
/* 0ADA4C 001AD94C 0000C378 */  lq          $3, 0x0($6)
/* 0ADA50 001AD950 1000C278 */  lq          $2, 0x10($6)
/* 0ADA54 001AD954 2000C624 */  addiu       $6, $6, 0x20
/* 0ADA58 001AD958 FFFF8424 */  addiu       $4, $4, -0x1
/* 0ADA5C 001AD95C 0000A37C */  sq          $3, 0x0($5)
/* 0ADA60 001AD960 1000A27C */  sq          $2, 0x10($5)
/* 0ADA64 001AD964 2000A524 */  addiu       $5, $5, 0x20
/* 0ADA68 001AD968 F8FF801C */  bgtz        $4, .L001AD94C
/* 0ADA6C 001AD96C 00000000 */   nop
/* 0ADA70 001AD970 21103602 */  addu        $2, $17, $22
/* 0ADA74 001AD974 F003C626 */  addiu       $6, $22, 0x3F0
/* 0ADA78 001AD978 A0154524 */  addiu       $5, $2, 0x15A0
/* 0ADA7C 001AD97C 04000424 */  addiu       $4, $0, 0x4
.L001AD980:
/* 0ADA80 001AD980 0000C38C */  lw          $3, 0x0($6)
/* 0ADA84 001AD984 0400C28C */  lw          $2, 0x4($6)
/* 0ADA88 001AD988 0800C624 */  addiu       $6, $6, 0x8
/* 0ADA8C 001AD98C FFFF8424 */  addiu       $4, $4, -0x1
/* 0ADA90 001AD990 0000A3AC */  sw          $3, 0x0($5)
/* 0ADA94 001AD994 0400A2AC */  sw          $2, 0x4($5)
/* 0ADA98 001AD998 0800A524 */  addiu       $5, $5, 0x8
/* 0ADA9C 001AD99C F8FF801C */  bgtz        $4, .L001AD980
/* 0ADAA0 001AD9A0 00000000 */   nop
/* 0ADAA4 001AD9A4 21103602 */  addu        $2, $17, $22
/* 0ADAA8 001AD9A8 1004C626 */  addiu       $6, $22, 0x410
/* 0ADAAC 001AD9AC C0154524 */  addiu       $5, $2, 0x15C0
/* 0ADAB0 001AD9B0 04000424 */  addiu       $4, $0, 0x4
.L001AD9B4:
/* 0ADAB4 001AD9B4 0000C38C */  lw          $3, 0x0($6)
/* 0ADAB8 001AD9B8 0400C28C */  lw          $2, 0x4($6)
/* 0ADABC 001AD9BC 0800C624 */  addiu       $6, $6, 0x8
/* 0ADAC0 001AD9C0 FFFF8424 */  addiu       $4, $4, -0x1
/* 0ADAC4 001AD9C4 0000A3AC */  sw          $3, 0x0($5)
/* 0ADAC8 001AD9C8 0400A2AC */  sw          $2, 0x4($5)
/* 0ADACC 001AD9CC 0800A524 */  addiu       $5, $5, 0x8
/* 0ADAD0 001AD9D0 F8FF801C */  bgtz        $4, .L001AD9B4
/* 0ADAD4 001AD9D4 00000000 */   nop
/* 0ADAD8 001AD9D8 21103602 */  addu        $2, $17, $22
/* 0ADADC 001AD9DC 3004C626 */  addiu       $6, $22, 0x430
/* 0ADAE0 001AD9E0 E0154524 */  addiu       $5, $2, 0x15E0
/* 0ADAE4 001AD9E4 80000424 */  addiu       $4, $0, 0x80
.L001AD9E8:
/* 0ADAE8 001AD9E8 0000C38C */  lw          $3, 0x0($6)
/* 0ADAEC 001AD9EC 0400C28C */  lw          $2, 0x4($6)
/* 0ADAF0 001AD9F0 0800C624 */  addiu       $6, $6, 0x8
/* 0ADAF4 001AD9F4 FFFF8424 */  addiu       $4, $4, -0x1
/* 0ADAF8 001AD9F8 0000A3AC */  sw          $3, 0x0($5)
/* 0ADAFC 001AD9FC 0400A2AC */  sw          $2, 0x4($5)
/* 0ADB00 001ADA00 0800A524 */  addiu       $5, $5, 0x8
/* 0ADB04 001ADA04 F8FF801C */  bgtz        $4, .L001AD9E8
/* 0ADB08 001ADA08 00000000 */   nop
/* 0ADB0C 001ADA0C 21103602 */  addu        $2, $17, $22
/* 0ADB10 001ADA10 3008C626 */  addiu       $6, $22, 0x830
/* 0ADB14 001ADA14 E0194524 */  addiu       $5, $2, 0x19E0
/* 0ADB18 001ADA18 80000424 */  addiu       $4, $0, 0x80
.L001ADA1C:
/* 0ADB1C 001ADA1C 0000C38C */  lw          $3, 0x0($6)
/* 0ADB20 001ADA20 0400C28C */  lw          $2, 0x4($6)
/* 0ADB24 001ADA24 0800C624 */  addiu       $6, $6, 0x8
/* 0ADB28 001ADA28 FFFF8424 */  addiu       $4, $4, -0x1
/* 0ADB2C 001ADA2C 0000A3AC */  sw          $3, 0x0($5)
/* 0ADB30 001ADA30 0400A2AC */  sw          $2, 0x4($5)
/* 0ADB34 001ADA34 0800A524 */  addiu       $5, $5, 0x8
/* 0ADB38 001ADA38 F8FF801C */  bgtz        $4, .L001ADA1C
/* 0ADB3C 001ADA3C 00000000 */   nop
/* 0ADB40 001ADA40 21103602 */  addu        $2, $17, $22
/* 0ADB44 001ADA44 E01D4224 */  addiu       $2, $2, 0x1DE0
/* 0ADB48 001ADA48 300CC726 */  addiu       $7, $22, 0xC30
/* 0ADB4C 001ADA4C 04000524 */  addiu       $5, $0, 0x4
/* 0ADB50 001ADA50 28364070 */  paddub      $6, $2, $0
.L001ADA54:
/* 0ADB54 001ADA54 0000E48C */  lw          $4, 0x0($7)
/* 0ADB58 001ADA58 0400E38C */  lw          $3, 0x4($7)
/* 0ADB5C 001ADA5C 0800E724 */  addiu       $7, $7, 0x8
/* 0ADB60 001ADA60 FFFFA524 */  addiu       $5, $5, -0x1
/* 0ADB64 001ADA64 0000C4AC */  sw          $4, 0x0($6)
/* 0ADB68 001ADA68 0400C3AC */  sw          $3, 0x4($6)
/* 0ADB6C 001ADA6C 0800C624 */  addiu       $6, $6, 0x8
/* 0ADB70 001ADA70 F8FFA01C */  bgtz        $5, .L001ADA54
/* 0ADB74 001ADA74 00000000 */   nop
/* 0ADB78 001ADA78 21183602 */  addu        $3, $17, $22
/* 0ADB7C 001ADA7C 500CC726 */  addiu       $7, $22, 0xC50
/* 0ADB80 001ADA80 001E6624 */  addiu       $6, $3, 0x1E00
/* 0ADB84 001ADA84 04000524 */  addiu       $5, $0, 0x4
.L001ADA88:
/* 0ADB88 001ADA88 0000E48C */  lw          $4, 0x0($7)
/* 0ADB8C 001ADA8C 0400E38C */  lw          $3, 0x4($7)
/* 0ADB90 001ADA90 0800E724 */  addiu       $7, $7, 0x8
/* 0ADB94 001ADA94 FFFFA524 */  addiu       $5, $5, -0x1
/* 0ADB98 001ADA98 0000C4AC */  sw          $4, 0x0($6)
/* 0ADB9C 001ADA9C 0400C3AC */  sw          $3, 0x4($6)
/* 0ADBA0 001ADAA0 0800C624 */  addiu       $6, $6, 0x8
/* 0ADBA4 001ADAA4 F8FFA01C */  bgtz        $5, .L001ADA88
/* 0ADBA8 001ADAA8 00000000 */   nop
/* 0ADBAC 001ADAAC 700CC0C6 */  lwc1        $f0, 0xC70($22)
/* 0ADBB0 001ADAB0 21203602 */  addu        $4, $17, $22
/* 0ADBB4 001ADAB4 201E80E4 */  swc1        $f0, 0x1E20($4)
/* 0ADBB8 001ADAB8 740CC38E */  lw          $3, 0xC74($22)
/* 0ADBBC 001ADABC 241E83AC */  sw          $3, 0x1E24($4)
/* 0ADBC0 001ADAC0 780CC38E */  lw          $3, 0xC78($22)
/* 0ADBC4 001ADAC4 281E83AC */  sw          $3, 0x1E28($4)
/* 0ADBC8 001ADAC8 7C0CC0C6 */  lwc1        $f0, 0xC7C($22)
/* 0ADBCC 001ADACC 2C1E80E4 */  swc1        $f0, 0x1E2C($4)
/* 0ADBD0 001ADAD0 800CC38E */  lw          $3, 0xC80($22)
/* 0ADBD4 001ADAD4 301E83AC */  sw          $3, 0x1E30($4)
/* 0ADBD8 001ADAD8 840CC38E */  lw          $3, 0xC84($22)
/* 0ADBDC 001ADADC 341E83AC */  sw          $3, 0x1E34($4)
/* 0ADBE0 001ADAE0 880CC726 */  addiu       $7, $22, 0xC88
/* 0ADBE4 001ADAE4 381E8624 */  addiu       $6, $4, 0x1E38
/* 0ADBE8 001ADAE8 04000524 */  addiu       $5, $0, 0x4
.L001ADAEC:
/* 0ADBEC 001ADAEC 0000E48C */  lw          $4, 0x0($7)
/* 0ADBF0 001ADAF0 0400E38C */  lw          $3, 0x4($7)
/* 0ADBF4 001ADAF4 0800E724 */  addiu       $7, $7, 0x8
/* 0ADBF8 001ADAF8 FFFFA524 */  addiu       $5, $5, -0x1
/* 0ADBFC 001ADAFC 0000C4AC */  sw          $4, 0x0($6)
/* 0ADC00 001ADB00 0400C3AC */  sw          $3, 0x4($6)
/* 0ADC04 001ADB04 0800C624 */  addiu       $6, $6, 0x8
/* 0ADC08 001ADB08 F8FFA01C */  bgtz        $5, .L001ADAEC
/* 0ADC0C 001ADB0C 00000000 */   nop
/* 0ADC10 001ADB10 A80CC38E */  lw          $3, 0xCA8($22)
/* 0ADC14 001ADB14 21203602 */  addu        $4, $17, $22
/* 0ADC18 001ADB18 581E83AC */  sw          $3, 0x1E58($4)
/* 0ADC1C 001ADB1C AC0CC38E */  lw          $3, 0xCAC($22)
/* 0ADC20 001ADB20 5C1E83AC */  sw          $3, 0x1E5C($4)
/* 0ADC24 001ADB24 B00CC38E */  lw          $3, 0xCB0($22)
/* 0ADC28 001ADB28 601E83AC */  sw          $3, 0x1E60($4)
/* 0ADC2C 001ADB2C C00CC726 */  addiu       $7, $22, 0xCC0
/* 0ADC30 001ADB30 701E8624 */  addiu       $6, $4, 0x1E70
/* 0ADC34 001ADB34 04000524 */  addiu       $5, $0, 0x4
.L001ADB38:
/* 0ADC38 001ADB38 0000E48C */  lw          $4, 0x0($7)
/* 0ADC3C 001ADB3C 0400E38C */  lw          $3, 0x4($7)
/* 0ADC40 001ADB40 0800E724 */  addiu       $7, $7, 0x8
/* 0ADC44 001ADB44 FFFFA524 */  addiu       $5, $5, -0x1
/* 0ADC48 001ADB48 0000C4AC */  sw          $4, 0x0($6)
/* 0ADC4C 001ADB4C 0400C3AC */  sw          $3, 0x4($6)
/* 0ADC50 001ADB50 0800C624 */  addiu       $6, $6, 0x8
/* 0ADC54 001ADB54 F8FFA01C */  bgtz        $5, .L001ADB38
/* 0ADC58 001ADB58 00000000 */   nop
/* 0ADC5C 001ADB5C 21183602 */  addu        $3, $17, $22
/* 0ADC60 001ADB60 E00CC3C6 */  lwc1        $f3, 0xCE0($22)
/* 0ADC64 001ADB64 E40CC2C6 */  lwc1        $f2, 0xCE4($22)
/* 0ADC68 001ADB68 E80CC1C6 */  lwc1        $f1, 0xCE8($22)
/* 0ADC6C 001ADB6C EC0CC0C6 */  lwc1        $f0, 0xCEC($22)
/* 0ADC70 001ADB70 901E63E4 */  swc1        $f3, 0x1E90($3)
/* 0ADC74 001ADB74 941E62E4 */  swc1        $f2, 0x1E94($3)
/* 0ADC78 001ADB78 981E61E4 */  swc1        $f1, 0x1E98($3)
/* 0ADC7C 001ADB7C 9C1E60E4 */  swc1        $f0, 0x1E9C($3)
/* 0ADC80 001ADB80 F00CC3C6 */  lwc1        $f3, 0xCF0($22)
/* 0ADC84 001ADB84 F40CC2C6 */  lwc1        $f2, 0xCF4($22)
/* 0ADC88 001ADB88 F80CC1C6 */  lwc1        $f1, 0xCF8($22)
/* 0ADC8C 001ADB8C FC0CC0C6 */  lwc1        $f0, 0xCFC($22)
/* 0ADC90 001ADB90 A01E63E4 */  swc1        $f3, 0x1EA0($3)
/* 0ADC94 001ADB94 A41E62E4 */  swc1        $f2, 0x1EA4($3)
/* 0ADC98 001ADB98 A81E61E4 */  swc1        $f1, 0x1EA8($3)
/* 0ADC9C 001ADB9C AC1E60E4 */  swc1        $f0, 0x1EAC($3)
/* 0ADCA0 001ADBA0 000DC3C6 */  lwc1        $f3, 0xD00($22)
/* 0ADCA4 001ADBA4 040DC2C6 */  lwc1        $f2, 0xD04($22)
/* 0ADCA8 001ADBA8 080DC1C6 */  lwc1        $f1, 0xD08($22)
/* 0ADCAC 001ADBAC 0C0DC0C6 */  lwc1        $f0, 0xD0C($22)
/* 0ADCB0 001ADBB0 B01E63E4 */  swc1        $f3, 0x1EB0($3)
/* 0ADCB4 001ADBB4 B41E62E4 */  swc1        $f2, 0x1EB4($3)
/* 0ADCB8 001ADBB8 B81E61E4 */  swc1        $f1, 0x1EB8($3)
/* 0ADCBC 001ADBBC BC1E60E4 */  swc1        $f0, 0x1EBC($3)
/* 0ADCC0 001ADBC0 100DC726 */  addiu       $7, $22, 0xD10
/* 0ADCC4 001ADBC4 C01E6624 */  addiu       $6, $3, 0x1EC0
/* 0ADCC8 001ADBC8 0C000524 */  addiu       $5, $0, 0xC
.L001ADBCC:
/* 0ADCCC 001ADBCC 0000E48C */  lw          $4, 0x0($7)
/* 0ADCD0 001ADBD0 0400E38C */  lw          $3, 0x4($7)
/* 0ADCD4 001ADBD4 0800E724 */  addiu       $7, $7, 0x8
/* 0ADCD8 001ADBD8 FFFFA524 */  addiu       $5, $5, -0x1
/* 0ADCDC 001ADBDC 0000C4AC */  sw          $4, 0x0($6)
/* 0ADCE0 001ADBE0 0400C3AC */  sw          $3, 0x4($6)
/* 0ADCE4 001ADBE4 0800C624 */  addiu       $6, $6, 0x8
/* 0ADCE8 001ADBE8 F8FFA01C */  bgtz        $5, .L001ADBCC
/* 0ADCEC 001ADBEC 00000000 */   nop
/* 0ADCF0 001ADBF0 21183602 */  addu        $3, $17, $22
/* 0ADCF4 001ADBF4 700DC726 */  addiu       $7, $22, 0xD70
/* 0ADCF8 001ADBF8 201F6624 */  addiu       $6, $3, 0x1F20
/* 0ADCFC 001ADBFC 0F000524 */  addiu       $5, $0, 0xF
.L001ADC00:
/* 0ADD00 001ADC00 0000E48C */  lw          $4, 0x0($7)
/* 0ADD04 001ADC04 0400E38C */  lw          $3, 0x4($7)
/* 0ADD08 001ADC08 0800E724 */  addiu       $7, $7, 0x8
/* 0ADD0C 001ADC0C FFFFA524 */  addiu       $5, $5, -0x1
/* 0ADD10 001ADC10 0000C4AC */  sw          $4, 0x0($6)
/* 0ADD14 001ADC14 0400C3AC */  sw          $3, 0x4($6)
/* 0ADD18 001ADC18 0800C624 */  addiu       $6, $6, 0x8
/* 0ADD1C 001ADC1C F8FFA01C */  bgtz        $5, .L001ADC00
/* 0ADD20 001ADC20 00000000 */   nop
/* 0ADD24 001ADC24 E80DC38E */  lw          $3, 0xDE8($22)
/* 0ADD28 001ADC28 21203602 */  addu        $4, $17, $22
/* 0ADD2C 001ADC2C 981F83AC */  sw          $3, 0x1F98($4)
/* 0ADD30 001ADC30 EC0DC38E */  lw          $3, 0xDEC($22)
/* 0ADD34 001ADC34 9C1F83AC */  sw          $3, 0x1F9C($4)
/* 0ADD38 001ADC38 F00DC38E */  lw          $3, 0xDF0($22)
/* 0ADD3C 001ADC3C A01F83AC */  sw          $3, 0x1FA0($4)
/* 0ADD40 001ADC40 F40DC38E */  lw          $3, 0xDF4($22)
/* 0ADD44 001ADC44 A41F83AC */  sw          $3, 0x1FA4($4)
/* 0ADD48 001ADC48 F80DC726 */  addiu       $7, $22, 0xDF8
/* 0ADD4C 001ADC4C A81F8624 */  addiu       $6, $4, 0x1FA8
/* 0ADD50 001ADC50 50000524 */  addiu       $5, $0, 0x50
.L001ADC54:
/* 0ADD54 001ADC54 0000E48C */  lw          $4, 0x0($7)
/* 0ADD58 001ADC58 0400E38C */  lw          $3, 0x4($7)
/* 0ADD5C 001ADC5C 0800E724 */  addiu       $7, $7, 0x8
/* 0ADD60 001ADC60 FFFFA524 */  addiu       $5, $5, -0x1
/* 0ADD64 001ADC64 0000C4AC */  sw          $4, 0x0($6)
/* 0ADD68 001ADC68 0400C3AC */  sw          $3, 0x4($6)
/* 0ADD6C 001ADC6C 0800C624 */  addiu       $6, $6, 0x8
/* 0ADD70 001ADC70 F8FFA01C */  bgtz        $5, .L001ADC54
/* 0ADD74 001ADC74 00000000 */   nop
/* 0ADD78 001ADC78 21183602 */  addu        $3, $17, $22
/* 0ADD7C 001ADC7C 7810C726 */  addiu       $7, $22, 0x1078
/* 0ADD80 001ADC80 28226624 */  addiu       $6, $3, 0x2228
/* 0ADD84 001ADC84 28000524 */  addiu       $5, $0, 0x28
.L001ADC88:
/* 0ADD88 001ADC88 0000E48C */  lw          $4, 0x0($7)
/* 0ADD8C 001ADC8C 0400E38C */  lw          $3, 0x4($7)
/* 0ADD90 001ADC90 0800E724 */  addiu       $7, $7, 0x8
/* 0ADD94 001ADC94 FFFFA524 */  addiu       $5, $5, -0x1
/* 0ADD98 001ADC98 0000C4AC */  sw          $4, 0x0($6)
/* 0ADD9C 001ADC9C 0400C3AC */  sw          $3, 0x4($6)
/* 0ADDA0 001ADCA0 0800C624 */  addiu       $6, $6, 0x8
/* 0ADDA4 001ADCA4 F8FFA01C */  bgtz        $5, .L001ADC88
/* 0ADDA8 001ADCA8 00000000 */   nop
/* 0ADDAC 001ADCAC A0144326 */  addiu       $3, $18, 0x14A0
/* 0ADDB0 001ADCB0 000043AC */  sw          $3, 0x0($2)
/* 0ADDB4 001ADCB4 CC00C48E */  lw          $4, 0xCC($22)
/* 0ADDB8 001ADCB8 282E8072 */  paddub      $5, $20, $0
/* 0ADDBC 001ADCBC 849D040C */  jal         CopyFrameVu1__FP9CFrameVu1P14CDataAlloc2_1_
/* 0ADDC0 001ADCC0 00000000 */   nop
/* 0ADDC4 001ADCC4 000062AE */  sw          $2, 0x0($19)
/* 0ADDC8 001ADCC8 01001026 */  addiu       $16, $16, 0x1
.L001ADCCC:
/* 0ADDCC 001ADCCC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0ADDD0 001ADCD0 2108C102 */  addu        $1, $22, $1
/* 0ADDD4 001ADCD4 4CA1228C */  lw          $2, -0x5EB4($1)
/* 0ADDD8 001ADCD8 2A100202 */  slt         $2, $16, $2
/* 0ADDDC 001ADCDC DBFE4014 */  bnez        $2, .L001AD84C
/* 0ADDE0 001ADCE0 00000000 */   nop
/* 0ADDE4 001ADCE4 0000D5AE */  sw          $21, 0x0($22)
/* 0ADDE8 001ADCE8 01000224 */  addiu       $2, $0, 0x1
/* 0ADDEC 001ADCEC 7000BF7B */  lq          $31, 0x70($29)
/* 0ADDF0 001ADCF0 6000B67B */  lq          $22, 0x60($29)
/* 0ADDF4 001ADCF4 5000B57B */  lq          $21, 0x50($29)
/* 0ADDF8 001ADCF8 4000B47B */  lq          $20, 0x40($29)
/* 0ADDFC 001ADCFC 3000B37B */  lq          $19, 0x30($29)
/* 0ADE00 001ADD00 2000B27B */  lq          $18, 0x20($29)
/* 0ADE04 001ADD04 1000B17B */  lq          $17, 0x10($29)
/* 0ADE08 001ADD08 0000B07B */  lq          $16, 0x0($29)
/* 0ADE0C 001ADD0C 8000BD27 */  addiu       $29, $29, 0x80
/* 0ADE10 001ADD10 0800E003 */  jr          $31
/* 0ADE14 001ADD14 00000000 */   nop
/* 0ADE18 001ADD18 00000000 */  nop
/* 0ADE1C 001ADD1C 00000000 */  nop
