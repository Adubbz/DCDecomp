.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EditEffectStep__Fv
/* 066E10 00166D10 E0FFBD27 */  addiu       $29, $29, -0x20
/* 066E14 00166D14 1000BF7F */  sq          $31, 0x10($29)
/* 066E18 00166D18 0000B07F */  sq          $16, 0x0($29)
/* 066E1C 00166D1C D201023C */  lui         $2, %hi(Fire)
/* 066E20 00166D20 F08E4424 */  addiu       $4, $2, %lo(Fire)
/* 066E24 00166D24 BC85050C */  jal         FireStep__9CFireOmniFv
/* 066E28 00166D28 00000000 */   nop
/* 066E2C 00166D2C D201023C */  lui         $2, %hi(Candle)
/* 066E30 00166D30 308F4424 */  addiu       $4, $2, %lo(Candle)
/* 066E34 00166D34 B88E050C */  jal         Step__13CCandleEffectFv
/* 066E38 00166D38 00000000 */   nop
/* 066E3C 00166D3C C701023C */  lui         $2, %hi(TexManager)
/* 066E40 00166D40 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 066E44 00166D44 2A00023C */  lui         $2, %hi(LIT_606)
/* 066E48 00166D48 50A14524 */  addiu       $5, $2, %lo(LIT_606)
/* 066E4C 00166D4C FFFF0624 */  addiu       $6, $0, -0x1
/* 066E50 00166D50 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 066E54 00166D54 00000000 */   nop
/* 066E58 00166D58 D201033C */  lui         $3, %hi(Candle)
/* 066E5C 00166D5C 308F6424 */  addiu       $4, $3, %lo(Candle)
/* 066E60 00166D60 282E4070 */  paddub      $5, $2, $0
/* 066E64 00166D64 A48E050C */  jal         SetTexture__13CCandleEffectFP8CTexture
/* 066E68 00166D68 00000000 */   nop
/* 066E6C 00166D6C C701023C */  lui         $2, %hi(TexManager)
/* 066E70 00166D70 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 066E74 00166D74 2A00023C */  lui         $2, %hi(LIT_607)
/* 066E78 00166D78 58A14524 */  addiu       $5, $2, %lo(LIT_607)
/* 066E7C 00166D7C FFFF0624 */  addiu       $6, $0, -0x1
/* 066E80 00166D80 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 066E84 00166D84 00000000 */   nop
/* 066E88 00166D88 28864070 */  paddub      $16, $2, $0
/* 066E8C 00166D8C C701023C */  lui         $2, %hi(TexManager)
/* 066E90 00166D90 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 066E94 00166D94 2A00023C */  lui         $2, %hi(LIT_608)
/* 066E98 00166D98 68A14524 */  addiu       $5, $2, %lo(LIT_608)
/* 066E9C 00166D9C FFFF0624 */  addiu       $6, $0, -0x1
/* 066EA0 00166DA0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 066EA4 00166DA4 00000000 */   nop
/* 066EA8 00166DA8 D201033C */  lui         $3, %hi(Fire)
/* 066EAC 00166DAC F08E6424 */  addiu       $4, $3, %lo(Fire)
/* 066EB0 00166DB0 282E0072 */  paddub      $5, $16, $0
/* 066EB4 00166DB4 28364070 */  paddub      $6, $2, $0
/* 066EB8 00166DB8 A886050C */  jal         SetTexture__9CFireOmniFP8CTextureP8CTexture
/* 066EBC 00166DBC 00000000 */   nop
/* 066EC0 00166DC0 1000BF7B */  lq          $31, 0x10($29)
/* 066EC4 00166DC4 0000B07B */  lq          $16, 0x0($29)
/* 066EC8 00166DC8 2000BD27 */  addiu       $29, $29, 0x20
/* 066ECC 00166DCC 0800E003 */  jr          $31
/* 066ED0 00166DD0 00000000 */   nop
/* 066ED4 00166DD4 00000000 */  nop
/* 066ED8 00166DD8 00000000 */  nop
/* 066EDC 00166DDC 00000000 */  nop
