.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawWaterLing__Fv
/* 0AFBE0 001AFAE0 00FFBD27 */  addiu       $29, $29, -0x100
/* 0AFBE4 001AFAE4 5000BF7F */  sq          $31, 0x50($29)
/* 0AFBE8 001AFAE8 4000B47F */  sq          $20, 0x40($29)
/* 0AFBEC 001AFAEC 3000B37F */  sq          $19, 0x30($29)
/* 0AFBF0 001AFAF0 2000B27F */  sq          $18, 0x20($29)
/* 0AFBF4 001AFAF4 1000B17F */  sq          $17, 0x10($29)
/* 0AFBF8 001AFAF8 0000B07F */  sq          $16, 0x0($29)
/* 0AFBFC 001AFAFC C701023C */  lui         $2, %hi(TexManager)
/* 0AFC00 001AFB00 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0AFC04 001AFB04 2A00023C */  lui         $2, %hi(LIT_703)
/* 0AFC08 001AFB08 38B54524 */  addiu       $5, $2, %lo(LIT_703)
/* 0AFC0C 001AFB0C FFFF0624 */  addiu       $6, $0, -0x1
/* 0AFC10 001AFB10 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0AFC14 001AFB14 00000000 */   nop
/* 0AFC18 001AFB18 28864070 */  paddub      $16, $2, $0
/* 0AFC1C 001AFB1C F000A427 */  addiu       $4, $29, 0xF0
/* 0AFC20 001AFB20 F88B82DF */  ld          $2, -0x7408($28)
/* 0AFC24 001AFB24 000082FC */  sd          $2, 0x0($4)
/* 0AFC28 001AFB28 F000A393 */  lbu         $3, 0xF0($29)
/* 0AFC2C 001AFB2C 03000630 */  andi        $6, $0, 0x3
/* 0AFC30 001AFB30 FCFF0224 */  addiu       $2, $0, -0x4
/* 0AFC34 001AFB34 24106200 */  and         $2, $3, $2
/* 0AFC38 001AFB38 25104600 */  or          $2, $2, $6
/* 0AFC3C 001AFB3C F000A2A3 */  sb          $2, 0xF0($29)
/* 0AFC40 001AFB40 F000A593 */  lbu         $5, 0xF0($29)
/* 0AFC44 001AFB44 08000364 */  daddiu      $3, $0, 0x8
/* 0AFC48 001AFB48 F3FF0224 */  addiu       $2, $0, -0xD
/* 0AFC4C 001AFB4C 2410A200 */  and         $2, $5, $2
/* 0AFC50 001AFB50 25104300 */  or          $2, $2, $3
/* 0AFC54 001AFB54 F000A2A3 */  sb          $2, 0xF0($29)
/* 0AFC58 001AFB58 F000A593 */  lbu         $5, 0xF0($29)
/* 0AFC5C 001AFB5C 00190600 */  sll         $3, $6, 4
/* 0AFC60 001AFB60 CFFF0224 */  addiu       $2, $0, -0x31
/* 0AFC64 001AFB64 2410A200 */  and         $2, $5, $2
/* 0AFC68 001AFB68 25104300 */  or          $2, $2, $3
/* 0AFC6C 001AFB6C F000A2A3 */  sb          $2, 0xF0($29)
/* 0AFC70 001AFB70 F000A593 */  lbu         $5, 0xF0($29)
/* 0AFC74 001AFB74 40000364 */  daddiu      $3, $0, 0x40
/* 0AFC78 001AFB78 3FFF0224 */  addiu       $2, $0, -0xC1
/* 0AFC7C 001AFB7C 2410A200 */  and         $2, $5, $2
/* 0AFC80 001AFB80 25104300 */  or          $2, $2, $3
/* 0AFC84 001AFB84 F000A2A3 */  sb          $2, 0xF0($29)
/* 0AFC88 001AFB88 E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 0AFC8C 001AFB8C 00000000 */   nop
/* 0AFC90 001AFB90 F800A427 */  addiu       $4, $29, 0xF8
/* 0AFC94 001AFB94 F08B82DF */  ld          $2, -0x7410($28)
/* 0AFC98 001AFB98 000082FC */  sd          $2, 0x0($4)
/* 0AFC9C 001AFB9C FC00A593 */  lbu         $5, 0xFC($29)
/* 0AFCA0 001AFBA0 01000364 */  daddiu      $3, $0, 0x1
/* 0AFCA4 001AFBA4 FEFF0224 */  addiu       $2, $0, -0x2
/* 0AFCA8 001AFBA8 2410A200 */  and         $2, $5, $2
/* 0AFCAC 001AFBAC 25104300 */  or          $2, $2, $3
/* 0AFCB0 001AFBB0 FC00A2A3 */  sb          $2, 0xFC($29)
/* 0AFCB4 001AFBB4 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 0AFCB8 001AFBB8 00000000 */   nop
/* 0AFCBC 001AFBBC 288E0070 */  paddub      $17, $0, $0
/* 0AFCC0 001AFBC0 54000010 */  b           .L001AFD14
/* 0AFCC4 001AFBC4 00000000 */   nop
.L001AFBC8:
/* 0AFCC8 001AFBC8 40191100 */  sll         $3, $17, 5
/* 0AFCCC 001AFBCC D501023C */  lui         $2, %hi(WaterWaveLing + 0x14)
/* 0AFCD0 001AFBD0 14654224 */  addiu       $2, $2, %lo(WaterWaveLing + 0x14)
/* 0AFCD4 001AFBD4 21A04300 */  addu        $20, $2, $3
/* 0AFCD8 001AFBD8 0000828E */  lw          $2, 0x0($20)
/* 0AFCDC 001AFBDC 4C004018 */  blez        $2, .L001AFD10
/* 0AFCE0 001AFBE0 00000000 */   nop
/* 0AFCE4 001AFBE4 D501023C */  lui         $2, %hi(WaterWaveLing + 0x10)
/* 0AFCE8 001AFBE8 10654224 */  addiu       $2, $2, %lo(WaterWaveLing + 0x10)
/* 0AFCEC 001AFBEC 21104300 */  addu        $2, $2, $3
/* 0AFCF0 001AFBF0 000040C4 */  lwc1        $f0, 0x0($2)
/* 0AFCF4 001AFBF4 D501023C */  lui         $2, %hi(WaterWaveLing)
/* 0AFCF8 001AFBF8 00654224 */  addiu       $2, $2, %lo(WaterWaveLing)
/* 0AFCFC 001AFBFC 21104300 */  addu        $2, $2, $3
/* 0AFD00 001AFC00 000041C4 */  lwc1        $f1, 0x0($2)
/* 0AFD04 001AFC04 01090046 */  sub.s       $f4, $f1, $f0
/* 0AFD08 001AFC08 6000A4E7 */  swc1        $f4, 0x60($29)
/* 0AFD0C 001AFC0C D501023C */  lui         $2, %hi(WaterWaveLing + 0x4)
/* 0AFD10 001AFC10 04654224 */  addiu       $2, $2, %lo(WaterWaveLing + 0x4)
/* 0AFD14 001AFC14 21104300 */  addu        $2, $2, $3
/* 0AFD18 001AFC18 000042C4 */  lwc1        $f2, 0x0($2)
/* 0AFD1C 001AFC1C 6400A2E7 */  swc1        $f2, 0x64($29)
/* 0AFD20 001AFC20 D501023C */  lui         $2, %hi(WaterWaveLing + 0x8)
/* 0AFD24 001AFC24 08654224 */  addiu       $2, $2, %lo(WaterWaveLing + 0x8)
/* 0AFD28 001AFC28 21104300 */  addu        $2, $2, $3
/* 0AFD2C 001AFC2C 000045C4 */  lwc1        $f5, 0x0($2)
/* 0AFD30 001AFC30 C1280046 */  sub.s       $f3, $f5, $f0
/* 0AFD34 001AFC34 6800A3E7 */  swc1        $f3, 0x68($29)
/* 0AFD38 001AFC38 40000146 */  add.s       $f1, $f0, $f1
/* 0AFD3C 001AFC3C 7000A1E7 */  swc1        $f1, 0x70($29)
/* 0AFD40 001AFC40 7400A2E7 */  swc1        $f2, 0x74($29)
/* 0AFD44 001AFC44 7800A3E7 */  swc1        $f3, 0x78($29)
/* 0AFD48 001AFC48 8000A4E7 */  swc1        $f4, 0x80($29)
/* 0AFD4C 001AFC4C 8400A2E7 */  swc1        $f2, 0x84($29)
/* 0AFD50 001AFC50 00000546 */  add.s       $f0, $f0, $f5
/* 0AFD54 001AFC54 8800A0E7 */  swc1        $f0, 0x88($29)
/* 0AFD58 001AFC58 9000A1E7 */  swc1        $f1, 0x90($29)
/* 0AFD5C 001AFC5C 9400A2E7 */  swc1        $f2, 0x94($29)
/* 0AFD60 001AFC60 9800A0E7 */  swc1        $f0, 0x98($29)
/* 0AFD64 001AFC64 01001224 */  addiu       $18, $0, 0x1
/* 0AFD68 001AFC68 289E0070 */  paddub      $19, $0, $0
/* 0AFD6C 001AFC6C 0E000010 */  b           .L001AFCA8
/* 0AFD70 001AFC70 00000000 */   nop
.L001AFC74:
/* 0AFD74 001AFC74 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0AFD78 001AFC78 00111300 */  sll         $2, $19, 4
/* 0AFD7C 001AFC7C 21105D00 */  addu        $2, $2, $29
/* 0AFD80 001AFC80 6C0043AC */  sw          $3, 0x6C($2)
/* 0AFD84 001AFC84 A0004424 */  addiu       $4, $2, 0xA0
/* 0AFD88 001AFC88 60004524 */  addiu       $5, $2, 0x60
/* 0AFD8C 001AFC8C 28360070 */  paddub      $6, $0, $0
/* 0AFD90 001AFC90 A4B8040C */  jal         MGRotTransPers__FPiPfi
/* 0AFD94 001AFC94 00000000 */   nop
/* 0AFD98 001AFC98 02004014 */  bnez        $2, .L001AFCA4
/* 0AFD9C 001AFC9C 00000000 */   nop
/* 0AFDA0 001AFCA0 28960070 */  paddub      $18, $0, $0
.L001AFCA4:
/* 0AFDA4 001AFCA4 01007326 */  addiu       $19, $19, 0x1
.L001AFCA8:
/* 0AFDA8 001AFCA8 0400622A */  slti        $2, $19, 0x4
/* 0AFDAC 001AFCAC F1FF4014 */  bnez        $2, .L001AFC74
/* 0AFDB0 001AFCB0 00000000 */   nop
/* 0AFDB4 001AFCB4 16004012 */  beqz        $18, .L001AFD10
/* 0AFDB8 001AFCB8 00000000 */   nop
/* 0AFDBC 001AFCBC 000080C6 */  lwc1        $f0, 0x0($20)
/* 0AFDC0 001AFCC0 60008046 */  cvt.s.w     $f1, $f0
/* 0AFDC4 001AFCC4 E48580C7 */  lwc1        $f0, -0x7A1C($28)
/* 0AFDC8 001AFCC8 02030146 */  mul.s       $f12, $f0, $f1
/* 0AFDCC 001AFCCC E000A0AF */  sw          $0, 0xE0($29)
/* 0AFDD0 001AFCD0 40000224 */  addiu       $2, $0, 0x40
/* 0AFDD4 001AFCD4 E400A2AF */  sw          $2, 0xE4($29)
/* 0AFDD8 001AFCD8 E800A2AF */  sw          $2, 0xE8($29)
/* 0AFDDC 001AFCDC EC00A2AF */  sw          $2, 0xEC($29)
/* 0AFDE0 001AFCE0 5044040C */  jal         fptoui
/* 0AFDE4 001AFCE4 00000000 */   nop
/* 0AFDE8 001AFCE8 D48B848F */  lw          $4, -0x742C($28)
/* 0AFDEC 001AFCEC 282E0072 */  paddub      $5, $16, $0
/* 0AFDF0 001AFCF0 E000A627 */  addiu       $6, $29, 0xE0
/* 0AFDF4 001AFCF4 A000A727 */  addiu       $7, $29, 0xA0
/* 0AFDF8 001AFCF8 B000A827 */  addiu       $8, $29, 0xB0
/* 0AFDFC 001AFCFC C000A927 */  addiu       $9, $29, 0xC0
/* 0AFE00 001AFD00 D000AA27 */  addiu       $10, $29, 0xD0
/* 0AFE04 001AFD04 285E4070 */  paddub      $11, $2, $0
/* 0AFE08 001AFD08 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 0AFE0C 001AFD0C 00000000 */   nop
.L001AFD10:
/* 0AFE10 001AFD10 01003126 */  addiu       $17, $17, 0x1
.L001AFD14:
/* 0AFE14 001AFD14 0600222A */  slti        $2, $17, 0x6
/* 0AFE18 001AFD18 ABFF4014 */  bnez        $2, .L001AFBC8
/* 0AFE1C 001AFD1C 00000000 */   nop
/* 0AFE20 001AFD20 28260070 */  paddub      $4, $0, $0
/* 0AFE24 001AFD24 E4BB040C */  jal         MGSetGsALPHA__FP10sceGsAlpha
/* 0AFE28 001AFD28 00000000 */   nop
/* 0AFE2C 001AFD2C 28260070 */  paddub      $4, $0, $0
/* 0AFE30 001AFD30 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 0AFE34 001AFD34 00000000 */   nop
/* 0AFE38 001AFD38 5000BF7B */  lq          $31, 0x50($29)
/* 0AFE3C 001AFD3C 4000B47B */  lq          $20, 0x40($29)
/* 0AFE40 001AFD40 3000B37B */  lq          $19, 0x30($29)
/* 0AFE44 001AFD44 2000B27B */  lq          $18, 0x20($29)
/* 0AFE48 001AFD48 1000B17B */  lq          $17, 0x10($29)
/* 0AFE4C 001AFD4C 0000B07B */  lq          $16, 0x0($29)
/* 0AFE50 001AFD50 0001BD27 */  addiu       $29, $29, 0x100
/* 0AFE54 001AFD54 0800E003 */  jr          $31
/* 0AFE58 001AFD58 00000000 */   nop
/* 0AFE5C 001AFD5C 00000000 */  nop
