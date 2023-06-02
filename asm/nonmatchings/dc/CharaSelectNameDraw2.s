.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CharaSelectNameDraw2__FiiPsPP8CTexturei
/* 13CA00 0023C900 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* 13CA04 0023C904 9000BF7F */  sq         $31, 0x90($sp)
/* 13CA08 0023C908 8000BE7F */  sq         $fp, 0x80($sp)
/* 13CA0C 0023C90C 7000B77F */  sq         $23, 0x70($sp)
/* 13CA10 0023C910 6000B67F */  sq         $22, 0x60($sp)
/* 13CA14 0023C914 5000B57F */  sq         $21, 0x50($sp)
/* 13CA18 0023C918 4000B47F */  sq         $20, 0x40($sp)
/* 13CA1C 0023C91C 3000B37F */  sq         $19, 0x30($sp)
/* 13CA20 0023C920 2000B27F */  sq         $18, 0x20($sp)
/* 13CA24 0023C924 1000B17F */  sq         $17, 0x10($sp)
/* 13CA28 0023C928 0000B07F */  sq         $16, 0x0($sp)
/* 13CA2C 0023C92C 284E8070 */  paddub     $9, $4, $0
/* 13CA30 0023C930 28B6A070 */  paddub     $22, $5, $0
/* 13CA34 0023C934 28AEC070 */  paddub     $21, $6, $0
/* 13CA38 0023C938 AC00A7AF */  sw         $7, 0xAC($sp)
/* 13CA3C 0023C93C 28A60071 */  paddub     $20, $8, $0
/* 13CA40 0023C940 7600A012 */  beqz       $21, .L0023CB1C
/* 13CA44 0023C944 00000000 */   nop
/* 13CA48 0023C948 09001224 */  addiu      $18, $0, 0x9
/* 13CA4C 0023C94C 02000010 */  b          .L0023C958
/* 13CA50 0023C950 00000000 */   nop
.L0023C954:
/* 13CA54 0023C954 FFFF5226 */  addiu      $18, $18, -0x1
.L0023C958:
/* 13CA58 0023C958 40181200 */  sll        $3, $18, 1
/* 13CA5C 0023C95C 2118A302 */  addu       $3, $21, $3
/* 13CA60 0023C960 00006384 */  lh         $3, 0x0($3)
/* 13CA64 0023C964 03006014 */  bnez       $3, .L0023C974
/* 13CA68 0023C968 00000000 */   nop
/* 13CA6C 0023C96C F9FF401E */  bgtz       $18, .L0023C954
/* 13CA70 0023C970 00000000 */   nop
.L0023C974:
/* 13CA74 0023C974 28860070 */  paddub     $16, $0, $0
/* 13CA78 0023C978 01004426 */  addiu      $4, $18, 0x1
/* 13CA7C 0023C97C 80180400 */  sll        $3, $4, 2
/* 13CA80 0023C980 21186400 */  addu       $3, $3, $4
/* 13CA84 0023C984 40180300 */  sll        $3, $3, 1
/* 13CA88 0023C988 21186400 */  addu       $3, $3, $4
/* 13CA8C 0023C98C 40380300 */  sll        $7, $3, 1
/* 13CA90 0023C990 B000E328 */  slti       $3, $7, 0xB0
/* 13CA94 0023C994 02006014 */  bnez       $3, .L0023C9A0
/* 13CA98 0023C998 00000000 */   nop
/* 13CA9C 0023C99C 01001024 */  addiu      $16, $0, 0x1
.L0023C9A0:
/* 13CAA0 0023C9A0 28460070 */  paddub     $8, $0, $0
/* 13CAA4 0023C9A4 28564072 */  paddub     $10, $18, $0
/* 13CAA8 0023C9A8 0A000010 */  b          .L0023C9D4
/* 13CAAC 0023C9AC 00000000 */   nop
.L0023C9B0:
/* 13CAB0 0023C9B0 40100A00 */  sll        $2, $10, 1
/* 13CAB4 0023C9B4 21105500 */  addu       $2, $2, $21
/* 13CAB8 0023C9B8 FEFF4584 */  lh         $5, -0x2($2)
/* 13CABC 0023C9BC 00004684 */  lh         $6, 0x0($2)
/* 13CAC0 0023C9C0 28264071 */  paddub     $4, $10, $0
/* 13CAC4 0023C9C4 20F2080C */  jal        GetFontLRTumeW__Fiii
/* 13CAC8 0023C9C8 00000000 */   nop
/* 13CACC 0023C9CC 21400201 */  addu       $8, $8, $2
/* 13CAD0 0023C9D0 FFFF4A25 */  addiu      $10, $10, -0x1
.L0023C9D4:
/* 13CAD4 0023C9D4 F6FF4105 */  bgez       $10, .L0023C9B0
/* 13CAD8 0023C9D8 00000000 */   nop
/* 13CADC 0023C9DC 02000012 */  beqz       $16, .L0023C9E8
/* 13CAE0 0023C9E0 00000000 */   nop
/* 13CAE4 0023C9E4 2338E800 */  subu       $7, $7, $8
.L0023C9E8:
/* 13CAE8 0023C9E8 44002425 */  addiu      $4, $9, 0x44
/* 13CAEC 0023C9EC 43180700 */  sra        $3, $7, 1
/* 13CAF0 0023C9F0 21208300 */  addu       $4, $4, $3
/* 13CAF4 0023C9F4 01004326 */  addiu      $3, $18, 0x1
/* 13CAF8 0023C9F8 1A00E300 */  div        $0, $7, $3
/* 13CAFC 0023C9FC 02006014 */  bnez       $3, .L0023CA08
/* 13CB00 0023CA00 00000000 */   nop
/* 13CB04 0023CA04 CD010000 */  break      0, 7
.L0023CA08:
/* 13CB08 0023CA08 12180000 */  mflo       $3
/* 13CB0C 0023CA0C 43180300 */  sra        $3, $3, 1
/* 13CB10 0023CA10 23888300 */  subu       $17, $4, $3
/* 13CB14 0023CA14 3F000010 */  b          .L0023CB14
/* 13CB18 0023CA18 00000000 */   nop
.L0023CA1C:
/* 13CB1C 0023CA1C 40981200 */  sll        $19, $18, 1
/* 13CB20 0023CA20 21B8B302 */  addu       $23, $21, $19
/* 13CB24 0023CA24 0000E586 */  lh         $5, 0x0($23)
/* 13CB28 0023CA28 AC00A48F */  lw         $4, 0xAC($sp)
/* 13CB2C 0023CA2C E800A627 */  addiu      $6, $sp, 0xE8
/* 13CB30 0023CA30 EC00A727 */  addiu      $7, $sp, 0xEC
/* 13CB34 0023CA34 A8E1080C */  jal        GetNameTextureInfo__FPP8CTextureiRiRi
/* 13CB38 0023CA38 00000000 */   nop
/* 13CB3C 0023CA3C 28F64070 */  paddub     $fp, $2, $0
/* 13CB40 0023CA40 EC00A38F */  lw         $3, 0xEC($sp)
/* 13CB44 0023CA44 E800A28F */  lw         $2, 0xE8($sp)
/* 13CB48 0023CA48 B000A2AF */  sw         $2, 0xB0($sp)
/* 13CB4C 0023CA4C B400A3AF */  sw         $3, 0xB4($sp)
/* 13CB50 0023CA50 16000324 */  addiu      $3, $0, 0x16
/* 13CB54 0023CA54 B800A3AF */  sw         $3, 0xB8($sp)
/* 13CB58 0023CA58 17000224 */  addiu      $2, $0, 0x17
/* 13CB5C 0023CA5C BC00A2AF */  sw         $2, 0xBC($sp)
/* 13CB60 0023CA60 02002226 */  addiu      $2, $17, 0x2
/* 13CB64 0023CA64 C000A2AF */  sw         $2, 0xC0($sp)
/* 13CB68 0023CA68 0200C226 */  addiu      $2, $22, 0x2
/* 13CB6C 0023CA6C C400A2AF */  sw         $2, 0xC4($sp)
/* 13CB70 0023CA70 C800A3AF */  sw         $3, 0xC8($sp)
/* 13CB74 0023CA74 15000224 */  addiu      $2, $0, 0x15
/* 13CB78 0023CA78 CC00A2AF */  sw         $2, 0xCC($sp)
/* 13CB7C 0023CA7C 2826C073 */  paddub     $4, $fp, $0
/* 13CB80 0023CA80 C000A527 */  addiu      $5, $sp, 0xC0
/* 13CB84 0023CA84 B000A627 */  addiu      $6, $sp, 0xB0
/* 13CB88 0023CA88 0A000724 */  addiu      $7, $0, 0xA
/* 13CB8C 0023CA8C 2846E070 */  paddub     $8, $7, $0
/* 13CB90 0023CA90 284EE070 */  paddub     $9, $7, $0
/* 13CB94 0023CA94 28568072 */  paddub     $10, $20, $0
/* 13CB98 0023CA98 E4B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
/* 13CB9C 0023CA9C 00000000 */   nop
/* 13CBA0 0023CAA0 D000B1AF */  sw         $17, 0xD0($sp)
/* 13CBA4 0023CAA4 D400B6AF */  sw         $22, 0xD4($sp)
/* 13CBA8 0023CAA8 16000224 */  addiu      $2, $0, 0x16
/* 13CBAC 0023CAAC D800A2AF */  sw         $2, 0xD8($sp)
/* 13CBB0 0023CAB0 15000224 */  addiu      $2, $0, 0x15
/* 13CBB4 0023CAB4 DC00A2AF */  sw         $2, 0xDC($sp)
/* 13CBB8 0023CAB8 2826C073 */  paddub     $4, $fp, $0
/* 13CBBC 0023CABC D000A527 */  addiu      $5, $sp, 0xD0
/* 13CBC0 0023CAC0 B000A627 */  addiu      $6, $sp, 0xB0
/* 13CBC4 0023CAC4 283E8072 */  paddub     $7, $20, $0
/* 13CBC8 0023CAC8 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 13CBCC 0023CACC 00000000 */   nop
/* 13CBD0 0023CAD0 28260070 */  paddub     $4, $0, $0
/* 13CBD4 0023CAD4 0B004006 */  bltz       $18, .L0023CB04
/* 13CBD8 0023CAD8 00000000 */   nop
/* 13CBDC 0023CADC 01000324 */  addiu      $3, $0, 0x1
/* 13CBE0 0023CAE0 08000316 */  bne        $16, $3, .L0023CB04
/* 13CBE4 0023CAE4 00000000 */   nop
/* 13CBE8 0023CAE8 2816E072 */  paddub     $2, $23, $0
/* 13CBEC 0023CAEC FEFF4584 */  lh         $5, -0x2($2)
/* 13CBF0 0023CAF0 0000E686 */  lh         $6, 0x0($23)
/* 13CBF4 0023CAF4 28264072 */  paddub     $4, $18, $0
/* 13CBF8 0023CAF8 20F2080C */  jal        GetFontLRTumeW__Fiii
/* 13CBFC 0023CAFC 00000000 */   nop
/* 13CC00 0023CB00 28264070 */  paddub     $4, $2, $0
.L0023CB04:
/* 13CC04 0023CB04 14000324 */  addiu      $3, $0, 0x14
/* 13CC08 0023CB08 23186400 */  subu       $3, $3, $4
/* 13CC0C 0023CB0C 23882302 */  subu       $17, $17, $3
/* 13CC10 0023CB10 FFFF5226 */  addiu      $18, $18, -0x1
.L0023CB14:
/* 13CC14 0023CB14 C1FF4106 */  bgez       $18, .L0023CA1C
/* 13CC18 0023CB18 00000000 */   nop
.L0023CB1C:
/* 13CC1C 0023CB1C 9000BF7B */  lq         $31, 0x90($sp)
/* 13CC20 0023CB20 8000BE7B */  lq         $fp, 0x80($sp)
/* 13CC24 0023CB24 7000B77B */  lq         $23, 0x70($sp)
/* 13CC28 0023CB28 6000B67B */  lq         $22, 0x60($sp)
/* 13CC2C 0023CB2C 5000B57B */  lq         $21, 0x50($sp)
/* 13CC30 0023CB30 4000B47B */  lq         $20, 0x40($sp)
/* 13CC34 0023CB34 3000B37B */  lq         $19, 0x30($sp)
/* 13CC38 0023CB38 2000B27B */  lq         $18, 0x20($sp)
/* 13CC3C 0023CB3C 1000B17B */  lq         $17, 0x10($sp)
/* 13CC40 0023CB40 0000B07B */  lq         $16, 0x0($sp)
/* 13CC44 0023CB44 F000BD27 */  addiu      $sp, $sp, 0xF0
/* 13CC48 0023CB48 0800E003 */  jr         $31
/* 13CC4C 0023CB4C 00000000 */   nop
