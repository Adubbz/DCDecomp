.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
/* 12D090 0022CF90 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 12D094 0022CF94 5000BF7F */  sq         $31, 0x50($sp)
/* 12D098 0022CF98 4000B47F */  sq         $20, 0x40($sp)
/* 12D09C 0022CF9C 3000B37F */  sq         $19, 0x30($sp)
/* 12D0A0 0022CFA0 2000B27F */  sq         $18, 0x20($sp)
/* 12D0A4 0022CFA4 1000B17F */  sq         $17, 0x10($sp)
/* 12D0A8 0022CFA8 0000B07F */  sq         $16, 0x0($sp)
/* 12D0AC 0022CFAC 28A68070 */  paddub     $20, $4, $0
/* 12D0B0 0022CFB0 289EE070 */  paddub     $19, $7, $0
/* 12D0B4 0022CFB4 28960071 */  paddub     $18, $8, $0
/* 12D0B8 0022CFB8 288E2071 */  paddub     $17, $9, $0
/* 12D0BC 0022CFBC 28864071 */  paddub     $16, $10, $0
/* 12D0C0 0022CFC0 6000A327 */  addiu      $3, $sp, 0x60
/* 12D0C4 0022CFC4 0000A278 */  lq         $2, 0x0($5)
/* 12D0C8 0022CFC8 0000627C */  sq         $2, 0x0($3)
/* 12D0CC 0022CFCC 7000A327 */  addiu      $3, $sp, 0x70
/* 12D0D0 0022CFD0 0000C278 */  lq         $2, 0x0($6)
/* 12D0D4 0022CFD4 0000627C */  sq         $2, 0x0($3)
/* 12D0D8 0022CFD8 A0B8040C */  jal        GetVif1Packet__Fv
/* 12D0DC 0022CFDC 00000000 */   nop
/* 12D0E0 0022CFE0 FF000B32 */  andi       $11, $16, 0xFF
/* 12D0E4 0022CFE4 28264070 */  paddub     $4, $2, $0
/* 12D0E8 0022CFE8 282E8072 */  paddub     $5, $20, $0
/* 12D0EC 0022CFEC 6000A627 */  addiu      $6, $sp, 0x60
/* 12D0F0 0022CFF0 7000A727 */  addiu      $7, $sp, 0x70
/* 12D0F4 0022CFF4 28466072 */  paddub     $8, $19, $0
/* 12D0F8 0022CFF8 284E4072 */  paddub     $9, $18, $0
/* 12D0FC 0022CFFC 28562072 */  paddub     $10, $17, $0
/* 12D100 0022D000 8C71050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 12D104 0022D004 00000000 */   nop
/* 12D108 0022D008 5000BF7B */  lq         $31, 0x50($sp)
/* 12D10C 0022D00C 4000B47B */  lq         $20, 0x40($sp)
/* 12D110 0022D010 3000B37B */  lq         $19, 0x30($sp)
/* 12D114 0022D014 2000B27B */  lq         $18, 0x20($sp)
/* 12D118 0022D018 1000B17B */  lq         $17, 0x10($sp)
/* 12D11C 0022D01C 0000B07B */  lq         $16, 0x0($sp)
/* 12D120 0022D020 8000BD27 */  addiu      $sp, $sp, 0x80
/* 12D124 0022D024 0800E003 */  jr         $31
/* 12D128 0022D028 00000000 */   nop
/* 12D12C 0022D02C 00000000 */  nop
