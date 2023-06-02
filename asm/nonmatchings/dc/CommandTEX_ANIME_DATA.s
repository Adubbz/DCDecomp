.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandTEX_ANIME_DATA__FPPv
/* 67DE0 00167CE0 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 67DE4 00167CE4 4000BF7F */  sq         $31, 0x40($sp)
/* 67DE8 00167CE8 3000B37F */  sq         $19, 0x30($sp)
/* 67DEC 00167CEC 2000B27F */  sq         $18, 0x20($sp)
/* 67DF0 00167CF0 1000B17F */  sq         $17, 0x10($sp)
/* 67DF4 00167CF4 0000B07F */  sq         $16, 0x0($sp)
/* 67DF8 00167CF8 288E8070 */  paddub     $17, $4, $0
/* 67DFC 00167CFC 5000A427 */  addiu      $4, $sp, 0x50
/* 67E00 00167D00 289C050C */  jal        __ct__13CTexAnimeDataFv
/* 67E04 00167D04 00000000 */   nop
/* 67E08 00167D08 988E8287 */  lh         $2, -0x7168($gp)
/* 67E0C 00167D0C 5200A2A7 */  sh         $2, 0x52($sp)
/* 67E10 00167D10 5000A0A7 */  sh         $0, 0x50($sp)
/* 67E14 00167D14 0000258E */  lw         $5, 0x0($17)
/* 67E18 00167D18 0400228E */  lw         $2, 0x4($17)
/* 67E1C 00167D1C 00004284 */  lh         $2, 0x0($2)
/* 67E20 00167D20 8800A2A7 */  sh         $2, 0x88($sp)
/* 67E24 00167D24 0800228E */  lw         $2, 0x8($17)
/* 67E28 00167D28 00004284 */  lh         $2, 0x0($2)
/* 67E2C 00167D2C 8A00A2A7 */  sh         $2, 0x8A($sp)
/* 67E30 00167D30 0C00228E */  lw         $2, 0xC($17)
/* 67E34 00167D34 00004284 */  lh         $2, 0x0($2)
/* 67E38 00167D38 8C00A2A7 */  sh         $2, 0x8C($sp)
/* 67E3C 00167D3C 1000228E */  lw         $2, 0x10($17)
/* 67E40 00167D40 00004284 */  lh         $2, 0x0($2)
/* 67E44 00167D44 8E00A2A7 */  sh         $2, 0x8E($sp)
/* 67E48 00167D48 1400308E */  lw         $16, 0x14($17)
/* 67E4C 00167D4C 1800228E */  lw         $2, 0x18($17)
/* 67E50 00167D50 00004284 */  lh         $2, 0x0($2)
/* 67E54 00167D54 9000A2A7 */  sh         $2, 0x90($sp)
/* 67E58 00167D58 1C00228E */  lw         $2, 0x1C($17)
/* 67E5C 00167D5C 00004284 */  lh         $2, 0x0($2)
/* 67E60 00167D60 9200A2A7 */  sh         $2, 0x92($sp)
/* 67E64 00167D64 2000228E */  lw         $2, 0x20($17)
/* 67E68 00167D68 00004284 */  lh         $2, 0x0($2)
/* 67E6C 00167D6C 5400A327 */  addiu      $3, $sp, 0x54
/* 67E70 00167D70 000062A4 */  sh         $2, 0x0($3)
/* 67E74 00167D74 2400228E */  lw         $2, 0x24($17)
/* 67E78 00167D78 0000428C */  lw         $2, 0x0($2)
/* 67E7C 00167D7C 03004010 */  beqz       $2, .L00167D8C
/* 67E80 00167D80 00000000 */   nop
/* 67E84 00167D84 FFFF0224 */  addiu      $2, $0, -0x1
/* 67E88 00167D88 000062A4 */  sh         $2, 0x0($3)
.L00167D8C:
/* 67E8C 00167D8C C701023C */  lui        $2, %hi(TexManager)
/* 67E90 00167D90 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 67E94 00167D94 FFFF0624 */  addiu      $6, $0, -0x1
/* 67E98 00167D98 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 67E9C 00167D9C 00000000 */   nop
/* 67EA0 00167DA0 288E4070 */  paddub     $17, $2, $0
/* 67EA4 00167DA4 C701023C */  lui        $2, %hi(TexManager)
/* 67EA8 00167DA8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 67EAC 00167DAC 282E0072 */  paddub     $5, $16, $0
/* 67EB0 00167DB0 FFFF0624 */  addiu      $6, $0, -0x1
/* 67EB4 00167DB4 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 67EB8 00167DB8 00000000 */   nop
/* 67EBC 00167DBC 28864070 */  paddub     $16, $2, $0
/* 67EC0 00167DC0 5800B227 */  addiu      $18, $sp, 0x58
/* 67EC4 00167DC4 28264072 */  paddub     $4, $18, $0
/* 67EC8 00167DC8 282E0070 */  paddub     $5, $0, $0
/* 67ECC 00167DCC 18000624 */  addiu      $6, $0, 0x18
/* 67ED0 00167DD0 5A0D040C */  jal        memset
/* 67ED4 00167DD4 00000000 */   nop
/* 67ED8 00167DD8 FFFF0224 */  addiu      $2, $0, -0x1
/* 67EDC 00167DDC 000042A6 */  sh         $2, 0x0($18)
/* 67EE0 00167DE0 7000B327 */  addiu      $19, $sp, 0x70
/* 67EE4 00167DE4 28266072 */  paddub     $4, $19, $0
/* 67EE8 00167DE8 282E0070 */  paddub     $5, $0, $0
/* 67EEC 00167DEC 18000624 */  addiu      $6, $0, 0x18
/* 67EF0 00167DF0 5A0D040C */  jal        memset
/* 67EF4 00167DF4 00000000 */   nop
/* 67EF8 00167DF8 FFFF0324 */  addiu      $3, $0, -0x1
/* 67EFC 00167DFC 000063A6 */  sh         $3, 0x0($19)
/* 67F00 00167E00 0F002012 */  beqz       $17, .L00167E40
/* 67F04 00167E04 00000000 */   nop
/* 67F08 00167E08 0D000012 */  beqz       $16, .L00167E40
/* 67F0C 00167E0C 00000000 */   nop
/* 67F10 00167E10 28264072 */  paddub     $4, $18, $0
/* 67F14 00167E14 282E2072 */  paddub     $5, $17, $0
/* 67F18 00167E18 189C050C */  jal        Copy__16CTextureTexAnimeFP8CTexture
/* 67F1C 00167E1C 00000000 */   nop
/* 67F20 00167E20 28266072 */  paddub     $4, $19, $0
/* 67F24 00167E24 282E0072 */  paddub     $5, $16, $0
/* 67F28 00167E28 189C050C */  jal        Copy__16CTextureTexAnimeFP8CTexture
/* 67F2C 00167E2C 00000000 */   nop
/* 67F30 00167E30 948E848F */  lw         $4, -0x716C($gp)
/* 67F34 00167E34 5000A527 */  addiu      $5, $sp, 0x50
/* 67F38 00167E38 789E050C */  jal        EnterTexAnime__13CTextureAnimeFP13CTexAnimeData
/* 67F3C 00167E3C 00000000 */   nop
.L00167E40:
/* 67F40 00167E40 4000BF7B */  lq         $31, 0x40($sp)
/* 67F44 00167E44 3000B37B */  lq         $19, 0x30($sp)
/* 67F48 00167E48 2000B27B */  lq         $18, 0x20($sp)
/* 67F4C 00167E4C 1000B17B */  lq         $17, 0x10($sp)
/* 67F50 00167E50 0000B07B */  lq         $16, 0x0($sp)
/* 67F54 00167E54 B000BD27 */  addiu      $sp, $sp, 0xB0
/* 67F58 00167E58 0800E003 */  jr         $31
/* 67F5C 00167E5C 00000000 */   nop
