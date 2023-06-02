.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* 12D130 0022D030 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 12D134 0022D034 6000BF7F */  sq         $31, 0x60($sp)
/* 12D138 0022D038 5000B47F */  sq         $20, 0x50($sp)
/* 12D13C 0022D03C 4000B37F */  sq         $19, 0x40($sp)
/* 12D140 0022D040 3000B27F */  sq         $18, 0x30($sp)
/* 12D144 0022D044 2000B17F */  sq         $17, 0x20($sp)
/* 12D148 0022D048 1000B07F */  sq         $16, 0x10($sp)
/* 12D14C 0022D04C 28A68070 */  paddub     $20, $4, $0
/* 12D150 0022D050 289EE070 */  paddub     $19, $7, $0
/* 12D154 0022D054 28960071 */  paddub     $18, $8, $0
/* 12D158 0022D058 288E2071 */  paddub     $17, $9, $0
/* 12D15C 0022D05C 28864071 */  paddub     $16, $10, $0
/* 12D160 0022D060 7000A327 */  addiu      $3, $sp, 0x70
/* 12D164 0022D064 0000A278 */  lq         $2, 0x0($5)
/* 12D168 0022D068 0000627C */  sq         $2, 0x0($3)
/* 12D16C 0022D06C 8000A327 */  addiu      $3, $sp, 0x80
/* 12D170 0022D070 0000C278 */  lq         $2, 0x0($6)
/* 12D174 0022D074 0000627C */  sq         $2, 0x0($3)
/* 12D178 0022D078 A0B8040C */  jal        GetVif1Packet__Fv
/* 12D17C 0022D07C 00000000 */   nop
/* 12D180 0022D080 01000324 */  addiu      $3, $0, 0x1
/* 12D184 0022D084 0000A3FF */  sd         $3, 0x0($sp)
/* 12D188 0022D088 28264070 */  paddub     $4, $2, $0
/* 12D18C 0022D08C 282E8072 */  paddub     $5, $20, $0
/* 12D190 0022D090 7000A627 */  addiu      $6, $sp, 0x70
/* 12D194 0022D094 8000A727 */  addiu      $7, $sp, 0x80
/* 12D198 0022D098 28466072 */  paddub     $8, $19, $0
/* 12D19C 0022D09C 284E4072 */  paddub     $9, $18, $0
/* 12D1A0 0022D0A0 28562072 */  paddub     $10, $17, $0
/* 12D1A4 0022D0A4 285E0072 */  paddub     $11, $16, $0
/* 12D1A8 0022D0A8 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 12D1AC 0022D0AC 00000000 */   nop
/* 12D1B0 0022D0B0 6000BF7B */  lq         $31, 0x60($sp)
/* 12D1B4 0022D0B4 5000B47B */  lq         $20, 0x50($sp)
/* 12D1B8 0022D0B8 4000B37B */  lq         $19, 0x40($sp)
/* 12D1BC 0022D0BC 3000B27B */  lq         $18, 0x30($sp)
/* 12D1C0 0022D0C0 2000B17B */  lq         $17, 0x20($sp)
/* 12D1C4 0022D0C4 1000B07B */  lq         $16, 0x10($sp)
/* 12D1C8 0022D0C8 9000BD27 */  addiu      $sp, $sp, 0x90
/* 12D1CC 0022D0CC 0800E003 */  jr         $31
/* 12D1D0 0022D0D0 00000000 */   nop
/* 12D1D4 0022D0D4 00000000 */  nop
/* 12D1D8 0022D0D8 00000000 */  nop
/* 12D1DC 0022D0DC 00000000 */  nop
