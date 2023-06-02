.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawSaveBoardCharaName2__FiiPsPP8CTexture6spRGBA6spRGBA
/* 13CC50 0023CB50 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* 13CC54 0023CB54 9000BF7F */  sq         $31, 0x90($sp)
/* 13CC58 0023CB58 8000BE7F */  sq         $fp, 0x80($sp)
/* 13CC5C 0023CB5C 7000B77F */  sq         $23, 0x70($sp)
/* 13CC60 0023CB60 6000B67F */  sq         $22, 0x60($sp)
/* 13CC64 0023CB64 5000B57F */  sq         $21, 0x50($sp)
/* 13CC68 0023CB68 4000B47F */  sq         $20, 0x40($sp)
/* 13CC6C 0023CB6C 3000B37F */  sq         $19, 0x30($sp)
/* 13CC70 0023CB70 2000B27F */  sq         $18, 0x20($sp)
/* 13CC74 0023CB74 1000B17F */  sq         $17, 0x10($sp)
/* 13CC78 0023CB78 0000B07F */  sq         $16, 0x0($sp)
/* 13CC7C 0023CB7C 28568070 */  paddub     $10, $4, $0
/* 13CC80 0023CB80 28BEA070 */  paddub     $23, $5, $0
/* 13CC84 0023CB84 2886C070 */  paddub     $16, $6, $0
/* 13CC88 0023CB88 28F6E070 */  paddub     $fp, $7, $0
/* 13CC8C 0023CB8C A800A8AF */  sw         $8, 0xA8($sp)
/* 13CC90 0023CB90 AC00A9AF */  sw         $9, 0xAC($sp)
/* 13CC94 0023CB94 E000A327 */  addiu      $3, $sp, 0xE0
/* 13CC98 0023CB98 188A80C7 */  lwc1       $f0, -0x75E8($gp)
/* 13CC9C 0023CB9C 000060E4 */  swc1       $f0, 0x0($3)
/* 13CCA0 0023CBA0 AB00A393 */  lbu        $3, 0xAB($sp)
/* 13CCA4 0023CBA4 E300A3A3 */  sb         $3, 0xE3($sp)
/* 13CCA8 0023CBA8 E400A327 */  addiu      $3, $sp, 0xE4
/* 13CCAC 0023CBAC 1C8A80C7 */  lwc1       $f0, -0x75E4($gp)
/* 13CCB0 0023CBB0 000060E4 */  swc1       $f0, 0x0($3)
/* 13CCB4 0023CBB4 AF00A393 */  lbu        $3, 0xAF($sp)
/* 13CCB8 0023CBB8 E700A3A3 */  sb         $3, 0xE7($sp)
/* 13CCBC 0023CBBC 09001424 */  addiu      $20, $0, 0x9
/* 13CCC0 0023CBC0 02000010 */  b          .L0023CBCC
/* 13CCC4 0023CBC4 00000000 */   nop
.L0023CBC8:
/* 13CCC8 0023CBC8 FFFF9426 */  addiu      $20, $20, -0x1
.L0023CBCC:
/* 13CCCC 0023CBCC 40181400 */  sll        $3, $20, 1
/* 13CCD0 0023CBD0 21180302 */  addu       $3, $16, $3
/* 13CCD4 0023CBD4 00006384 */  lh         $3, 0x0($3)
/* 13CCD8 0023CBD8 03006014 */  bnez       $3, .L0023CBE8
/* 13CCDC 0023CBDC 00000000 */   nop
/* 13CCE0 0023CBE0 F9FF801E */  bgtz       $20, .L0023CBC8
/* 13CCE4 0023CBE4 00000000 */   nop
.L0023CBE8:
/* 13CCE8 0023CBE8 288E0070 */  paddub     $17, $0, $0
/* 13CCEC 0023CBEC 01008426 */  addiu      $4, $20, 0x1
/* 13CCF0 0023CBF0 80180400 */  sll        $3, $4, 2
/* 13CCF4 0023CBF4 21186400 */  addu       $3, $3, $4
/* 13CCF8 0023CBF8 40180300 */  sll        $3, $3, 1
/* 13CCFC 0023CBFC 21186400 */  addu       $3, $3, $4
/* 13CD00 0023CC00 40380300 */  sll        $7, $3, 1
/* 13CD04 0023CC04 B000E328 */  slti       $3, $7, 0xB0
/* 13CD08 0023CC08 02006014 */  bnez       $3, .L0023CC14
/* 13CD0C 0023CC0C 00000000 */   nop
/* 13CD10 0023CC10 01001124 */  addiu      $17, $0, 0x1
.L0023CC14:
/* 13CD14 0023CC14 28460070 */  paddub     $8, $0, $0
/* 13CD18 0023CC18 284E8072 */  paddub     $9, $20, $0
/* 13CD1C 0023CC1C 0A000010 */  b          .L0023CC48
/* 13CD20 0023CC20 00000000 */   nop
.L0023CC24:
/* 13CD24 0023CC24 40100900 */  sll        $2, $9, 1
/* 13CD28 0023CC28 21105000 */  addu       $2, $2, $16
/* 13CD2C 0023CC2C FEFF4584 */  lh         $5, -0x2($2)
/* 13CD30 0023CC30 00004684 */  lh         $6, 0x0($2)
/* 13CD34 0023CC34 28262071 */  paddub     $4, $9, $0
/* 13CD38 0023CC38 20F2080C */  jal        GetFontLRTumeW__Fiii
/* 13CD3C 0023CC3C 00000000 */   nop
/* 13CD40 0023CC40 21400201 */  addu       $8, $8, $2
/* 13CD44 0023CC44 FFFF2925 */  addiu      $9, $9, -0x1
.L0023CC48:
/* 13CD48 0023CC48 F6FF2105 */  bgez       $9, .L0023CC24
/* 13CD4C 0023CC4C 00000000 */   nop
/* 13CD50 0023CC50 01000324 */  addiu      $3, $0, 0x1
/* 13CD54 0023CC54 02002316 */  bne        $17, $3, .L0023CC60
/* 13CD58 0023CC58 00000000 */   nop
/* 13CD5C 0023CC5C 2338E800 */  subu       $7, $7, $8
.L0023CC60:
/* 13CD60 0023CC60 36004425 */  addiu      $4, $10, 0x36
/* 13CD64 0023CC64 43180700 */  sra        $3, $7, 1
/* 13CD68 0023CC68 21208300 */  addu       $4, $4, $3
/* 13CD6C 0023CC6C 01008326 */  addiu      $3, $20, 0x1
/* 13CD70 0023CC70 1A00E300 */  div        $0, $7, $3
/* 13CD74 0023CC74 02006014 */  bnez       $3, .L0023CC80
/* 13CD78 0023CC78 00000000 */   nop
/* 13CD7C 0023CC7C CD010000 */  break      0, 7
.L0023CC80:
/* 13CD80 0023CC80 12180000 */  mflo       $3
/* 13CD84 0023CC84 43180300 */  sra        $3, $3, 1
/* 13CD88 0023CC88 23908300 */  subu       $18, $4, $3
/* 13CD8C 0023CC8C 42000010 */  b          .L0023CD98
/* 13CD90 0023CC90 00000000 */   nop
.L0023CC94:
/* 13CD94 0023CC94 40B01400 */  sll        $22, $20, 1
/* 13CD98 0023CC98 21A81602 */  addu       $21, $16, $22
/* 13CD9C 0023CC9C 0000A586 */  lh         $5, 0x0($21)
/* 13CDA0 0023CCA0 2826C073 */  paddub     $4, $fp, $0
/* 13CDA4 0023CCA4 E800A627 */  addiu      $6, $sp, 0xE8
/* 13CDA8 0023CCA8 EC00A727 */  addiu      $7, $sp, 0xEC
/* 13CDAC 0023CCAC A8E1080C */  jal        GetNameTextureInfo__FPP8CTextureiRiRi
/* 13CDB0 0023CCB0 00000000 */   nop
/* 13CDB4 0023CCB4 289E4070 */  paddub     $19, $2, $0
/* 13CDB8 0023CCB8 EC00A38F */  lw         $3, 0xEC($sp)
/* 13CDBC 0023CCBC E800A28F */  lw         $2, 0xE8($sp)
/* 13CDC0 0023CCC0 B000A2AF */  sw         $2, 0xB0($sp)
/* 13CDC4 0023CCC4 B400A3AF */  sw         $3, 0xB4($sp)
/* 13CDC8 0023CCC8 16000324 */  addiu      $3, $0, 0x16
/* 13CDCC 0023CCCC B800A3AF */  sw         $3, 0xB8($sp)
/* 13CDD0 0023CCD0 17000224 */  addiu      $2, $0, 0x17
/* 13CDD4 0023CCD4 BC00A2AF */  sw         $2, 0xBC($sp)
/* 13CDD8 0023CCD8 02004226 */  addiu      $2, $18, 0x2
/* 13CDDC 0023CCDC C000A2AF */  sw         $2, 0xC0($sp)
/* 13CDE0 0023CCE0 0200E226 */  addiu      $2, $23, 0x2
/* 13CDE4 0023CCE4 C400A2AF */  sw         $2, 0xC4($sp)
/* 13CDE8 0023CCE8 C800A3AF */  sw         $3, 0xC8($sp)
/* 13CDEC 0023CCEC 15000224 */  addiu      $2, $0, 0x15
/* 13CDF0 0023CCF0 CC00A2AF */  sw         $2, 0xCC($sp)
/* 13CDF4 0023CCF4 28266072 */  paddub     $4, $19, $0
/* 13CDF8 0023CCF8 C000A527 */  addiu      $5, $sp, 0xC0
/* 13CDFC 0023CCFC B000A627 */  addiu      $6, $sp, 0xB0
/* 13CE00 0023CD00 E000A727 */  addiu      $7, $sp, 0xE0
/* 13CE04 0023CD04 2846E070 */  paddub     $8, $7, $0
/* 13CE08 0023CD08 E400A927 */  addiu      $9, $sp, 0xE4
/* 13CE0C 0023CD0C 28562071 */  paddub     $10, $9, $0
/* 13CE10 0023CD10 0CB4080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* 13CE14 0023CD14 00000000 */   nop
/* 13CE18 0023CD18 D000B2AF */  sw         $18, 0xD0($sp)
/* 13CE1C 0023CD1C D400B7AF */  sw         $23, 0xD4($sp)
/* 13CE20 0023CD20 16000224 */  addiu      $2, $0, 0x16
/* 13CE24 0023CD24 D800A2AF */  sw         $2, 0xD8($sp)
/* 13CE28 0023CD28 15000224 */  addiu      $2, $0, 0x15
/* 13CE2C 0023CD2C DC00A2AF */  sw         $2, 0xDC($sp)
/* 13CE30 0023CD30 28266072 */  paddub     $4, $19, $0
/* 13CE34 0023CD34 D000A527 */  addiu      $5, $sp, 0xD0
/* 13CE38 0023CD38 B000A627 */  addiu      $6, $sp, 0xB0
/* 13CE3C 0023CD3C A800A727 */  addiu      $7, $sp, 0xA8
/* 13CE40 0023CD40 2846E070 */  paddub     $8, $7, $0
/* 13CE44 0023CD44 AC00A927 */  addiu      $9, $sp, 0xAC
/* 13CE48 0023CD48 28562071 */  paddub     $10, $9, $0
/* 13CE4C 0023CD4C 0CB4080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* 13CE50 0023CD50 00000000 */   nop
/* 13CE54 0023CD54 28260070 */  paddub     $4, $0, $0
/* 13CE58 0023CD58 0B008006 */  bltz       $20, .L0023CD88
/* 13CE5C 0023CD5C 00000000 */   nop
/* 13CE60 0023CD60 01000324 */  addiu      $3, $0, 0x1
/* 13CE64 0023CD64 08002316 */  bne        $17, $3, .L0023CD88
/* 13CE68 0023CD68 00000000 */   nop
/* 13CE6C 0023CD6C 2816A072 */  paddub     $2, $21, $0
/* 13CE70 0023CD70 FEFF4584 */  lh         $5, -0x2($2)
/* 13CE74 0023CD74 0000A686 */  lh         $6, 0x0($21)
/* 13CE78 0023CD78 28268072 */  paddub     $4, $20, $0
/* 13CE7C 0023CD7C 20F2080C */  jal        GetFontLRTumeW__Fiii
/* 13CE80 0023CD80 00000000 */   nop
/* 13CE84 0023CD84 28264070 */  paddub     $4, $2, $0
.L0023CD88:
/* 13CE88 0023CD88 14000324 */  addiu      $3, $0, 0x14
/* 13CE8C 0023CD8C 23186400 */  subu       $3, $3, $4
/* 13CE90 0023CD90 23904302 */  subu       $18, $18, $3
/* 13CE94 0023CD94 FFFF9426 */  addiu      $20, $20, -0x1
.L0023CD98:
/* 13CE98 0023CD98 BEFF8106 */  bgez       $20, .L0023CC94
/* 13CE9C 0023CD9C 00000000 */   nop
/* 13CEA0 0023CDA0 9000BF7B */  lq         $31, 0x90($sp)
/* 13CEA4 0023CDA4 8000BE7B */  lq         $fp, 0x80($sp)
/* 13CEA8 0023CDA8 7000B77B */  lq         $23, 0x70($sp)
/* 13CEAC 0023CDAC 6000B67B */  lq         $22, 0x60($sp)
/* 13CEB0 0023CDB0 5000B57B */  lq         $21, 0x50($sp)
/* 13CEB4 0023CDB4 4000B47B */  lq         $20, 0x40($sp)
/* 13CEB8 0023CDB8 3000B37B */  lq         $19, 0x30($sp)
/* 13CEBC 0023CDBC 2000B27B */  lq         $18, 0x20($sp)
/* 13CEC0 0023CDC0 1000B17B */  lq         $17, 0x10($sp)
/* 13CEC4 0023CDC4 0000B07B */  lq         $16, 0x0($sp)
/* 13CEC8 0023CDC8 F000BD27 */  addiu      $sp, $sp, 0xF0
/* 13CECC 0023CDCC 0800E003 */  jr         $31
/* 13CED0 0023CDD0 00000000 */   nop
/* 13CED4 0023CDD4 00000000 */  nop
/* 13CED8 0023CDD8 00000000 */  nop
/* 13CEDC 0023CDDC 00000000 */  nop
