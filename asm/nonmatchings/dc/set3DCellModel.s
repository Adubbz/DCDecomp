.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set3DCellModel__FPfPcfiiiiUc
/* ABC00 001ABB00 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* ABC04 001ABB04 8000BF7F */  sq         $31, 0x80($sp)
/* ABC08 001ABB08 7000B67F */  sq         $22, 0x70($sp)
/* ABC0C 001ABB0C 6000B57F */  sq         $21, 0x60($sp)
/* ABC10 001ABB10 5000B47F */  sq         $20, 0x50($sp)
/* ABC14 001ABB14 4000B37F */  sq         $19, 0x40($sp)
/* ABC18 001ABB18 3000B27F */  sq         $18, 0x30($sp)
/* ABC1C 001ABB1C 2000B17F */  sq         $17, 0x20($sp)
/* ABC20 001ABB20 1000B07F */  sq         $16, 0x10($sp)
/* ABC24 001ABB24 0000B4E7 */  swc1       $f20, 0x0($sp)
/* ABC28 001ABB28 28AE8070 */  paddub     $21, $4, $0
/* ABC2C 001ABB2C 06650046 */  mov.s      $f20, $f12
/* ABC30 001ABB30 28A6C070 */  paddub     $20, $6, $0
/* ABC34 001ABB34 289EE070 */  paddub     $19, $7, $0
/* ABC38 001ABB38 28960071 */  paddub     $18, $8, $0
/* ABC3C 001ABB3C 288E2071 */  paddub     $17, $9, $0
/* ABC40 001ABB40 28864071 */  paddub     $16, $10, $0
/* ABC44 001ABB44 C701023C */  lui        $2, %hi(TexManager)
/* ABC48 001ABB48 70584424 */  addiu      $4, $2, %lo(TexManager)
/* ABC4C 001ABB4C FFFF0624 */  addiu      $6, $0, -0x1
/* ABC50 001ABB50 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* ABC54 001ABB54 00000000 */   nop
/* ABC58 001ABB58 28B64070 */  paddub     $22, $2, $0
/* ABC5C 001ABB5C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* ABC60 001ABB60 0C00A2AE */  sw         $2, 0xC($21)
/* ABC64 001ABB64 0040023C */  lui        $2, (0x40000000 >> 16)
/* ABC68 001ABB68 00008244 */  mtc1       $2, $f0
/* ABC6C 001ABB6C 00000000 */  nop
/* ABC70 001ABB70 43A30046 */  div.s      $f13, $f20, $f0
/* ABC74 001ABB74 9000A427 */  addiu      $4, $sp, 0x90
/* ABC78 001ABB78 C000A527 */  addiu      $5, $sp, 0xC0
/* ABC7C 001ABB7C 2836A072 */  paddub     $6, $21, $0
/* ABC80 001ABB80 06A30046 */  mov.s      $f12, $f20
/* ABC84 001ABB84 283E0070 */  paddub     $7, $0, $0
/* ABC88 001ABB88 D0B9040C */  jal        MGRotTransPers3DSprite__FPiPiPfffi
/* ABC8C 001ABB8C 00000000 */   nop
/* ABC90 001ABB90 01000324 */  addiu      $3, $0, 0x1
/* ABC94 001ABB94 1B004314 */  bne        $2, $3, .L001ABC04
/* ABC98 001ABB98 00000000 */   nop
/* ABC9C 001ABB9C C000A28F */  lw         $2, 0xC0($sp)
/* ABCA0 001ABBA0 A000A2AF */  sw         $2, 0xA0($sp)
/* ABCA4 001ABBA4 9400A28F */  lw         $2, 0x94($sp)
/* ABCA8 001ABBA8 A400A2AF */  sw         $2, 0xA4($sp)
/* ABCAC 001ABBAC 9800A28F */  lw         $2, 0x98($sp)
/* ABCB0 001ABBB0 A800A2AF */  sw         $2, 0xA8($sp)
/* ABCB4 001ABBB4 9000A28F */  lw         $2, 0x90($sp)
/* ABCB8 001ABBB8 B000A2AF */  sw         $2, 0xB0($sp)
/* ABCBC 001ABBBC C400A28F */  lw         $2, 0xC4($sp)
/* ABCC0 001ABBC0 B400A2AF */  sw         $2, 0xB4($sp)
/* ABCC4 001ABBC4 C800A28F */  lw         $2, 0xC8($sp)
/* ABCC8 001ABBC8 B800A2AF */  sw         $2, 0xB8($sp)
/* ABCCC 001ABBCC D000B4AF */  sw         $20, 0xD0($sp)
/* ABCD0 001ABBD0 D400B3AF */  sw         $19, 0xD4($sp)
/* ABCD4 001ABBD4 D800B2AF */  sw         $18, 0xD8($sp)
/* ABCD8 001ABBD8 DC00B1AF */  sw         $17, 0xDC($sp)
/* ABCDC 001ABBDC D48B848F */  lw         $4, -0x742C($gp)
/* ABCE0 001ABBE0 282EC072 */  paddub     $5, $22, $0
/* ABCE4 001ABBE4 D000A627 */  addiu      $6, $sp, 0xD0
/* ABCE8 001ABBE8 9000A727 */  addiu      $7, $sp, 0x90
/* ABCEC 001ABBEC A000A827 */  addiu      $8, $sp, 0xA0
/* ABCF0 001ABBF0 B000A927 */  addiu      $9, $sp, 0xB0
/* ABCF4 001ABBF4 C000AA27 */  addiu      $10, $sp, 0xC0
/* ABCF8 001ABBF8 285E0072 */  paddub     $11, $16, $0
/* ABCFC 001ABBFC 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* ABD00 001ABC00 00000000 */   nop
.L001ABC04:
/* ABD04 001ABC04 8000BF7B */  lq         $31, 0x80($sp)
/* ABD08 001ABC08 7000B67B */  lq         $22, 0x70($sp)
/* ABD0C 001ABC0C 6000B57B */  lq         $21, 0x60($sp)
/* ABD10 001ABC10 5000B47B */  lq         $20, 0x50($sp)
/* ABD14 001ABC14 4000B37B */  lq         $19, 0x40($sp)
/* ABD18 001ABC18 3000B27B */  lq         $18, 0x30($sp)
/* ABD1C 001ABC1C 2000B17B */  lq         $17, 0x20($sp)
/* ABD20 001ABC20 1000B07B */  lq         $16, 0x10($sp)
/* ABD24 001ABC24 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* ABD28 001ABC28 E000BD27 */  addiu      $sp, $sp, 0xE0
/* ABD2C 001ABC2C 0800E003 */  jr         $31
/* ABD30 001ABC30 00000000 */   nop
/* ABD34 001ABC34 00000000 */  nop
/* ABD38 001ABC38 00000000 */  nop
/* ABD3C 001ABC3C 00000000 */  nop
