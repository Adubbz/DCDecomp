.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CleanViewMonstor__12CMonstorUnitFi
/* DFAF0 001DF9F0 281E0070 */  paddub     $3, $0, $0
/* DFAF4 001DF9F4 1F010010 */  b          .L001DFE74
/* DFAF8 001DF9F8 00000000 */   nop
.L001DF9FC:
/* DFAFC 001DF9FC FFFF0B24 */  addiu      $11, $0, -0x1
/* DFB00 001DFA00 80500300 */  sll        $10, $3, 2
/* DFB04 001DFA04 21384301 */  addu       $7, $10, $3
/* DFB08 001DFA08 80300700 */  sll        $6, $7, 2
/* DFB0C 001DFA0C 2130E600 */  addu       $6, $7, $6
/* DFB10 001DFA10 00310600 */  sll        $6, $6, 4
/* DFB14 001DFA14 2148C400 */  addu       $9, $6, $4
/* DFB18 001DFA18 0200013C */  lui        $at, (0x20000 >> 16)
/* DFB1C 001DFA1C 21082101 */  addu       $at, $9, $at
/* DFB20 001DFA20 D0E32BAC */  sw         $11, -0x1C30($at)
/* DFB24 001DFA24 0200013C */  lui        $at, (0x20000 >> 16)
/* DFB28 001DFA28 21082101 */  addu       $at, $9, $at
/* DFB2C 001DFA2C D8E320AC */  sw         $0, -0x1C28($at)
/* DFB30 001DFA30 0200013C */  lui        $at, (0x20000 >> 16)
/* DFB34 001DFA34 21082101 */  addu       $at, $9, $at
/* DFB38 001DFA38 DCE320AC */  sw         $0, -0x1C24($at)
/* DFB3C 001DFA3C 0200013C */  lui        $at, (0x20000 >> 16)
/* DFB40 001DFA40 21082101 */  addu       $at, $9, $at
/* DFB44 001DFA44 E0E320AC */  sw         $0, -0x1C20($at)
/* DFB48 001DFA48 0200013C */  lui        $at, (0x20000 >> 16)
/* DFB4C 001DFA4C 21082101 */  addu       $at, $9, $at
/* DFB50 001DFA50 E4E320AC */  sw         $0, -0x1C1C($at)
/* DFB54 001DFA54 0200013C */  lui        $at, (0x20000 >> 16)
/* DFB58 001DFA58 21082101 */  addu       $at, $9, $at
/* DFB5C 001DFA5C 20E420AC */  sw         $0, -0x1BE0($at)
/* DFB60 001DFA60 0200013C */  lui        $at, (0x20000 >> 16)
/* DFB64 001DFA64 21082101 */  addu       $at, $9, $at
/* DFB68 001DFA68 38E420AC */  sw         $0, -0x1BC8($at)
/* DFB6C 001DFA6C 0200013C */  lui        $at, (0x20000 >> 16)
/* DFB70 001DFA70 21082101 */  addu       $at, $9, $at
/* DFB74 001DFA74 34E420AC */  sw         $0, -0x1BCC($at)
/* DFB78 001DFA78 0200013C */  lui        $at, (0x20000 >> 16)
/* DFB7C 001DFA7C 21082101 */  addu       $at, $9, $at
/* DFB80 001DFA80 30E420AC */  sw         $0, -0x1BD0($at)
/* DFB84 001DFA84 0200013C */  lui        $at, (0x20000 >> 16)
/* DFB88 001DFA88 21082101 */  addu       $at, $9, $at
/* DFB8C 001DFA8C 48E420AC */  sw         $0, -0x1BB8($at)
/* DFB90 001DFA90 0200013C */  lui        $at, (0x20000 >> 16)
/* DFB94 001DFA94 21082101 */  addu       $at, $9, $at
/* DFB98 001DFA98 44E420AC */  sw         $0, -0x1BBC($at)
/* DFB9C 001DFA9C 0200013C */  lui        $at, (0x20000 >> 16)
/* DFBA0 001DFAA0 21082101 */  addu       $at, $9, $at
/* DFBA4 001DFAA4 40E420AC */  sw         $0, -0x1BC0($at)
/* DFBA8 001DFAA8 0200013C */  lui        $at, (0x20000 >> 16)
/* DFBAC 001DFAAC 21082101 */  addu       $at, $9, $at
/* DFBB0 001DFAB0 50E420AC */  sw         $0, -0x1BB0($at)
/* DFBB4 001DFAB4 0200013C */  lui        $at, (0x20000 >> 16)
/* DFBB8 001DFAB8 21082101 */  addu       $at, $9, $at
/* DFBBC 001DFABC 54E420AC */  sw         $0, -0x1BAC($at)
/* DFBC0 001DFAC0 01000824 */  addiu      $8, $0, 0x1
/* DFBC4 001DFAC4 0200013C */  lui        $at, (0x20000 >> 16)
/* DFBC8 001DFAC8 21082101 */  addu       $at, $9, $at
/* DFBCC 001DFACC 58E428AC */  sw         $8, -0x1BA8($at)
/* DFBD0 001DFAD0 5041063C */  lui        $6, (0x41500000 >> 16)
/* DFBD4 001DFAD4 0200013C */  lui        $at, (0x20000 >> 16)
/* DFBD8 001DFAD8 21082101 */  addu       $at, $9, $at
/* DFBDC 001DFADC 14E426AC */  sw         $6, -0x1BEC($at)
/* DFBE0 001DFAE0 0200013C */  lui        $at, (0x20000 >> 16)
/* DFBE4 001DFAE4 21082101 */  addu       $at, $9, $at
/* DFBE8 001DFAE8 18E426AC */  sw         $6, -0x1BE8($at)
/* DFBEC 001DFAEC 0200013C */  lui        $at, (0x20000 >> 16)
/* DFBF0 001DFAF0 21082101 */  addu       $at, $9, $at
/* DFBF4 001DFAF4 64E420A4 */  sh         $0, -0x1B9C($at)
/* DFBF8 001DFAF8 0200013C */  lui        $at, (0x20000 >> 16)
/* DFBFC 001DFAFC 21082101 */  addu       $at, $9, $at
/* DFC00 001DFB00 68E420AC */  sw         $0, -0x1B98($at)
/* DFC04 001DFB04 0200013C */  lui        $at, (0x20000 >> 16)
/* DFC08 001DFB08 21082101 */  addu       $at, $9, $at
/* DFC0C 001DFB0C 70E42BA4 */  sh         $11, -0x1B90($at)
/* DFC10 001DFB10 9643063C */  lui        $6, (0x43960000 >> 16)
/* DFC14 001DFB14 0200013C */  lui        $at, (0x20000 >> 16)
/* DFC18 001DFB18 21082101 */  addu       $at, $9, $at
/* DFC1C 001DFB1C 74E426AC */  sw         $6, -0x1B8C($at)
/* DFC20 001DFB20 0200013C */  lui        $at, (0x20000 >> 16)
/* DFC24 001DFB24 21082101 */  addu       $at, $9, $at
/* DFC28 001DFB28 78E420AC */  sw         $0, -0x1B88($at)
/* DFC2C 001DFB2C 0200013C */  lui        $at, (0x20000 >> 16)
/* DFC30 001DFB30 21082101 */  addu       $at, $9, $at
/* DFC34 001DFB34 7CE42BA4 */  sh         $11, -0x1B84($at)
/* DFC38 001DFB38 0200013C */  lui        $at, (0x20000 >> 16)
/* DFC3C 001DFB3C 21082101 */  addu       $at, $9, $at
/* DFC40 001DFB40 7EE42BA4 */  sh         $11, -0x1B82($at)
/* DFC44 001DFB44 0200013C */  lui        $at, (0x20000 >> 16)
/* DFC48 001DFB48 21082101 */  addu       $at, $9, $at
/* DFC4C 001DFB4C 90E42BAC */  sw         $11, -0x1B70($at)
/* DFC50 001DFB50 803F073C */  lui        $7, (0x3F800000 >> 16)
/* DFC54 001DFB54 0200013C */  lui        $at, (0x20000 >> 16)
/* DFC58 001DFB58 21082101 */  addu       $at, $9, $at
/* DFC5C 001DFB5C 9CE427AC */  sw         $7, -0x1B64($at)
/* DFC60 001DFB60 0200013C */  lui        $at, (0x20000 >> 16)
/* DFC64 001DFB64 21082101 */  addu       $at, $9, $at
/* DFC68 001DFB68 CCE420AC */  sw         $0, -0x1B34($at)
/* DFC6C 001DFB6C 0200013C */  lui        $at, (0x20000 >> 16)
/* DFC70 001DFB70 21082101 */  addu       $at, $9, $at
/* DFC74 001DFB74 E0E427AC */  sw         $7, -0x1B20($at)
/* DFC78 001DFB78 0200013C */  lui        $at, (0x20000 >> 16)
/* DFC7C 001DFB7C 21082101 */  addu       $at, $9, $at
/* DFC80 001DFB80 E4E427AC */  sw         $7, -0x1B1C($at)
/* DFC84 001DFB84 F042063C */  lui        $6, (0x42F00000 >> 16)
/* DFC88 001DFB88 0200013C */  lui        $at, (0x20000 >> 16)
/* DFC8C 001DFB8C 21082101 */  addu       $at, $9, $at
/* DFC90 001DFB90 E8E426AC */  sw         $6, -0x1B18($at)
/* DFC94 001DFB94 0200013C */  lui        $at, (0x20000 >> 16)
/* DFC98 001DFB98 21082101 */  addu       $at, $9, $at
/* DFC9C 001DFB9C ECE428A4 */  sh         $8, -0x1B14($at)
/* DFCA0 001DFBA0 0200013C */  lui        $at, (0x20000 >> 16)
/* DFCA4 001DFBA4 21082101 */  addu       $at, $9, $at
/* DFCA8 001DFBA8 A4E42BA4 */  sh         $11, -0x1B5C($at)
/* DFCAC 001DFBAC 0200013C */  lui        $at, (0x20000 >> 16)
/* DFCB0 001DFBB0 21082101 */  addu       $at, $9, $at
/* DFCB4 001DFBB4 A8E42BA4 */  sh         $11, -0x1B58($at)
/* DFCB8 001DFBB8 0200013C */  lui        $at, (0x20000 >> 16)
/* DFCBC 001DFBBC 21082101 */  addu       $at, $9, $at
/* DFCC0 001DFBC0 0CE420AC */  sw         $0, -0x1BF4($at)
/* DFCC4 001DFBC4 0200013C */  lui        $at, (0x20000 >> 16)
/* DFCC8 001DFBC8 21082101 */  addu       $at, $9, $at
/* DFCCC 001DFBCC C6E42BA4 */  sh         $11, -0x1B3A($at)
/* DFCD0 001DFBD0 0200013C */  lui        $at, (0x20000 >> 16)
/* DFCD4 001DFBD4 21082101 */  addu       $at, $9, $at
/* DFCD8 001DFBD8 C8E420A4 */  sh         $0, -0x1B38($at)
/* DFCDC 001DFBDC 0043063C */  lui        $6, (0x43000000 >> 16)
/* DFCE0 001DFBE0 0200013C */  lui        $at, (0x20000 >> 16)
/* DFCE4 001DFBE4 21082101 */  addu       $at, $9, $at
/* DFCE8 001DFBE8 F0E426AC */  sw         $6, -0x1B10($at)
/* DFCEC 001DFBEC 0200013C */  lui        $at, (0x20000 >> 16)
/* DFCF0 001DFBF0 21082101 */  addu       $at, $9, $at
/* DFCF4 001DFBF4 F4E420AC */  sw         $0, -0x1B0C($at)
/* DFCF8 001DFBF8 0200013C */  lui        $at, (0x20000 >> 16)
/* DFCFC 001DFBFC 21082101 */  addu       $at, $9, $at
/* DFD00 001DFC00 F8E420AC */  sw         $0, -0x1B08($at)
/* DFD04 001DFC04 0200013C */  lui        $at, (0x20000 >> 16)
/* DFD08 001DFC08 21082101 */  addu       $at, $9, $at
/* DFD0C 001DFC0C 34E520AC */  sw         $0, -0x1ACC($at)
/* DFD10 001DFC10 0200013C */  lui        $at, (0x20000 >> 16)
/* DFD14 001DFC14 21082101 */  addu       $at, $9, $at
/* DFD18 001DFC18 A6E420A4 */  sh         $0, -0x1B5A($at)
/* DFD1C 001DFC1C 0200013C */  lui        $at, (0x20000 >> 16)
/* DFD20 001DFC20 21082101 */  addu       $at, $9, $at
/* DFD24 001DFC24 30E520AC */  sw         $0, -0x1AD0($at)
/* DFD28 001DFC28 0200013C */  lui        $at, (0x20000 >> 16)
/* DFD2C 001DFC2C 21082101 */  addu       $at, $9, $at
/* DFD30 001DFC30 C4E420A4 */  sh         $0, -0x1B3C($at)
/* DFD34 001DFC34 0200013C */  lui        $at, (0x20000 >> 16)
/* DFD38 001DFC38 21082101 */  addu       $at, $9, $at
/* DFD3C 001DFC3C B8E420AC */  sw         $0, -0x1B48($at)
/* DFD40 001DFC40 0200013C */  lui        $at, (0x20000 >> 16)
/* DFD44 001DFC44 21082101 */  addu       $at, $9, $at
/* DFD48 001DFC48 84E420A4 */  sh         $0, -0x1B7C($at)
/* DFD4C 001DFC4C 0200013C */  lui        $at, (0x20000 >> 16)
/* DFD50 001DFC50 21082101 */  addu       $at, $9, $at
/* DFD54 001DFC54 A0E428A4 */  sh         $8, -0x1B60($at)
/* DFD58 001DFC58 0200013C */  lui        $at, (0x20000 >> 16)
/* DFD5C 001DFC5C 21082101 */  addu       $at, $9, $at
/* DFD60 001DFC60 A2E428A4 */  sh         $8, -0x1B5E($at)
/* DFD64 001DFC64 0200013C */  lui        $at, (0x20000 >> 16)
/* DFD68 001DFC68 21082101 */  addu       $at, $9, $at
/* DFD6C 001DFC6C 40E520AC */  sw         $0, -0x1AC0($at)
/* DFD70 001DFC70 0200013C */  lui        $at, (0x20000 >> 16)
/* DFD74 001DFC74 21082101 */  addu       $at, $9, $at
/* DFD78 001DFC78 44E520AC */  sw         $0, -0x1ABC($at)
/* DFD7C 001DFC7C 0200013C */  lui        $at, (0x20000 >> 16)
/* DFD80 001DFC80 21082101 */  addu       $at, $9, $at
/* DFD84 001DFC84 48E520AC */  sw         $0, -0x1AB8($at)
/* DFD88 001DFC88 0200013C */  lui        $at, (0x20000 >> 16)
/* DFD8C 001DFC8C 21082101 */  addu       $at, $9, $at
/* DFD90 001DFC90 4CE527AC */  sw         $7, -0x1AB4($at)
/* DFD94 001DFC94 0200013C */  lui        $at, (0x20000 >> 16)
/* DFD98 001DFC98 21082101 */  addu       $at, $9, $at
/* DFD9C 001DFC9C 50E520AC */  sw         $0, -0x1AB0($at)
/* DFDA0 001DFCA0 0200013C */  lui        $at, (0x20000 >> 16)
/* DFDA4 001DFCA4 21082101 */  addu       $at, $9, $at
/* DFDA8 001DFCA8 54E520AC */  sw         $0, -0x1AAC($at)
/* DFDAC 001DFCAC 0200013C */  lui        $at, (0x20000 >> 16)
/* DFDB0 001DFCB0 21082101 */  addu       $at, $9, $at
/* DFDB4 001DFCB4 58E527AC */  sw         $7, -0x1AA8($at)
/* DFDB8 001DFCB8 21304401 */  addu       $6, $10, $4
/* DFDBC 001DFCBC 5000C0AC */  sw         $0, 0x50($6)
/* DFDC0 001DFCC0 0000C68C */  lw         $6, 0x0($6)
/* DFDC4 001DFCC4 0200C010 */  beqz       $6, .L001DFCD0
/* DFDC8 001DFCC8 00000000 */   nop
/* DFDCC 001DFCCC 0800C0AC */  sw         $0, 0x8($6)
.L001DFCD0:
/* DFDD0 001DFCD0 28460070 */  paddub     $8, $0, $0
/* DFDD4 001DFCD4 10000010 */  b          .L001DFD18
/* DFDD8 001DFCD8 00000000 */   nop
.L001DFCDC:
/* DFDDC 001DFCDC C0300300 */  sll        $6, $3, 3
/* DFDE0 001DFCE0 2138C300 */  addu       $7, $6, $3
/* DFDE4 001DFCE4 C0300700 */  sll        $6, $7, 3
/* DFDE8 001DFCE8 2130E600 */  addu       $6, $7, $6
/* DFDEC 001DFCEC 00310600 */  sll        $6, $6, 4
/* DFDF0 001DFCF0 2130C400 */  addu       $6, $6, $4
/* DFDF4 001DFCF4 80380800 */  sll        $7, $8, 2
/* DFDF8 001DFCF8 2130E600 */  addu       $6, $7, $6
/* DFDFC 001DFCFC 0500013C */  lui        $at, (0x55450 >> 16)
/* DFE00 001DFD00 2108C100 */  addu       $at, $6, $at
/* DFE04 001DFD04 505420AC */  sw         $0, (0x55450 & 0xFFFF)($at)
/* DFE08 001DFD08 0500013C */  lui        $at, (0x553D0 >> 16)
/* DFE0C 001DFD0C 2108C100 */  addu       $at, $6, $at
/* DFE10 001DFD10 D05320AC */  sw         $0, (0x553D0 & 0xFFFF)($at)
/* DFE14 001DFD14 01000825 */  addiu      $8, $8, 0x1
.L001DFD18:
/* DFE18 001DFD18 10000629 */  slti       $6, $8, 0x10
/* DFE1C 001DFD1C EFFFC014 */  bnez       $6, .L001DFCDC
/* DFE20 001DFD20 00000000 */   nop
/* DFE24 001DFD24 28460070 */  paddub     $8, $0, $0
/* DFE28 001DFD28 0A000010 */  b          .L001DFD54
/* DFE2C 001DFD2C 00000000 */   nop
.L001DFD30:
/* DFE30 001DFD30 50030624 */  addiu      $6, $0, 0x350
/* DFE34 001DFD34 18306600 */  mult       $6, $3, $6
/* DFE38 001DFD38 2138C400 */  addu       $7, $6, $4
/* DFE3C 001DFD3C 80300800 */  sll        $6, $8, 2
/* DFE40 001DFD40 2130C700 */  addu       $6, $6, $7
/* DFE44 001DFD44 0600013C */  lui        $at, (0x60000 >> 16)
/* DFE48 001DFD48 2108C100 */  addu       $at, $6, $at
/* DFE4C 001DFD4C 50A620AC */  sw         $0, -0x59B0($at)
/* DFE50 001DFD50 01000825 */  addiu      $8, $8, 0x1
.L001DFD54:
/* DFE54 001DFD54 10000629 */  slti       $6, $8, 0x10
/* DFE58 001DFD58 F5FFC014 */  bnez       $6, .L001DFD30
/* DFE5C 001DFD5C 00000000 */   nop
/* DFE60 001DFD60 28460070 */  paddub     $8, $0, $0
/* DFE64 001DFD64 13000010 */  b          .L001DFDB4
/* DFE68 001DFD68 00000000 */   nop
.L001DFD6C:
/* DFE6C 001DFD6C 80300300 */  sll        $6, $3, 2
/* DFE70 001DFD70 2130C300 */  addu       $6, $6, $3
/* DFE74 001DFD74 40300600 */  sll        $6, $6, 1
/* DFE78 001DFD78 2130C300 */  addu       $6, $6, $3
/* DFE7C 001DFD7C 40310600 */  sll        $6, $6, 5
/* DFE80 001DFD80 2138C400 */  addu       $7, $6, $4
/* DFE84 001DFD84 80300800 */  sll        $6, $8, 2
/* DFE88 001DFD88 2130C700 */  addu       $6, $6, $7
/* DFE8C 001DFD8C 0600013C */  lui        $at, (0x60000 >> 16)
/* DFE90 001DFD90 2108C100 */  addu       $at, $6, $at
/* DFE94 001DFD94 10D920AC */  sw         $0, -0x26F0($at)
/* DFE98 001DFD98 0600013C */  lui        $at, (0x60000 >> 16)
/* DFE9C 001DFD9C 2108C100 */  addu       $at, $6, $at
/* DFEA0 001DFDA0 70D920AC */  sw         $0, -0x2690($at)
/* DFEA4 001DFDA4 0600013C */  lui        $at, (0x60000 >> 16)
/* DFEA8 001DFDA8 2108E100 */  addu       $at, $7, $at
/* DFEAC 001DFDAC A0D920AC */  sw         $0, -0x2660($at)
/* DFEB0 001DFDB0 01000825 */  addiu      $8, $8, 0x1
.L001DFDB4:
/* DFEB4 001DFDB4 0C000629 */  slti       $6, $8, 0xC
/* DFEB8 001DFDB8 ECFFC014 */  bnez       $6, .L001DFD6C
/* DFEBC 001DFDBC 00000000 */   nop
/* DFEC0 001DFDC0 28460070 */  paddub     $8, $0, $0
/* DFEC4 001DFDC4 0F000010 */  b          .L001DFE04
/* DFEC8 001DFDC8 00000000 */   nop
.L001DFDCC:
/* DFECC 001DFDCC FFFF0724 */  addiu      $7, $0, -0x1
/* DFED0 001DFDD0 00310300 */  sll        $6, $3, 4
/* DFED4 001DFDD4 2130C300 */  addu       $6, $6, $3
/* DFED8 001DFDD8 00310600 */  sll        $6, $6, 4
/* DFEDC 001DFDDC 2130C400 */  addu       $6, $6, $4
/* DFEE0 001DFDE0 80480800 */  sll        $9, $8, 2
/* DFEE4 001DFDE4 21302601 */  addu       $6, $9, $6
/* DFEE8 001DFDE8 0600013C */  lui        $at, (0x60000 >> 16)
/* DFEEC 001DFDEC 2108C100 */  addu       $at, $6, $at
/* DFEF0 001DFDF0 D0EE27AC */  sw         $7, -0x1130($at)
/* DFEF4 001DFDF4 0600013C */  lui        $at, (0x60000 >> 16)
/* DFEF8 001DFDF8 2108C100 */  addu       $at, $6, $at
/* DFEFC 001DFDFC 10EF20AC */  sw         $0, -0x10F0($at)
/* DFF00 001DFE00 01000825 */  addiu      $8, $8, 0x1
.L001DFE04:
/* DFF04 001DFE04 10000629 */  slti       $6, $8, 0x10
/* DFF08 001DFE08 F0FFC014 */  bnez       $6, .L001DFDCC
/* DFF0C 001DFE0C 00000000 */   nop
/* DFF10 001DFE10 FFFF0724 */  addiu      $7, $0, -0x1
/* DFF14 001DFE14 00310300 */  sll        $6, $3, 4
/* DFF18 001DFE18 2130C300 */  addu       $6, $6, $3
/* DFF1C 001DFE1C 00310600 */  sll        $6, $6, 4
/* DFF20 001DFE20 2130C400 */  addu       $6, $6, $4
/* DFF24 001DFE24 0600013C */  lui        $at, (0x60000 >> 16)
/* DFF28 001DFE28 2108C100 */  addu       $at, $6, $at
/* DFF2C 001DFE2C 5CEF27AC */  sw         $7, -0x10A4($at)
/* DFF30 001DFE30 40300300 */  sll        $6, $3, 1
/* DFF34 001DFE34 2130C300 */  addu       $6, $6, $3
/* DFF38 001DFE38 00310600 */  sll        $6, $6, 4
/* DFF3C 001DFE3C 2130C400 */  addu       $6, $6, $4
/* DFF40 001DFE40 0600013C */  lui        $at, (0x60000 >> 16)
/* DFF44 001DFE44 2108C100 */  addu       $at, $6, $at
/* DFF48 001DFE48 70FF20AC */  sw         $0, -0x90($at)
/* DFF4C 001DFE4C 0600013C */  lui        $at, (0x60000 >> 16)
/* DFF50 001DFE50 2108C100 */  addu       $at, $6, $at
/* DFF54 001DFE54 74FF20AC */  sw         $0, -0x8C($at)
/* DFF58 001DFE58 0600013C */  lui        $at, (0x60270 >> 16)
/* DFF5C 001DFE5C 2108C100 */  addu       $at, $6, $at
/* DFF60 001DFE60 700220AC */  sw         $0, (0x60270 & 0xFFFF)($at)
/* DFF64 001DFE64 0600013C */  lui        $at, (0x60274 >> 16)
/* DFF68 001DFE68 2108C100 */  addu       $at, $6, $at
/* DFF6C 001DFE6C 740220AC */  sw         $0, (0x60274 & 0xFFFF)($at)
/* DFF70 001DFE70 01006324 */  addiu      $3, $3, 0x1
.L001DFE74:
/* DFF74 001DFE74 10006628 */  slti       $6, $3, 0x10
/* DFF78 001DFE78 E0FEC014 */  bnez       $6, .L001DF9FC
/* DFF7C 001DFE7C 00000000 */   nop
/* DFF80 001DFE80 440085AC */  sw         $5, 0x44($4)
/* DFF84 001DFE84 4C0080AC */  sw         $0, 0x4C($4)
/* DFF88 001DFE88 0800E003 */  jr         $31
/* DFF8C 001DFE8C 00000000 */   nop
