.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CleanViewMonstor__12CMonstorUnitFi
/* 0DFAF0 001DF9F0 281E0070 */  paddub      $3, $0, $0
/* 0DFAF4 001DF9F4 1F010010 */  b           .L001DFE74
/* 0DFAF8 001DF9F8 00000000 */   nop
.L001DF9FC:
/* 0DFAFC 001DF9FC FFFF0B24 */  addiu       $11, $0, -0x1
/* 0DFB00 001DFA00 80500300 */  sll         $10, $3, 2
/* 0DFB04 001DFA04 21384301 */  addu        $7, $10, $3
/* 0DFB08 001DFA08 80300700 */  sll         $6, $7, 2
/* 0DFB0C 001DFA0C 2130E600 */  addu        $6, $7, $6
/* 0DFB10 001DFA10 00310600 */  sll         $6, $6, 4
/* 0DFB14 001DFA14 2148C400 */  addu        $9, $6, $4
/* 0DFB18 001DFA18 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFB1C 001DFA1C 21082101 */  addu        $1, $9, $1
/* 0DFB20 001DFA20 D0E32BAC */  sw          $11, -0x1C30($1)
/* 0DFB24 001DFA24 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFB28 001DFA28 21082101 */  addu        $1, $9, $1
/* 0DFB2C 001DFA2C D8E320AC */  sw          $0, -0x1C28($1)
/* 0DFB30 001DFA30 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFB34 001DFA34 21082101 */  addu        $1, $9, $1
/* 0DFB38 001DFA38 DCE320AC */  sw          $0, -0x1C24($1)
/* 0DFB3C 001DFA3C 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFB40 001DFA40 21082101 */  addu        $1, $9, $1
/* 0DFB44 001DFA44 E0E320AC */  sw          $0, -0x1C20($1)
/* 0DFB48 001DFA48 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFB4C 001DFA4C 21082101 */  addu        $1, $9, $1
/* 0DFB50 001DFA50 E4E320AC */  sw          $0, -0x1C1C($1)
/* 0DFB54 001DFA54 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFB58 001DFA58 21082101 */  addu        $1, $9, $1
/* 0DFB5C 001DFA5C 20E420AC */  sw          $0, -0x1BE0($1)
/* 0DFB60 001DFA60 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFB64 001DFA64 21082101 */  addu        $1, $9, $1
/* 0DFB68 001DFA68 38E420AC */  sw          $0, -0x1BC8($1)
/* 0DFB6C 001DFA6C 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFB70 001DFA70 21082101 */  addu        $1, $9, $1
/* 0DFB74 001DFA74 34E420AC */  sw          $0, -0x1BCC($1)
/* 0DFB78 001DFA78 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFB7C 001DFA7C 21082101 */  addu        $1, $9, $1
/* 0DFB80 001DFA80 30E420AC */  sw          $0, -0x1BD0($1)
/* 0DFB84 001DFA84 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFB88 001DFA88 21082101 */  addu        $1, $9, $1
/* 0DFB8C 001DFA8C 48E420AC */  sw          $0, -0x1BB8($1)
/* 0DFB90 001DFA90 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFB94 001DFA94 21082101 */  addu        $1, $9, $1
/* 0DFB98 001DFA98 44E420AC */  sw          $0, -0x1BBC($1)
/* 0DFB9C 001DFA9C 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFBA0 001DFAA0 21082101 */  addu        $1, $9, $1
/* 0DFBA4 001DFAA4 40E420AC */  sw          $0, -0x1BC0($1)
/* 0DFBA8 001DFAA8 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFBAC 001DFAAC 21082101 */  addu        $1, $9, $1
/* 0DFBB0 001DFAB0 50E420AC */  sw          $0, -0x1BB0($1)
/* 0DFBB4 001DFAB4 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFBB8 001DFAB8 21082101 */  addu        $1, $9, $1
/* 0DFBBC 001DFABC 54E420AC */  sw          $0, -0x1BAC($1)
/* 0DFBC0 001DFAC0 01000824 */  addiu       $8, $0, 0x1
/* 0DFBC4 001DFAC4 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFBC8 001DFAC8 21082101 */  addu        $1, $9, $1
/* 0DFBCC 001DFACC 58E428AC */  sw          $8, -0x1BA8($1)
/* 0DFBD0 001DFAD0 5041063C */  lui         $6, (0x41500000 >> 16)
/* 0DFBD4 001DFAD4 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFBD8 001DFAD8 21082101 */  addu        $1, $9, $1
/* 0DFBDC 001DFADC 14E426AC */  sw          $6, -0x1BEC($1)
/* 0DFBE0 001DFAE0 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFBE4 001DFAE4 21082101 */  addu        $1, $9, $1
/* 0DFBE8 001DFAE8 18E426AC */  sw          $6, -0x1BE8($1)
/* 0DFBEC 001DFAEC 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFBF0 001DFAF0 21082101 */  addu        $1, $9, $1
/* 0DFBF4 001DFAF4 64E420A4 */  sh          $0, -0x1B9C($1)
/* 0DFBF8 001DFAF8 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFBFC 001DFAFC 21082101 */  addu        $1, $9, $1
/* 0DFC00 001DFB00 68E420AC */  sw          $0, -0x1B98($1)
/* 0DFC04 001DFB04 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFC08 001DFB08 21082101 */  addu        $1, $9, $1
/* 0DFC0C 001DFB0C 70E42BA4 */  sh          $11, -0x1B90($1)
/* 0DFC10 001DFB10 9643063C */  lui         $6, (0x43960000 >> 16)
/* 0DFC14 001DFB14 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFC18 001DFB18 21082101 */  addu        $1, $9, $1
/* 0DFC1C 001DFB1C 74E426AC */  sw          $6, -0x1B8C($1)
/* 0DFC20 001DFB20 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFC24 001DFB24 21082101 */  addu        $1, $9, $1
/* 0DFC28 001DFB28 78E420AC */  sw          $0, -0x1B88($1)
/* 0DFC2C 001DFB2C 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFC30 001DFB30 21082101 */  addu        $1, $9, $1
/* 0DFC34 001DFB34 7CE42BA4 */  sh          $11, -0x1B84($1)
/* 0DFC38 001DFB38 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFC3C 001DFB3C 21082101 */  addu        $1, $9, $1
/* 0DFC40 001DFB40 7EE42BA4 */  sh          $11, -0x1B82($1)
/* 0DFC44 001DFB44 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFC48 001DFB48 21082101 */  addu        $1, $9, $1
/* 0DFC4C 001DFB4C 90E42BAC */  sw          $11, -0x1B70($1)
/* 0DFC50 001DFB50 803F073C */  lui         $7, (0x3F800000 >> 16)
/* 0DFC54 001DFB54 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFC58 001DFB58 21082101 */  addu        $1, $9, $1
/* 0DFC5C 001DFB5C 9CE427AC */  sw          $7, -0x1B64($1)
/* 0DFC60 001DFB60 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFC64 001DFB64 21082101 */  addu        $1, $9, $1
/* 0DFC68 001DFB68 CCE420AC */  sw          $0, -0x1B34($1)
/* 0DFC6C 001DFB6C 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFC70 001DFB70 21082101 */  addu        $1, $9, $1
/* 0DFC74 001DFB74 E0E427AC */  sw          $7, -0x1B20($1)
/* 0DFC78 001DFB78 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFC7C 001DFB7C 21082101 */  addu        $1, $9, $1
/* 0DFC80 001DFB80 E4E427AC */  sw          $7, -0x1B1C($1)
/* 0DFC84 001DFB84 F042063C */  lui         $6, (0x42F00000 >> 16)
/* 0DFC88 001DFB88 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFC8C 001DFB8C 21082101 */  addu        $1, $9, $1
/* 0DFC90 001DFB90 E8E426AC */  sw          $6, -0x1B18($1)
/* 0DFC94 001DFB94 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFC98 001DFB98 21082101 */  addu        $1, $9, $1
/* 0DFC9C 001DFB9C ECE428A4 */  sh          $8, -0x1B14($1)
/* 0DFCA0 001DFBA0 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFCA4 001DFBA4 21082101 */  addu        $1, $9, $1
/* 0DFCA8 001DFBA8 A4E42BA4 */  sh          $11, -0x1B5C($1)
/* 0DFCAC 001DFBAC 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFCB0 001DFBB0 21082101 */  addu        $1, $9, $1
/* 0DFCB4 001DFBB4 A8E42BA4 */  sh          $11, -0x1B58($1)
/* 0DFCB8 001DFBB8 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFCBC 001DFBBC 21082101 */  addu        $1, $9, $1
/* 0DFCC0 001DFBC0 0CE420AC */  sw          $0, -0x1BF4($1)
/* 0DFCC4 001DFBC4 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFCC8 001DFBC8 21082101 */  addu        $1, $9, $1
/* 0DFCCC 001DFBCC C6E42BA4 */  sh          $11, -0x1B3A($1)
/* 0DFCD0 001DFBD0 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFCD4 001DFBD4 21082101 */  addu        $1, $9, $1
/* 0DFCD8 001DFBD8 C8E420A4 */  sh          $0, -0x1B38($1)
/* 0DFCDC 001DFBDC 0043063C */  lui         $6, (0x43000000 >> 16)
/* 0DFCE0 001DFBE0 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFCE4 001DFBE4 21082101 */  addu        $1, $9, $1
/* 0DFCE8 001DFBE8 F0E426AC */  sw          $6, -0x1B10($1)
/* 0DFCEC 001DFBEC 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFCF0 001DFBF0 21082101 */  addu        $1, $9, $1
/* 0DFCF4 001DFBF4 F4E420AC */  sw          $0, -0x1B0C($1)
/* 0DFCF8 001DFBF8 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFCFC 001DFBFC 21082101 */  addu        $1, $9, $1
/* 0DFD00 001DFC00 F8E420AC */  sw          $0, -0x1B08($1)
/* 0DFD04 001DFC04 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFD08 001DFC08 21082101 */  addu        $1, $9, $1
/* 0DFD0C 001DFC0C 34E520AC */  sw          $0, -0x1ACC($1)
/* 0DFD10 001DFC10 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFD14 001DFC14 21082101 */  addu        $1, $9, $1
/* 0DFD18 001DFC18 A6E420A4 */  sh          $0, -0x1B5A($1)
/* 0DFD1C 001DFC1C 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFD20 001DFC20 21082101 */  addu        $1, $9, $1
/* 0DFD24 001DFC24 30E520AC */  sw          $0, -0x1AD0($1)
/* 0DFD28 001DFC28 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFD2C 001DFC2C 21082101 */  addu        $1, $9, $1
/* 0DFD30 001DFC30 C4E420A4 */  sh          $0, -0x1B3C($1)
/* 0DFD34 001DFC34 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFD38 001DFC38 21082101 */  addu        $1, $9, $1
/* 0DFD3C 001DFC3C B8E420AC */  sw          $0, -0x1B48($1)
/* 0DFD40 001DFC40 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFD44 001DFC44 21082101 */  addu        $1, $9, $1
/* 0DFD48 001DFC48 84E420A4 */  sh          $0, -0x1B7C($1)
/* 0DFD4C 001DFC4C 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFD50 001DFC50 21082101 */  addu        $1, $9, $1
/* 0DFD54 001DFC54 A0E428A4 */  sh          $8, -0x1B60($1)
/* 0DFD58 001DFC58 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFD5C 001DFC5C 21082101 */  addu        $1, $9, $1
/* 0DFD60 001DFC60 A2E428A4 */  sh          $8, -0x1B5E($1)
/* 0DFD64 001DFC64 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFD68 001DFC68 21082101 */  addu        $1, $9, $1
/* 0DFD6C 001DFC6C 40E520AC */  sw          $0, -0x1AC0($1)
/* 0DFD70 001DFC70 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFD74 001DFC74 21082101 */  addu        $1, $9, $1
/* 0DFD78 001DFC78 44E520AC */  sw          $0, -0x1ABC($1)
/* 0DFD7C 001DFC7C 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFD80 001DFC80 21082101 */  addu        $1, $9, $1
/* 0DFD84 001DFC84 48E520AC */  sw          $0, -0x1AB8($1)
/* 0DFD88 001DFC88 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFD8C 001DFC8C 21082101 */  addu        $1, $9, $1
/* 0DFD90 001DFC90 4CE527AC */  sw          $7, -0x1AB4($1)
/* 0DFD94 001DFC94 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFD98 001DFC98 21082101 */  addu        $1, $9, $1
/* 0DFD9C 001DFC9C 50E520AC */  sw          $0, -0x1AB0($1)
/* 0DFDA0 001DFCA0 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFDA4 001DFCA4 21082101 */  addu        $1, $9, $1
/* 0DFDA8 001DFCA8 54E520AC */  sw          $0, -0x1AAC($1)
/* 0DFDAC 001DFCAC 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DFDB0 001DFCB0 21082101 */  addu        $1, $9, $1
/* 0DFDB4 001DFCB4 58E527AC */  sw          $7, -0x1AA8($1)
/* 0DFDB8 001DFCB8 21304401 */  addu        $6, $10, $4
/* 0DFDBC 001DFCBC 5000C0AC */  sw          $0, 0x50($6)
/* 0DFDC0 001DFCC0 0000C68C */  lw          $6, 0x0($6)
/* 0DFDC4 001DFCC4 0200C010 */  beqz        $6, .L001DFCD0
/* 0DFDC8 001DFCC8 00000000 */   nop
/* 0DFDCC 001DFCCC 0800C0AC */  sw          $0, 0x8($6)
.L001DFCD0:
/* 0DFDD0 001DFCD0 28460070 */  paddub      $8, $0, $0
/* 0DFDD4 001DFCD4 10000010 */  b           .L001DFD18
/* 0DFDD8 001DFCD8 00000000 */   nop
.L001DFCDC:
/* 0DFDDC 001DFCDC C0300300 */  sll         $6, $3, 3
/* 0DFDE0 001DFCE0 2138C300 */  addu        $7, $6, $3
/* 0DFDE4 001DFCE4 C0300700 */  sll         $6, $7, 3
/* 0DFDE8 001DFCE8 2130E600 */  addu        $6, $7, $6
/* 0DFDEC 001DFCEC 00310600 */  sll         $6, $6, 4
/* 0DFDF0 001DFCF0 2130C400 */  addu        $6, $6, $4
/* 0DFDF4 001DFCF4 80380800 */  sll         $7, $8, 2
/* 0DFDF8 001DFCF8 2130E600 */  addu        $6, $7, $6
/* 0DFDFC 001DFCFC 0500013C */  lui         $1, (0x55450 >> 16)
/* 0DFE00 001DFD00 2108C100 */  addu        $1, $6, $1
/* 0DFE04 001DFD04 505420AC */  sw          $0, (0x55450 & 0xFFFF)($1)
/* 0DFE08 001DFD08 0500013C */  lui         $1, (0x553D0 >> 16)
/* 0DFE0C 001DFD0C 2108C100 */  addu        $1, $6, $1
/* 0DFE10 001DFD10 D05320AC */  sw          $0, (0x553D0 & 0xFFFF)($1)
/* 0DFE14 001DFD14 01000825 */  addiu       $8, $8, 0x1
.L001DFD18:
/* 0DFE18 001DFD18 10000629 */  slti        $6, $8, 0x10
/* 0DFE1C 001DFD1C EFFFC014 */  bnez        $6, .L001DFCDC
/* 0DFE20 001DFD20 00000000 */   nop
/* 0DFE24 001DFD24 28460070 */  paddub      $8, $0, $0
/* 0DFE28 001DFD28 0A000010 */  b           .L001DFD54
/* 0DFE2C 001DFD2C 00000000 */   nop
.L001DFD30:
/* 0DFE30 001DFD30 50030624 */  addiu       $6, $0, 0x350
/* 0DFE34 001DFD34 18306600 */  mult        $6, $3, $6
/* 0DFE38 001DFD38 2138C400 */  addu        $7, $6, $4
/* 0DFE3C 001DFD3C 80300800 */  sll         $6, $8, 2
/* 0DFE40 001DFD40 2130C700 */  addu        $6, $6, $7
/* 0DFE44 001DFD44 0600013C */  lui         $1, (0x60000 >> 16)
/* 0DFE48 001DFD48 2108C100 */  addu        $1, $6, $1
/* 0DFE4C 001DFD4C 50A620AC */  sw          $0, -0x59B0($1)
/* 0DFE50 001DFD50 01000825 */  addiu       $8, $8, 0x1
.L001DFD54:
/* 0DFE54 001DFD54 10000629 */  slti        $6, $8, 0x10
/* 0DFE58 001DFD58 F5FFC014 */  bnez        $6, .L001DFD30
/* 0DFE5C 001DFD5C 00000000 */   nop
/* 0DFE60 001DFD60 28460070 */  paddub      $8, $0, $0
/* 0DFE64 001DFD64 13000010 */  b           .L001DFDB4
/* 0DFE68 001DFD68 00000000 */   nop
.L001DFD6C:
/* 0DFE6C 001DFD6C 80300300 */  sll         $6, $3, 2
/* 0DFE70 001DFD70 2130C300 */  addu        $6, $6, $3
/* 0DFE74 001DFD74 40300600 */  sll         $6, $6, 1
/* 0DFE78 001DFD78 2130C300 */  addu        $6, $6, $3
/* 0DFE7C 001DFD7C 40310600 */  sll         $6, $6, 5
/* 0DFE80 001DFD80 2138C400 */  addu        $7, $6, $4
/* 0DFE84 001DFD84 80300800 */  sll         $6, $8, 2
/* 0DFE88 001DFD88 2130C700 */  addu        $6, $6, $7
/* 0DFE8C 001DFD8C 0600013C */  lui         $1, (0x60000 >> 16)
/* 0DFE90 001DFD90 2108C100 */  addu        $1, $6, $1
/* 0DFE94 001DFD94 10D920AC */  sw          $0, -0x26F0($1)
/* 0DFE98 001DFD98 0600013C */  lui         $1, (0x60000 >> 16)
/* 0DFE9C 001DFD9C 2108C100 */  addu        $1, $6, $1
/* 0DFEA0 001DFDA0 70D920AC */  sw          $0, -0x2690($1)
/* 0DFEA4 001DFDA4 0600013C */  lui         $1, (0x60000 >> 16)
/* 0DFEA8 001DFDA8 2108E100 */  addu        $1, $7, $1
/* 0DFEAC 001DFDAC A0D920AC */  sw          $0, -0x2660($1)
/* 0DFEB0 001DFDB0 01000825 */  addiu       $8, $8, 0x1
.L001DFDB4:
/* 0DFEB4 001DFDB4 0C000629 */  slti        $6, $8, 0xC
/* 0DFEB8 001DFDB8 ECFFC014 */  bnez        $6, .L001DFD6C
/* 0DFEBC 001DFDBC 00000000 */   nop
/* 0DFEC0 001DFDC0 28460070 */  paddub      $8, $0, $0
/* 0DFEC4 001DFDC4 0F000010 */  b           .L001DFE04
/* 0DFEC8 001DFDC8 00000000 */   nop
.L001DFDCC:
/* 0DFECC 001DFDCC FFFF0724 */  addiu       $7, $0, -0x1
/* 0DFED0 001DFDD0 00310300 */  sll         $6, $3, 4
/* 0DFED4 001DFDD4 2130C300 */  addu        $6, $6, $3
/* 0DFED8 001DFDD8 00310600 */  sll         $6, $6, 4
/* 0DFEDC 001DFDDC 2130C400 */  addu        $6, $6, $4
/* 0DFEE0 001DFDE0 80480800 */  sll         $9, $8, 2
/* 0DFEE4 001DFDE4 21302601 */  addu        $6, $9, $6
/* 0DFEE8 001DFDE8 0600013C */  lui         $1, (0x60000 >> 16)
/* 0DFEEC 001DFDEC 2108C100 */  addu        $1, $6, $1
/* 0DFEF0 001DFDF0 D0EE27AC */  sw          $7, -0x1130($1)
/* 0DFEF4 001DFDF4 0600013C */  lui         $1, (0x60000 >> 16)
/* 0DFEF8 001DFDF8 2108C100 */  addu        $1, $6, $1
/* 0DFEFC 001DFDFC 10EF20AC */  sw          $0, -0x10F0($1)
/* 0DFF00 001DFE00 01000825 */  addiu       $8, $8, 0x1
.L001DFE04:
/* 0DFF04 001DFE04 10000629 */  slti        $6, $8, 0x10
/* 0DFF08 001DFE08 F0FFC014 */  bnez        $6, .L001DFDCC
/* 0DFF0C 001DFE0C 00000000 */   nop
/* 0DFF10 001DFE10 FFFF0724 */  addiu       $7, $0, -0x1
/* 0DFF14 001DFE14 00310300 */  sll         $6, $3, 4
/* 0DFF18 001DFE18 2130C300 */  addu        $6, $6, $3
/* 0DFF1C 001DFE1C 00310600 */  sll         $6, $6, 4
/* 0DFF20 001DFE20 2130C400 */  addu        $6, $6, $4
/* 0DFF24 001DFE24 0600013C */  lui         $1, (0x60000 >> 16)
/* 0DFF28 001DFE28 2108C100 */  addu        $1, $6, $1
/* 0DFF2C 001DFE2C 5CEF27AC */  sw          $7, -0x10A4($1)
/* 0DFF30 001DFE30 40300300 */  sll         $6, $3, 1
/* 0DFF34 001DFE34 2130C300 */  addu        $6, $6, $3
/* 0DFF38 001DFE38 00310600 */  sll         $6, $6, 4
/* 0DFF3C 001DFE3C 2130C400 */  addu        $6, $6, $4
/* 0DFF40 001DFE40 0600013C */  lui         $1, (0x60000 >> 16)
/* 0DFF44 001DFE44 2108C100 */  addu        $1, $6, $1
/* 0DFF48 001DFE48 70FF20AC */  sw          $0, -0x90($1)
/* 0DFF4C 001DFE4C 0600013C */  lui         $1, (0x60000 >> 16)
/* 0DFF50 001DFE50 2108C100 */  addu        $1, $6, $1
/* 0DFF54 001DFE54 74FF20AC */  sw          $0, -0x8C($1)
/* 0DFF58 001DFE58 0600013C */  lui         $1, (0x60270 >> 16)
/* 0DFF5C 001DFE5C 2108C100 */  addu        $1, $6, $1
/* 0DFF60 001DFE60 700220AC */  sw          $0, (0x60270 & 0xFFFF)($1)
/* 0DFF64 001DFE64 0600013C */  lui         $1, (0x60274 >> 16)
/* 0DFF68 001DFE68 2108C100 */  addu        $1, $6, $1
/* 0DFF6C 001DFE6C 740220AC */  sw          $0, (0x60274 & 0xFFFF)($1)
/* 0DFF70 001DFE70 01006324 */  addiu       $3, $3, 0x1
.L001DFE74:
/* 0DFF74 001DFE74 10006628 */  slti        $6, $3, 0x10
/* 0DFF78 001DFE78 E0FEC014 */  bnez        $6, .L001DF9FC
/* 0DFF7C 001DFE7C 00000000 */   nop
/* 0DFF80 001DFE80 440085AC */  sw          $5, 0x44($4)
/* 0DFF84 001DFE84 4C0080AC */  sw          $0, 0x4C($4)
/* 0DFF88 001DFE88 0800E003 */  jr          $31
/* 0DFF8C 001DFE8C 00000000 */   nop
