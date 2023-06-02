.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPieroItem__FiiPiPi
/* BFBB0 001BFAB0 70FFBD27 */  addiu      $sp, $sp, -0x90
/* BFBB4 001BFAB4 8000BF7F */  sq         $31, 0x80($sp)
/* BFBB8 001BFAB8 7000B77F */  sq         $23, 0x70($sp)
/* BFBBC 001BFABC 6000B67F */  sq         $22, 0x60($sp)
/* BFBC0 001BFAC0 5000B57F */  sq         $21, 0x50($sp)
/* BFBC4 001BFAC4 4000B47F */  sq         $20, 0x40($sp)
/* BFBC8 001BFAC8 3000B37F */  sq         $19, 0x30($sp)
/* BFBCC 001BFACC 2000B27F */  sq         $18, 0x20($sp)
/* BFBD0 001BFAD0 1000B17F */  sq         $17, 0x10($sp)
/* BFBD4 001BFAD4 0000B07F */  sq         $16, 0x0($sp)
/* BFBD8 001BFAD8 288EC070 */  paddub     $17, $6, $0
/* BFBDC 001BFADC 2886E070 */  paddub     $16, $7, $0
/* BFBE0 001BFAE0 C0180500 */  sll        $3, $5, 3
/* BFBE4 001BFAE4 23186500 */  subu       $3, $3, $5
/* BFBE8 001BFAE8 21188300 */  addu       $3, $4, $3
/* BFBEC 001BFAEC 80280300 */  sll        $5, $3, 2
/* BFBF0 001BFAF0 2800033C */  lui        $3, %hi(PieroItemListPtr)
/* BFBF4 001BFAF4 F09C6324 */  addiu      $3, $3, %lo(PieroItemListPtr)
/* BFBF8 001BFAF8 21186500 */  addu       $3, $3, $5
/* BFBFC 001BFAFC 0000728C */  lw         $18, 0x0($3)
/* BFC00 001BFB00 80280400 */  sll        $5, $4, 2
/* BFC04 001BFB04 2800033C */  lui        $3, %hi(ItemSetRateTbl)
/* BFC08 001BFB08 309D6324 */  addiu      $3, $3, %lo(ItemSetRateTbl)
/* BFC0C 001BFB0C 21186500 */  addu       $3, $3, $5
/* BFC10 001BFB10 0000738C */  lw         $19, 0x0($3)
/* BFC14 001BFB14 789C838F */  lw         $3, -0x6388($gp)
/* BFC18 001BFB18 02006480 */  lb         $4, 0x2($3)
/* BFC1C 001BFB1C 2800033C */  lui        $3, %hi(floorNum)
/* BFC20 001BFB20 709D6324 */  addiu      $3, $3, %lo(floorNum)
/* BFC24 001BFB24 21186500 */  addu       $3, $3, $5
/* BFC28 001BFB28 0000638C */  lw         $3, 0x0($3)
/* BFC2C 001BFB2C 2A088300 */  slt        $at, $4, $3
/* BFC30 001BFB30 73002010 */  beqz       $at, .L001BFD00
/* BFC34 001BFB34 00000000 */   nop
/* BFC38 001BFB38 0000548E */  lw         $20, 0x0($18)
/* BFC3C 001BFB3C 0400558E */  lw         $21, 0x4($18)
/* BFC40 001BFB40 FFFF1624 */  addiu      $22, $0, -0x1
/* BFC44 001BFB44 28BEC072 */  paddub     $23, $22, $0
/* BFC48 001BFB48 2E000010 */  b          .L001BFC04
/* BFC4C 001BFB4C 00000000 */   nop
.L001BFB50:
/* BFC50 001BFB50 BE11040C */  jal        rand
/* BFC54 001BFB54 00000000 */   nop
/* BFC58 001BFB58 00008244 */  mtc1       $2, $f0
/* BFC5C 001BFB5C 00000000 */  nop
/* BFC60 001BFB60 60008046 */  cvt.s.w    $f1, $f0
/* BFC64 001BFB64 00009444 */  mtc1       $20, $f0
/* BFC68 001BFB68 00000000 */  nop
/* BFC6C 001BFB6C 20008046 */  cvt.s.w    $f0, $f0
/* BFC70 001BFB70 42000146 */  mul.s      $f1, $f0, $f1
/* BFC74 001BFB74 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BFC78 001BFB78 00008244 */  mtc1       $2, $f0
/* BFC7C 001BFB7C 00000000 */  nop
/* BFC80 001BFB80 030B0046 */  div.s      $f12, $f1, $f0
/* BFC84 001BFB84 2C44040C */  jal        fptosi
/* BFC88 001BFB88 00000000 */   nop
/* BFC8C 001BFB8C 28B64070 */  paddub     $22, $2, $0
/* BFC90 001BFB90 2A10D402 */  slt        $2, $22, $20
/* BFC94 001BFB94 02004014 */  bnez       $2, .L001BFBA0
/* BFC98 001BFB98 00000000 */   nop
/* BFC9C 001BFB9C 28B60070 */  paddub     $22, $0, $0
.L001BFBA0:
/* BFCA0 001BFBA0 BE11040C */  jal        rand
/* BFCA4 001BFBA4 00000000 */   nop
/* BFCA8 001BFBA8 00008244 */  mtc1       $2, $f0
/* BFCAC 001BFBAC 00000000 */  nop
/* BFCB0 001BFBB0 60008046 */  cvt.s.w    $f1, $f0
/* BFCB4 001BFBB4 C842023C */  lui        $2, (0x42C80000 >> 16)
/* BFCB8 001BFBB8 00008244 */  mtc1       $2, $f0
/* BFCBC 001BFBBC 00000000 */  nop
/* BFCC0 001BFBC0 42000146 */  mul.s      $f1, $f0, $f1
/* BFCC4 001BFBC4 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BFCC8 001BFBC8 00008244 */  mtc1       $2, $f0
/* BFCCC 001BFBCC 00000000 */  nop
/* BFCD0 001BFBD0 030B0046 */  div.s      $f12, $f1, $f0
/* BFCD4 001BFBD4 2C44040C */  jal        fptosi
/* BFCD8 001BFBD8 00000000 */   nop
/* BFCDC 001BFBDC 80181600 */  sll        $3, $22, 2
/* BFCE0 001BFBE0 21187200 */  addu       $3, $3, $18
/* BFCE4 001BFBE4 0800638C */  lw         $3, 0x8($3)
/* BFCE8 001BFBE8 40180300 */  sll        $3, $3, 1
/* BFCEC 001BFBEC 21187300 */  addu       $3, $3, $19
/* BFCF0 001BFBF0 FEFF6384 */  lh         $3, -0x2($3)
/* BFCF4 001BFBF4 2A186200 */  slt        $3, $3, $2
/* BFCF8 001BFBF8 02006014 */  bnez       $3, .L001BFC04
/* BFCFC 001BFBFC 00000000 */   nop
/* BFD00 001BFC00 FFFF1624 */  addiu      $22, $0, -0x1
.L001BFC04:
/* BFD04 001BFC04 FFFF0324 */  addiu      $3, $0, -0x1
/* BFD08 001BFC08 D1FFC312 */  beq        $22, $3, .L001BFB50
/* BFD0C 001BFC0C 00000000 */   nop
/* BFD10 001BFC10 2E000010 */  b          .L001BFCCC
/* BFD14 001BFC14 00000000 */   nop
.L001BFC18:
/* BFD18 001BFC18 BE11040C */  jal        rand
/* BFD1C 001BFC1C 00000000 */   nop
/* BFD20 001BFC20 00008244 */  mtc1       $2, $f0
/* BFD24 001BFC24 00000000 */  nop
/* BFD28 001BFC28 60008046 */  cvt.s.w    $f1, $f0
/* BFD2C 001BFC2C 00009544 */  mtc1       $21, $f0
/* BFD30 001BFC30 00000000 */  nop
/* BFD34 001BFC34 20008046 */  cvt.s.w    $f0, $f0
/* BFD38 001BFC38 42000146 */  mul.s      $f1, $f0, $f1
/* BFD3C 001BFC3C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BFD40 001BFC40 00008244 */  mtc1       $2, $f0
/* BFD44 001BFC44 00000000 */  nop
/* BFD48 001BFC48 030B0046 */  div.s      $f12, $f1, $f0
/* BFD4C 001BFC4C 2C44040C */  jal        fptosi
/* BFD50 001BFC50 00000000 */   nop
/* BFD54 001BFC54 28BE4070 */  paddub     $23, $2, $0
/* BFD58 001BFC58 2A10F502 */  slt        $2, $23, $21
/* BFD5C 001BFC5C 02004014 */  bnez       $2, .L001BFC68
/* BFD60 001BFC60 00000000 */   nop
/* BFD64 001BFC64 28BE0070 */  paddub     $23, $0, $0
.L001BFC68:
/* BFD68 001BFC68 BE11040C */  jal        rand
/* BFD6C 001BFC6C 00000000 */   nop
/* BFD70 001BFC70 00008244 */  mtc1       $2, $f0
/* BFD74 001BFC74 00000000 */  nop
/* BFD78 001BFC78 60008046 */  cvt.s.w    $f1, $f0
/* BFD7C 001BFC7C C842023C */  lui        $2, (0x42C80000 >> 16)
/* BFD80 001BFC80 00008244 */  mtc1       $2, $f0
/* BFD84 001BFC84 00000000 */  nop
/* BFD88 001BFC88 42000146 */  mul.s      $f1, $f0, $f1
/* BFD8C 001BFC8C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BFD90 001BFC90 00008244 */  mtc1       $2, $f0
/* BFD94 001BFC94 00000000 */  nop
/* BFD98 001BFC98 030B0046 */  div.s      $f12, $f1, $f0
/* BFD9C 001BFC9C 2C44040C */  jal        fptosi
/* BFDA0 001BFCA0 00000000 */   nop
/* BFDA4 001BFCA4 80181700 */  sll        $3, $23, 2
/* BFDA8 001BFCA8 21187200 */  addu       $3, $3, $18
/* BFDAC 001BFCAC 0801638C */  lw         $3, 0x108($3)
/* BFDB0 001BFCB0 40180300 */  sll        $3, $3, 1
/* BFDB4 001BFCB4 21187300 */  addu       $3, $3, $19
/* BFDB8 001BFCB8 FEFF6384 */  lh         $3, -0x2($3)
/* BFDBC 001BFCBC 2A186200 */  slt        $3, $3, $2
/* BFDC0 001BFCC0 02006014 */  bnez       $3, .L001BFCCC
/* BFDC4 001BFCC4 00000000 */   nop
/* BFDC8 001BFCC8 FFFF1724 */  addiu      $23, $0, -0x1
.L001BFCCC:
/* BFDCC 001BFCCC FFFF0324 */  addiu      $3, $0, -0x1
/* BFDD0 001BFCD0 D1FFE312 */  beq        $23, $3, .L001BFC18
/* BFDD4 001BFCD4 00000000 */   nop
/* BFDD8 001BFCD8 80181600 */  sll        $3, $22, 2
/* BFDDC 001BFCDC 21187200 */  addu       $3, $3, $18
/* BFDE0 001BFCE0 0800638C */  lw         $3, 0x8($3)
/* BFDE4 001BFCE4 000023AE */  sw         $3, 0x0($17)
/* BFDE8 001BFCE8 80181700 */  sll        $3, $23, 2
/* BFDEC 001BFCEC 21187200 */  addu       $3, $3, $18
/* BFDF0 001BFCF0 0801638C */  lw         $3, 0x108($3)
/* BFDF4 001BFCF4 000003AE */  sw         $3, 0x0($16)
/* BFDF8 001BFCF8 71000010 */  b          .L001BFEC0
/* BFDFC 001BFCFC 00000000 */   nop
.L001BFD00:
/* BFE00 001BFD00 0802548E */  lw         $20, 0x208($18)
/* BFE04 001BFD04 0C02558E */  lw         $21, 0x20C($18)
/* BFE08 001BFD08 FFFF1624 */  addiu      $22, $0, -0x1
/* BFE0C 001BFD0C 28BEC072 */  paddub     $23, $22, $0
/* BFE10 001BFD10 2E000010 */  b          .L001BFDCC
/* BFE14 001BFD14 00000000 */   nop
.L001BFD18:
/* BFE18 001BFD18 BE11040C */  jal        rand
/* BFE1C 001BFD1C 00000000 */   nop
/* BFE20 001BFD20 00008244 */  mtc1       $2, $f0
/* BFE24 001BFD24 00000000 */  nop
/* BFE28 001BFD28 60008046 */  cvt.s.w    $f1, $f0
/* BFE2C 001BFD2C 00009444 */  mtc1       $20, $f0
/* BFE30 001BFD30 00000000 */  nop
/* BFE34 001BFD34 20008046 */  cvt.s.w    $f0, $f0
/* BFE38 001BFD38 42000146 */  mul.s      $f1, $f0, $f1
/* BFE3C 001BFD3C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BFE40 001BFD40 00008244 */  mtc1       $2, $f0
/* BFE44 001BFD44 00000000 */  nop
/* BFE48 001BFD48 030B0046 */  div.s      $f12, $f1, $f0
/* BFE4C 001BFD4C 2C44040C */  jal        fptosi
/* BFE50 001BFD50 00000000 */   nop
/* BFE54 001BFD54 28B64070 */  paddub     $22, $2, $0
/* BFE58 001BFD58 2A10D402 */  slt        $2, $22, $20
/* BFE5C 001BFD5C 02004014 */  bnez       $2, .L001BFD68
/* BFE60 001BFD60 00000000 */   nop
/* BFE64 001BFD64 28B60070 */  paddub     $22, $0, $0
.L001BFD68:
/* BFE68 001BFD68 BE11040C */  jal        rand
/* BFE6C 001BFD6C 00000000 */   nop
/* BFE70 001BFD70 00008244 */  mtc1       $2, $f0
/* BFE74 001BFD74 00000000 */  nop
/* BFE78 001BFD78 60008046 */  cvt.s.w    $f1, $f0
/* BFE7C 001BFD7C C842023C */  lui        $2, (0x42C80000 >> 16)
/* BFE80 001BFD80 00008244 */  mtc1       $2, $f0
/* BFE84 001BFD84 00000000 */  nop
/* BFE88 001BFD88 42000146 */  mul.s      $f1, $f0, $f1
/* BFE8C 001BFD8C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BFE90 001BFD90 00008244 */  mtc1       $2, $f0
/* BFE94 001BFD94 00000000 */  nop
/* BFE98 001BFD98 030B0046 */  div.s      $f12, $f1, $f0
/* BFE9C 001BFD9C 2C44040C */  jal        fptosi
/* BFEA0 001BFDA0 00000000 */   nop
/* BFEA4 001BFDA4 80181600 */  sll        $3, $22, 2
/* BFEA8 001BFDA8 21187200 */  addu       $3, $3, $18
/* BFEAC 001BFDAC 1002638C */  lw         $3, 0x210($3)
/* BFEB0 001BFDB0 40180300 */  sll        $3, $3, 1
/* BFEB4 001BFDB4 21187300 */  addu       $3, $3, $19
/* BFEB8 001BFDB8 FEFF6384 */  lh         $3, -0x2($3)
/* BFEBC 001BFDBC 2A186200 */  slt        $3, $3, $2
/* BFEC0 001BFDC0 02006014 */  bnez       $3, .L001BFDCC
/* BFEC4 001BFDC4 00000000 */   nop
/* BFEC8 001BFDC8 FFFF1624 */  addiu      $22, $0, -0x1
.L001BFDCC:
/* BFECC 001BFDCC FFFF0324 */  addiu      $3, $0, -0x1
/* BFED0 001BFDD0 D1FFC312 */  beq        $22, $3, .L001BFD18
/* BFED4 001BFDD4 00000000 */   nop
/* BFED8 001BFDD8 2E000010 */  b          .L001BFE94
/* BFEDC 001BFDDC 00000000 */   nop
.L001BFDE0:
/* BFEE0 001BFDE0 BE11040C */  jal        rand
/* BFEE4 001BFDE4 00000000 */   nop
/* BFEE8 001BFDE8 00008244 */  mtc1       $2, $f0
/* BFEEC 001BFDEC 00000000 */  nop
/* BFEF0 001BFDF0 60008046 */  cvt.s.w    $f1, $f0
/* BFEF4 001BFDF4 00009544 */  mtc1       $21, $f0
/* BFEF8 001BFDF8 00000000 */  nop
/* BFEFC 001BFDFC 20008046 */  cvt.s.w    $f0, $f0
/* BFF00 001BFE00 42000146 */  mul.s      $f1, $f0, $f1
/* BFF04 001BFE04 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BFF08 001BFE08 00008244 */  mtc1       $2, $f0
/* BFF0C 001BFE0C 00000000 */  nop
/* BFF10 001BFE10 030B0046 */  div.s      $f12, $f1, $f0
/* BFF14 001BFE14 2C44040C */  jal        fptosi
/* BFF18 001BFE18 00000000 */   nop
/* BFF1C 001BFE1C 28BE4070 */  paddub     $23, $2, $0
/* BFF20 001BFE20 2A10F502 */  slt        $2, $23, $21
/* BFF24 001BFE24 02004014 */  bnez       $2, .L001BFE30
/* BFF28 001BFE28 00000000 */   nop
/* BFF2C 001BFE2C 28BE0070 */  paddub     $23, $0, $0
.L001BFE30:
/* BFF30 001BFE30 BE11040C */  jal        rand
/* BFF34 001BFE34 00000000 */   nop
/* BFF38 001BFE38 00008244 */  mtc1       $2, $f0
/* BFF3C 001BFE3C 00000000 */  nop
/* BFF40 001BFE40 60008046 */  cvt.s.w    $f1, $f0
/* BFF44 001BFE44 C842023C */  lui        $2, (0x42C80000 >> 16)
/* BFF48 001BFE48 00008244 */  mtc1       $2, $f0
/* BFF4C 001BFE4C 00000000 */  nop
/* BFF50 001BFE50 42000146 */  mul.s      $f1, $f0, $f1
/* BFF54 001BFE54 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BFF58 001BFE58 00008244 */  mtc1       $2, $f0
/* BFF5C 001BFE5C 00000000 */  nop
/* BFF60 001BFE60 030B0046 */  div.s      $f12, $f1, $f0
/* BFF64 001BFE64 2C44040C */  jal        fptosi
/* BFF68 001BFE68 00000000 */   nop
/* BFF6C 001BFE6C 80181700 */  sll        $3, $23, 2
/* BFF70 001BFE70 21187200 */  addu       $3, $3, $18
/* BFF74 001BFE74 1003638C */  lw         $3, 0x310($3)
/* BFF78 001BFE78 40180300 */  sll        $3, $3, 1
/* BFF7C 001BFE7C 21187300 */  addu       $3, $3, $19
/* BFF80 001BFE80 FEFF6384 */  lh         $3, -0x2($3)
/* BFF84 001BFE84 2A186200 */  slt        $3, $3, $2
/* BFF88 001BFE88 02006014 */  bnez       $3, .L001BFE94
/* BFF8C 001BFE8C 00000000 */   nop
/* BFF90 001BFE90 FFFF1724 */  addiu      $23, $0, -0x1
.L001BFE94:
/* BFF94 001BFE94 FFFF0324 */  addiu      $3, $0, -0x1
/* BFF98 001BFE98 D1FFE312 */  beq        $23, $3, .L001BFDE0
/* BFF9C 001BFE9C 00000000 */   nop
/* BFFA0 001BFEA0 80181600 */  sll        $3, $22, 2
/* BFFA4 001BFEA4 21187200 */  addu       $3, $3, $18
/* BFFA8 001BFEA8 1002638C */  lw         $3, 0x210($3)
/* BFFAC 001BFEAC 000023AE */  sw         $3, 0x0($17)
/* BFFB0 001BFEB0 80181700 */  sll        $3, $23, 2
/* BFFB4 001BFEB4 21187200 */  addu       $3, $3, $18
/* BFFB8 001BFEB8 1003638C */  lw         $3, 0x310($3)
/* BFFBC 001BFEBC 000003AE */  sw         $3, 0x0($16)
.L001BFEC0:
/* BFFC0 001BFEC0 8000BF7B */  lq         $31, 0x80($sp)
/* BFFC4 001BFEC4 7000B77B */  lq         $23, 0x70($sp)
/* BFFC8 001BFEC8 6000B67B */  lq         $22, 0x60($sp)
/* BFFCC 001BFECC 5000B57B */  lq         $21, 0x50($sp)
/* BFFD0 001BFED0 4000B47B */  lq         $20, 0x40($sp)
/* BFFD4 001BFED4 3000B37B */  lq         $19, 0x30($sp)
/* BFFD8 001BFED8 2000B27B */  lq         $18, 0x20($sp)
/* BFFDC 001BFEDC 1000B17B */  lq         $17, 0x10($sp)
/* BFFE0 001BFEE0 0000B07B */  lq         $16, 0x0($sp)
/* BFFE4 001BFEE4 9000BD27 */  addiu      $sp, $sp, 0x90
/* BFFE8 001BFEE8 0800E003 */  jr         $31
/* BFFEC 001BFEEC 00000000 */   nop
