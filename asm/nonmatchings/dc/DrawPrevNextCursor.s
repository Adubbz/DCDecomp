.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawPrevNextCursor__Fv
/* 133B90 00233A90 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 133B94 00233A94 6000BF7F */  sq         $31, 0x60($sp)
/* 133B98 00233A98 5000B57F */  sq         $21, 0x50($sp)
/* 133B9C 00233A9C 4000B47F */  sq         $20, 0x40($sp)
/* 133BA0 00233AA0 3000B37F */  sq         $19, 0x30($sp)
/* 133BA4 00233AA4 2000B27F */  sq         $18, 0x20($sp)
/* 133BA8 00233AA8 1000B17F */  sq         $17, 0x10($sp)
/* 133BAC 00233AAC 0000B07F */  sq         $16, 0x0($sp)
/* 133BB0 00233AB0 C701023C */  lui        $2, %hi(TexManager)
/* 133BB4 00233AB4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 133BB8 00233AB8 2A00023C */  lui        $2, %hi(_535)
/* 133BBC 00233ABC 20F34524 */  addiu      $5, $2, %lo(_535)
/* 133BC0 00233AC0 FFFF0624 */  addiu      $6, $0, -0x1
/* 133BC4 00233AC4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 133BC8 00233AC8 00000000 */   nop
/* 133BCC 00233ACC 28864070 */  paddub     $16, $2, $0
/* 133BD0 00233AD0 38000012 */  beqz       $16, .L00233BB4
/* 133BD4 00233AD4 00000000 */   nop
/* 133BD8 00233AD8 40000224 */  addiu      $2, $0, 0x40
/* 133BDC 00233ADC 7000A2AF */  sw         $2, 0x70($sp)
/* 133BE0 00233AE0 7400B527 */  addiu      $21, $sp, 0x74
/* 133BE4 00233AE4 0000A0AE */  sw         $0, 0x0($21)
/* 133BE8 00233AE8 20000224 */  addiu      $2, $0, 0x20
/* 133BEC 00233AEC 7800B427 */  addiu      $20, $sp, 0x78
/* 133BF0 00233AF0 000082AE */  sw         $2, 0x0($20)
/* 133BF4 00233AF4 7C00B327 */  addiu      $19, $sp, 0x7C
/* 133BF8 00233AF8 000062AE */  sw         $2, 0x0($19)
/* 133BFC 00233AFC 9800A327 */  addiu      $3, $sp, 0x98
/* 133C00 00233B00 D08982DF */  ld         $2, -0x7630($gp)
/* 133C04 00233B04 000062FC */  sd         $2, 0x0($3)
/* 133C08 00233B08 48CD080C */  jal        GetNowManualPartTgaNum__Fv
/* 133C0C 00233B0C 00000000 */   nop
/* 133C10 00233B10 288E4070 */  paddub     $17, $2, $0
/* 133C14 00233B14 28960070 */  paddub     $18, $0, $0
/* 133C18 00233B18 23000010 */  b          .L00233BA8
/* 133C1C 00233B1C 00000000 */   nop
.L00233B20:
/* 133C20 00233B20 05004016 */  bnez       $18, .L00233B38
/* 133C24 00233B24 00000000 */   nop
/* 133C28 00233B28 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133C2C 00233B2C 96A82384 */  lh         $3, -0x576A($at)
/* 133C30 00233B30 19006010 */  beqz       $3, .L00233B98
/* 133C34 00233B34 00000000 */   nop
.L00233B38:
/* 133C38 00233B38 01000324 */  addiu      $3, $0, 0x1
/* 133C3C 00233B3C 06004316 */  bne        $18, $3, .L00233B58
/* 133C40 00233B40 00000000 */   nop
/* 133C44 00233B44 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 133C48 00233B48 96A82484 */  lh         $4, -0x576A($at)
/* 133C4C 00233B4C FFFF2326 */  addiu      $3, $17, -0x1
/* 133C50 00233B50 18008310 */  beq        $4, $3, .L00233BB4
/* 133C54 00233B54 00000000 */   nop
.L00233B58:
/* 133C58 00233B58 0000648E */  lw         $4, 0x0($19)
/* 133C5C 00233B5C 0000838E */  lw         $3, 0x0($20)
/* 133C60 00233B60 80101200 */  sll        $2, $18, 2
/* 133C64 00233B64 21105D00 */  addu       $2, $2, $sp
/* 133C68 00233B68 9800428C */  lw         $2, 0x98($2)
/* 133C6C 00233B6C 8000A2AF */  sw         $2, 0x80($sp)
/* 133C70 00233B70 06010224 */  addiu      $2, $0, 0x106
/* 133C74 00233B74 8400A2AF */  sw         $2, 0x84($sp)
/* 133C78 00233B78 8800A3AF */  sw         $3, 0x88($sp)
/* 133C7C 00233B7C 8C00A4AF */  sw         $4, 0x8C($sp)
/* 133C80 00233B80 28260072 */  paddub     $4, $16, $0
/* 133C84 00233B84 8000A527 */  addiu      $5, $sp, 0x80
/* 133C88 00233B88 7000A627 */  addiu      $6, $sp, 0x70
/* 133C8C 00233B8C 80000724 */  addiu      $7, $0, 0x80
/* 133C90 00233B90 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 133C94 00233B94 00000000 */   nop
.L00233B98:
/* 133C98 00233B98 01005226 */  addiu      $18, $18, 0x1
/* 133C9C 00233B9C 0000A38E */  lw         $3, 0x0($21)
/* 133CA0 00233BA0 20006324 */  addiu      $3, $3, 0x20
/* 133CA4 00233BA4 0000A3AE */  sw         $3, 0x0($21)
.L00233BA8:
/* 133CA8 00233BA8 0200432A */  slti       $3, $18, 0x2
/* 133CAC 00233BAC DCFF6014 */  bnez       $3, .L00233B20
/* 133CB0 00233BB0 00000000 */   nop
.L00233BB4:
/* 133CB4 00233BB4 6000BF7B */  lq         $31, 0x60($sp)
/* 133CB8 00233BB8 5000B57B */  lq         $21, 0x50($sp)
/* 133CBC 00233BBC 4000B47B */  lq         $20, 0x40($sp)
/* 133CC0 00233BC0 3000B37B */  lq         $19, 0x30($sp)
/* 133CC4 00233BC4 2000B27B */  lq         $18, 0x20($sp)
/* 133CC8 00233BC8 1000B17B */  lq         $17, 0x10($sp)
/* 133CCC 00233BCC 0000B07B */  lq         $16, 0x0($sp)
/* 133CD0 00233BD0 A000BD27 */  addiu      $sp, $sp, 0xA0
/* 133CD4 00233BD4 0800E003 */  jr         $31
/* 133CD8 00233BD8 00000000 */   nop
/* 133CDC 00233BDC 00000000 */  nop
