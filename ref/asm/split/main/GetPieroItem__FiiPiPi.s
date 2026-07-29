.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPieroItem__FiiPiPi
/* 0BFBB0 001BFAB0 70FFBD27 */  addiu       $29, $29, -0x90
/* 0BFBB4 001BFAB4 8000BF7F */  sq          $31, 0x80($29)
/* 0BFBB8 001BFAB8 7000B77F */  sq          $23, 0x70($29)
/* 0BFBBC 001BFABC 6000B67F */  sq          $22, 0x60($29)
/* 0BFBC0 001BFAC0 5000B57F */  sq          $21, 0x50($29)
/* 0BFBC4 001BFAC4 4000B47F */  sq          $20, 0x40($29)
/* 0BFBC8 001BFAC8 3000B37F */  sq          $19, 0x30($29)
/* 0BFBCC 001BFACC 2000B27F */  sq          $18, 0x20($29)
/* 0BFBD0 001BFAD0 1000B17F */  sq          $17, 0x10($29)
/* 0BFBD4 001BFAD4 0000B07F */  sq          $16, 0x0($29)
/* 0BFBD8 001BFAD8 288EC070 */  paddub      $17, $6, $0
/* 0BFBDC 001BFADC 2886E070 */  paddub      $16, $7, $0
/* 0BFBE0 001BFAE0 C0180500 */  sll         $3, $5, 3
/* 0BFBE4 001BFAE4 23186500 */  subu        $3, $3, $5
/* 0BFBE8 001BFAE8 21188300 */  addu        $3, $4, $3
/* 0BFBEC 001BFAEC 80280300 */  sll         $5, $3, 2
/* 0BFBF0 001BFAF0 2800033C */  lui         $3, %hi(PieroItemListPtr)
/* 0BFBF4 001BFAF4 F09C6324 */  addiu       $3, $3, %lo(PieroItemListPtr)
/* 0BFBF8 001BFAF8 21186500 */  addu        $3, $3, $5
/* 0BFBFC 001BFAFC 0000728C */  lw          $18, 0x0($3)
/* 0BFC00 001BFB00 80280400 */  sll         $5, $4, 2
/* 0BFC04 001BFB04 2800033C */  lui         $3, %hi(ItemSetRateTbl)
/* 0BFC08 001BFB08 309D6324 */  addiu       $3, $3, %lo(ItemSetRateTbl)
/* 0BFC0C 001BFB0C 21186500 */  addu        $3, $3, $5
/* 0BFC10 001BFB10 0000738C */  lw          $19, 0x0($3)
/* 0BFC14 001BFB14 789C838F */  lw          $3, -0x6388($28)
/* 0BFC18 001BFB18 02006480 */  lb          $4, 0x2($3)
/* 0BFC1C 001BFB1C 2800033C */  lui         $3, %hi(floorNum)
/* 0BFC20 001BFB20 709D6324 */  addiu       $3, $3, %lo(floorNum)
/* 0BFC24 001BFB24 21186500 */  addu        $3, $3, $5
/* 0BFC28 001BFB28 0000638C */  lw          $3, 0x0($3)
/* 0BFC2C 001BFB2C 2A088300 */  slt         $1, $4, $3
/* 0BFC30 001BFB30 73002010 */  beqz        $1, .L001BFD00
/* 0BFC34 001BFB34 00000000 */   nop
/* 0BFC38 001BFB38 0000548E */  lw          $20, 0x0($18)
/* 0BFC3C 001BFB3C 0400558E */  lw          $21, 0x4($18)
/* 0BFC40 001BFB40 FFFF1624 */  addiu       $22, $0, -0x1
/* 0BFC44 001BFB44 28BEC072 */  paddub      $23, $22, $0
/* 0BFC48 001BFB48 2E000010 */  b           .L001BFC04
/* 0BFC4C 001BFB4C 00000000 */   nop
.L001BFB50:
/* 0BFC50 001BFB50 BE11040C */  jal         rand
/* 0BFC54 001BFB54 00000000 */   nop
/* 0BFC58 001BFB58 00008244 */  mtc1        $2, $f0
/* 0BFC5C 001BFB5C 00000000 */  nop
/* 0BFC60 001BFB60 60008046 */  cvt.s.w     $f1, $f0
/* 0BFC64 001BFB64 00009444 */  mtc1        $20, $f0
/* 0BFC68 001BFB68 00000000 */  nop
/* 0BFC6C 001BFB6C 20008046 */  cvt.s.w     $f0, $f0
/* 0BFC70 001BFB70 42000146 */  mul.s       $f1, $f0, $f1
/* 0BFC74 001BFB74 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BFC78 001BFB78 00008244 */  mtc1        $2, $f0
/* 0BFC7C 001BFB7C 00000000 */  nop
/* 0BFC80 001BFB80 030B0046 */  div.s       $f12, $f1, $f0
/* 0BFC84 001BFB84 2C44040C */  jal         fptosi
/* 0BFC88 001BFB88 00000000 */   nop
/* 0BFC8C 001BFB8C 28B64070 */  paddub      $22, $2, $0
/* 0BFC90 001BFB90 2A10D402 */  slt         $2, $22, $20
/* 0BFC94 001BFB94 02004014 */  bnez        $2, .L001BFBA0
/* 0BFC98 001BFB98 00000000 */   nop
/* 0BFC9C 001BFB9C 28B60070 */  paddub      $22, $0, $0
.L001BFBA0:
/* 0BFCA0 001BFBA0 BE11040C */  jal         rand
/* 0BFCA4 001BFBA4 00000000 */   nop
/* 0BFCA8 001BFBA8 00008244 */  mtc1        $2, $f0
/* 0BFCAC 001BFBAC 00000000 */  nop
/* 0BFCB0 001BFBB0 60008046 */  cvt.s.w     $f1, $f0
/* 0BFCB4 001BFBB4 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0BFCB8 001BFBB8 00008244 */  mtc1        $2, $f0
/* 0BFCBC 001BFBBC 00000000 */  nop
/* 0BFCC0 001BFBC0 42000146 */  mul.s       $f1, $f0, $f1
/* 0BFCC4 001BFBC4 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BFCC8 001BFBC8 00008244 */  mtc1        $2, $f0
/* 0BFCCC 001BFBCC 00000000 */  nop
/* 0BFCD0 001BFBD0 030B0046 */  div.s       $f12, $f1, $f0
/* 0BFCD4 001BFBD4 2C44040C */  jal         fptosi
/* 0BFCD8 001BFBD8 00000000 */   nop
/* 0BFCDC 001BFBDC 80181600 */  sll         $3, $22, 2
/* 0BFCE0 001BFBE0 21187200 */  addu        $3, $3, $18
/* 0BFCE4 001BFBE4 0800638C */  lw          $3, 0x8($3)
/* 0BFCE8 001BFBE8 40180300 */  sll         $3, $3, 1
/* 0BFCEC 001BFBEC 21187300 */  addu        $3, $3, $19
/* 0BFCF0 001BFBF0 FEFF6384 */  lh          $3, -0x2($3)
/* 0BFCF4 001BFBF4 2A186200 */  slt         $3, $3, $2
/* 0BFCF8 001BFBF8 02006014 */  bnez        $3, .L001BFC04
/* 0BFCFC 001BFBFC 00000000 */   nop
/* 0BFD00 001BFC00 FFFF1624 */  addiu       $22, $0, -0x1
.L001BFC04:
/* 0BFD04 001BFC04 FFFF0324 */  addiu       $3, $0, -0x1
/* 0BFD08 001BFC08 D1FFC312 */  beq         $22, $3, .L001BFB50
/* 0BFD0C 001BFC0C 00000000 */   nop
/* 0BFD10 001BFC10 2E000010 */  b           .L001BFCCC
/* 0BFD14 001BFC14 00000000 */   nop
.L001BFC18:
/* 0BFD18 001BFC18 BE11040C */  jal         rand
/* 0BFD1C 001BFC1C 00000000 */   nop
/* 0BFD20 001BFC20 00008244 */  mtc1        $2, $f0
/* 0BFD24 001BFC24 00000000 */  nop
/* 0BFD28 001BFC28 60008046 */  cvt.s.w     $f1, $f0
/* 0BFD2C 001BFC2C 00009544 */  mtc1        $21, $f0
/* 0BFD30 001BFC30 00000000 */  nop
/* 0BFD34 001BFC34 20008046 */  cvt.s.w     $f0, $f0
/* 0BFD38 001BFC38 42000146 */  mul.s       $f1, $f0, $f1
/* 0BFD3C 001BFC3C 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BFD40 001BFC40 00008244 */  mtc1        $2, $f0
/* 0BFD44 001BFC44 00000000 */  nop
/* 0BFD48 001BFC48 030B0046 */  div.s       $f12, $f1, $f0
/* 0BFD4C 001BFC4C 2C44040C */  jal         fptosi
/* 0BFD50 001BFC50 00000000 */   nop
/* 0BFD54 001BFC54 28BE4070 */  paddub      $23, $2, $0
/* 0BFD58 001BFC58 2A10F502 */  slt         $2, $23, $21
/* 0BFD5C 001BFC5C 02004014 */  bnez        $2, .L001BFC68
/* 0BFD60 001BFC60 00000000 */   nop
/* 0BFD64 001BFC64 28BE0070 */  paddub      $23, $0, $0
.L001BFC68:
/* 0BFD68 001BFC68 BE11040C */  jal         rand
/* 0BFD6C 001BFC6C 00000000 */   nop
/* 0BFD70 001BFC70 00008244 */  mtc1        $2, $f0
/* 0BFD74 001BFC74 00000000 */  nop
/* 0BFD78 001BFC78 60008046 */  cvt.s.w     $f1, $f0
/* 0BFD7C 001BFC7C C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0BFD80 001BFC80 00008244 */  mtc1        $2, $f0
/* 0BFD84 001BFC84 00000000 */  nop
/* 0BFD88 001BFC88 42000146 */  mul.s       $f1, $f0, $f1
/* 0BFD8C 001BFC8C 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BFD90 001BFC90 00008244 */  mtc1        $2, $f0
/* 0BFD94 001BFC94 00000000 */  nop
/* 0BFD98 001BFC98 030B0046 */  div.s       $f12, $f1, $f0
/* 0BFD9C 001BFC9C 2C44040C */  jal         fptosi
/* 0BFDA0 001BFCA0 00000000 */   nop
/* 0BFDA4 001BFCA4 80181700 */  sll         $3, $23, 2
/* 0BFDA8 001BFCA8 21187200 */  addu        $3, $3, $18
/* 0BFDAC 001BFCAC 0801638C */  lw          $3, 0x108($3)
/* 0BFDB0 001BFCB0 40180300 */  sll         $3, $3, 1
/* 0BFDB4 001BFCB4 21187300 */  addu        $3, $3, $19
/* 0BFDB8 001BFCB8 FEFF6384 */  lh          $3, -0x2($3)
/* 0BFDBC 001BFCBC 2A186200 */  slt         $3, $3, $2
/* 0BFDC0 001BFCC0 02006014 */  bnez        $3, .L001BFCCC
/* 0BFDC4 001BFCC4 00000000 */   nop
/* 0BFDC8 001BFCC8 FFFF1724 */  addiu       $23, $0, -0x1
.L001BFCCC:
/* 0BFDCC 001BFCCC FFFF0324 */  addiu       $3, $0, -0x1
/* 0BFDD0 001BFCD0 D1FFE312 */  beq         $23, $3, .L001BFC18
/* 0BFDD4 001BFCD4 00000000 */   nop
/* 0BFDD8 001BFCD8 80181600 */  sll         $3, $22, 2
/* 0BFDDC 001BFCDC 21187200 */  addu        $3, $3, $18
/* 0BFDE0 001BFCE0 0800638C */  lw          $3, 0x8($3)
/* 0BFDE4 001BFCE4 000023AE */  sw          $3, 0x0($17)
/* 0BFDE8 001BFCE8 80181700 */  sll         $3, $23, 2
/* 0BFDEC 001BFCEC 21187200 */  addu        $3, $3, $18
/* 0BFDF0 001BFCF0 0801638C */  lw          $3, 0x108($3)
/* 0BFDF4 001BFCF4 000003AE */  sw          $3, 0x0($16)
/* 0BFDF8 001BFCF8 71000010 */  b           .L001BFEC0
/* 0BFDFC 001BFCFC 00000000 */   nop
.L001BFD00:
/* 0BFE00 001BFD00 0802548E */  lw          $20, 0x208($18)
/* 0BFE04 001BFD04 0C02558E */  lw          $21, 0x20C($18)
/* 0BFE08 001BFD08 FFFF1624 */  addiu       $22, $0, -0x1
/* 0BFE0C 001BFD0C 28BEC072 */  paddub      $23, $22, $0
/* 0BFE10 001BFD10 2E000010 */  b           .L001BFDCC
/* 0BFE14 001BFD14 00000000 */   nop
.L001BFD18:
/* 0BFE18 001BFD18 BE11040C */  jal         rand
/* 0BFE1C 001BFD1C 00000000 */   nop
/* 0BFE20 001BFD20 00008244 */  mtc1        $2, $f0
/* 0BFE24 001BFD24 00000000 */  nop
/* 0BFE28 001BFD28 60008046 */  cvt.s.w     $f1, $f0
/* 0BFE2C 001BFD2C 00009444 */  mtc1        $20, $f0
/* 0BFE30 001BFD30 00000000 */  nop
/* 0BFE34 001BFD34 20008046 */  cvt.s.w     $f0, $f0
/* 0BFE38 001BFD38 42000146 */  mul.s       $f1, $f0, $f1
/* 0BFE3C 001BFD3C 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BFE40 001BFD40 00008244 */  mtc1        $2, $f0
/* 0BFE44 001BFD44 00000000 */  nop
/* 0BFE48 001BFD48 030B0046 */  div.s       $f12, $f1, $f0
/* 0BFE4C 001BFD4C 2C44040C */  jal         fptosi
/* 0BFE50 001BFD50 00000000 */   nop
/* 0BFE54 001BFD54 28B64070 */  paddub      $22, $2, $0
/* 0BFE58 001BFD58 2A10D402 */  slt         $2, $22, $20
/* 0BFE5C 001BFD5C 02004014 */  bnez        $2, .L001BFD68
/* 0BFE60 001BFD60 00000000 */   nop
/* 0BFE64 001BFD64 28B60070 */  paddub      $22, $0, $0
.L001BFD68:
/* 0BFE68 001BFD68 BE11040C */  jal         rand
/* 0BFE6C 001BFD6C 00000000 */   nop
/* 0BFE70 001BFD70 00008244 */  mtc1        $2, $f0
/* 0BFE74 001BFD74 00000000 */  nop
/* 0BFE78 001BFD78 60008046 */  cvt.s.w     $f1, $f0
/* 0BFE7C 001BFD7C C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0BFE80 001BFD80 00008244 */  mtc1        $2, $f0
/* 0BFE84 001BFD84 00000000 */  nop
/* 0BFE88 001BFD88 42000146 */  mul.s       $f1, $f0, $f1
/* 0BFE8C 001BFD8C 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BFE90 001BFD90 00008244 */  mtc1        $2, $f0
/* 0BFE94 001BFD94 00000000 */  nop
/* 0BFE98 001BFD98 030B0046 */  div.s       $f12, $f1, $f0
/* 0BFE9C 001BFD9C 2C44040C */  jal         fptosi
/* 0BFEA0 001BFDA0 00000000 */   nop
/* 0BFEA4 001BFDA4 80181600 */  sll         $3, $22, 2
/* 0BFEA8 001BFDA8 21187200 */  addu        $3, $3, $18
/* 0BFEAC 001BFDAC 1002638C */  lw          $3, 0x210($3)
/* 0BFEB0 001BFDB0 40180300 */  sll         $3, $3, 1
/* 0BFEB4 001BFDB4 21187300 */  addu        $3, $3, $19
/* 0BFEB8 001BFDB8 FEFF6384 */  lh          $3, -0x2($3)
/* 0BFEBC 001BFDBC 2A186200 */  slt         $3, $3, $2
/* 0BFEC0 001BFDC0 02006014 */  bnez        $3, .L001BFDCC
/* 0BFEC4 001BFDC4 00000000 */   nop
/* 0BFEC8 001BFDC8 FFFF1624 */  addiu       $22, $0, -0x1
.L001BFDCC:
/* 0BFECC 001BFDCC FFFF0324 */  addiu       $3, $0, -0x1
/* 0BFED0 001BFDD0 D1FFC312 */  beq         $22, $3, .L001BFD18
/* 0BFED4 001BFDD4 00000000 */   nop
/* 0BFED8 001BFDD8 2E000010 */  b           .L001BFE94
/* 0BFEDC 001BFDDC 00000000 */   nop
.L001BFDE0:
/* 0BFEE0 001BFDE0 BE11040C */  jal         rand
/* 0BFEE4 001BFDE4 00000000 */   nop
/* 0BFEE8 001BFDE8 00008244 */  mtc1        $2, $f0
/* 0BFEEC 001BFDEC 00000000 */  nop
/* 0BFEF0 001BFDF0 60008046 */  cvt.s.w     $f1, $f0
/* 0BFEF4 001BFDF4 00009544 */  mtc1        $21, $f0
/* 0BFEF8 001BFDF8 00000000 */  nop
/* 0BFEFC 001BFDFC 20008046 */  cvt.s.w     $f0, $f0
/* 0BFF00 001BFE00 42000146 */  mul.s       $f1, $f0, $f1
/* 0BFF04 001BFE04 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BFF08 001BFE08 00008244 */  mtc1        $2, $f0
/* 0BFF0C 001BFE0C 00000000 */  nop
/* 0BFF10 001BFE10 030B0046 */  div.s       $f12, $f1, $f0
/* 0BFF14 001BFE14 2C44040C */  jal         fptosi
/* 0BFF18 001BFE18 00000000 */   nop
/* 0BFF1C 001BFE1C 28BE4070 */  paddub      $23, $2, $0
/* 0BFF20 001BFE20 2A10F502 */  slt         $2, $23, $21
/* 0BFF24 001BFE24 02004014 */  bnez        $2, .L001BFE30
/* 0BFF28 001BFE28 00000000 */   nop
/* 0BFF2C 001BFE2C 28BE0070 */  paddub      $23, $0, $0
.L001BFE30:
/* 0BFF30 001BFE30 BE11040C */  jal         rand
/* 0BFF34 001BFE34 00000000 */   nop
/* 0BFF38 001BFE38 00008244 */  mtc1        $2, $f0
/* 0BFF3C 001BFE3C 00000000 */  nop
/* 0BFF40 001BFE40 60008046 */  cvt.s.w     $f1, $f0
/* 0BFF44 001BFE44 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0BFF48 001BFE48 00008244 */  mtc1        $2, $f0
/* 0BFF4C 001BFE4C 00000000 */  nop
/* 0BFF50 001BFE50 42000146 */  mul.s       $f1, $f0, $f1
/* 0BFF54 001BFE54 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0BFF58 001BFE58 00008244 */  mtc1        $2, $f0
/* 0BFF5C 001BFE5C 00000000 */  nop
/* 0BFF60 001BFE60 030B0046 */  div.s       $f12, $f1, $f0
/* 0BFF64 001BFE64 2C44040C */  jal         fptosi
/* 0BFF68 001BFE68 00000000 */   nop
/* 0BFF6C 001BFE6C 80181700 */  sll         $3, $23, 2
/* 0BFF70 001BFE70 21187200 */  addu        $3, $3, $18
/* 0BFF74 001BFE74 1003638C */  lw          $3, 0x310($3)
/* 0BFF78 001BFE78 40180300 */  sll         $3, $3, 1
/* 0BFF7C 001BFE7C 21187300 */  addu        $3, $3, $19
/* 0BFF80 001BFE80 FEFF6384 */  lh          $3, -0x2($3)
/* 0BFF84 001BFE84 2A186200 */  slt         $3, $3, $2
/* 0BFF88 001BFE88 02006014 */  bnez        $3, .L001BFE94
/* 0BFF8C 001BFE8C 00000000 */   nop
/* 0BFF90 001BFE90 FFFF1724 */  addiu       $23, $0, -0x1
.L001BFE94:
/* 0BFF94 001BFE94 FFFF0324 */  addiu       $3, $0, -0x1
/* 0BFF98 001BFE98 D1FFE312 */  beq         $23, $3, .L001BFDE0
/* 0BFF9C 001BFE9C 00000000 */   nop
/* 0BFFA0 001BFEA0 80181600 */  sll         $3, $22, 2
/* 0BFFA4 001BFEA4 21187200 */  addu        $3, $3, $18
/* 0BFFA8 001BFEA8 1002638C */  lw          $3, 0x210($3)
/* 0BFFAC 001BFEAC 000023AE */  sw          $3, 0x0($17)
/* 0BFFB0 001BFEB0 80181700 */  sll         $3, $23, 2
/* 0BFFB4 001BFEB4 21187200 */  addu        $3, $3, $18
/* 0BFFB8 001BFEB8 1003638C */  lw          $3, 0x310($3)
/* 0BFFBC 001BFEBC 000003AE */  sw          $3, 0x0($16)
.L001BFEC0:
/* 0BFFC0 001BFEC0 8000BF7B */  lq          $31, 0x80($29)
/* 0BFFC4 001BFEC4 7000B77B */  lq          $23, 0x70($29)
/* 0BFFC8 001BFEC8 6000B67B */  lq          $22, 0x60($29)
/* 0BFFCC 001BFECC 5000B57B */  lq          $21, 0x50($29)
/* 0BFFD0 001BFED0 4000B47B */  lq          $20, 0x40($29)
/* 0BFFD4 001BFED4 3000B37B */  lq          $19, 0x30($29)
/* 0BFFD8 001BFED8 2000B27B */  lq          $18, 0x20($29)
/* 0BFFDC 001BFEDC 1000B17B */  lq          $17, 0x10($29)
/* 0BFFE0 001BFEE0 0000B07B */  lq          $16, 0x0($29)
/* 0BFFE4 001BFEE4 9000BD27 */  addiu       $29, $29, 0x90
/* 0BFFE8 001BFEE8 0800E003 */  jr          $31
/* 0BFFEC 001BFEEC 00000000 */   nop
