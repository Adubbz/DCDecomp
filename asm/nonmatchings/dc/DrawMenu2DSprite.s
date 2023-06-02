.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 12D020 0022CF20 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 12D024 0022CF24 2000BF7F */  sq         $31, 0x20($sp)
/* 12D028 0022CF28 1000B17F */  sq         $17, 0x10($sp)
/* 12D02C 0022CF2C 0000B07F */  sq         $16, 0x0($sp)
/* 12D030 0022CF30 288E8070 */  paddub     $17, $4, $0
/* 12D034 0022CF34 2886E070 */  paddub     $16, $7, $0
/* 12D038 0022CF38 3000A327 */  addiu      $3, $sp, 0x30
/* 12D03C 0022CF3C 0000A278 */  lq         $2, 0x0($5)
/* 12D040 0022CF40 0000627C */  sq         $2, 0x0($3)
/* 12D044 0022CF44 4000A327 */  addiu      $3, $sp, 0x40
/* 12D048 0022CF48 0000C278 */  lq         $2, 0x0($6)
/* 12D04C 0022CF4C 0000627C */  sq         $2, 0x0($3)
/* 12D050 0022CF50 A0B8040C */  jal        GetVif1Packet__Fv
/* 12D054 0022CF54 00000000 */   nop
/* 12D058 0022CF58 FF000832 */  andi       $8, $16, 0xFF
/* 12D05C 0022CF5C 28264070 */  paddub     $4, $2, $0
/* 12D060 0022CF60 282E2072 */  paddub     $5, $17, $0
/* 12D064 0022CF64 3000A627 */  addiu      $6, $sp, 0x30
/* 12D068 0022CF68 4000A727 */  addiu      $7, $sp, 0x40
/* 12D06C 0022CF6C C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 12D070 0022CF70 00000000 */   nop
/* 12D074 0022CF74 2000BF7B */  lq         $31, 0x20($sp)
/* 12D078 0022CF78 1000B17B */  lq         $17, 0x10($sp)
/* 12D07C 0022CF7C 0000B07B */  lq         $16, 0x0($sp)
/* 12D080 0022CF80 5000BD27 */  addiu      $sp, $sp, 0x50
/* 12D084 0022CF84 0800E003 */  jr         $31
/* 12D088 0022CF88 00000000 */   nop
/* 12D08C 0022CF8C 00000000 */  nop
