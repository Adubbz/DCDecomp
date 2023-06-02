.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditEffectStep__Fv
/* 66E10 00166D10 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 66E14 00166D14 1000BF7F */  sq         $31, 0x10($sp)
/* 66E18 00166D18 0000B07F */  sq         $16, 0x0($sp)
/* 66E1C 00166D1C D201023C */  lui        $2, %hi(Fire)
/* 66E20 00166D20 F08E4424 */  addiu      $4, $2, %lo(Fire)
/* 66E24 00166D24 BC85050C */  jal        FireStep__9CFireOmniFv
/* 66E28 00166D28 00000000 */   nop
/* 66E2C 00166D2C D201023C */  lui        $2, %hi(Candle)
/* 66E30 00166D30 308F4424 */  addiu      $4, $2, %lo(Candle)
/* 66E34 00166D34 B88E050C */  jal        Step__13CCandleEffectFv
/* 66E38 00166D38 00000000 */   nop
/* 66E3C 00166D3C C701023C */  lui        $2, %hi(TexManager)
/* 66E40 00166D40 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 66E44 00166D44 2A00023C */  lui        $2, %hi(_606)
/* 66E48 00166D48 50A14524 */  addiu      $5, $2, %lo(_606)
/* 66E4C 00166D4C FFFF0624 */  addiu      $6, $0, -0x1
/* 66E50 00166D50 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 66E54 00166D54 00000000 */   nop
/* 66E58 00166D58 D201033C */  lui        $3, %hi(Candle)
/* 66E5C 00166D5C 308F6424 */  addiu      $4, $3, %lo(Candle)
/* 66E60 00166D60 282E4070 */  paddub     $5, $2, $0
/* 66E64 00166D64 A48E050C */  jal        SetTexture__13CCandleEffectFP8CTexture
/* 66E68 00166D68 00000000 */   nop
/* 66E6C 00166D6C C701023C */  lui        $2, %hi(TexManager)
/* 66E70 00166D70 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 66E74 00166D74 2A00023C */  lui        $2, %hi(_607)
/* 66E78 00166D78 58A14524 */  addiu      $5, $2, %lo(_607)
/* 66E7C 00166D7C FFFF0624 */  addiu      $6, $0, -0x1
/* 66E80 00166D80 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 66E84 00166D84 00000000 */   nop
/* 66E88 00166D88 28864070 */  paddub     $16, $2, $0
/* 66E8C 00166D8C C701023C */  lui        $2, %hi(TexManager)
/* 66E90 00166D90 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 66E94 00166D94 2A00023C */  lui        $2, %hi(_608)
/* 66E98 00166D98 68A14524 */  addiu      $5, $2, %lo(_608)
/* 66E9C 00166D9C FFFF0624 */  addiu      $6, $0, -0x1
/* 66EA0 00166DA0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 66EA4 00166DA4 00000000 */   nop
/* 66EA8 00166DA8 D201033C */  lui        $3, %hi(Fire)
/* 66EAC 00166DAC F08E6424 */  addiu      $4, $3, %lo(Fire)
/* 66EB0 00166DB0 282E0072 */  paddub     $5, $16, $0
/* 66EB4 00166DB4 28364070 */  paddub     $6, $2, $0
/* 66EB8 00166DB8 A886050C */  jal        SetTexture__9CFireOmniFP8CTextureP8CTexture
/* 66EBC 00166DBC 00000000 */   nop
/* 66EC0 00166DC0 1000BF7B */  lq         $31, 0x10($sp)
/* 66EC4 00166DC4 0000B07B */  lq         $16, 0x0($sp)
/* 66EC8 00166DC8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 66ECC 00166DCC 0800E003 */  jr         $31
/* 66ED0 00166DD0 00000000 */   nop
/* 66ED4 00166DD4 00000000 */  nop
/* 66ED8 00166DD8 00000000 */  nop
/* 66EDC 00166DDC 00000000 */  nop
