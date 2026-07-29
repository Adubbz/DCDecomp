.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ShopTextureLoadFix__Fv
/* 0E7DD0 001E7CD0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 0E7DD4 001E7CD4 2000BF7F */  sq          $31, 0x20($29)
/* 0E7DD8 001E7CD8 1000B17F */  sq          $17, 0x10($29)
/* 0E7DDC 001E7CDC 0000B07F */  sq          $16, 0x0($29)
/* 0E7DE0 001E7CE0 2900023C */  lui         $2, %hi(LIT_784__2)
/* 0E7DE4 001E7CE4 E0264524 */  addiu       $5, $2, %lo(LIT_784__2)
/* 0E7DE8 001E7CE8 3000A427 */  addiu       $4, $29, 0x30
/* 0E7DEC 001E7CEC 02000324 */  addiu       $3, $0, 0x2
.L001E7CF0:
/* 0E7DF0 001E7CF0 0000A278 */  lq          $2, 0x0($5)
/* 0E7DF4 001E7CF4 1000A524 */  addiu       $5, $5, 0x10
/* 0E7DF8 001E7CF8 FFFF6324 */  addiu       $3, $3, -0x1
/* 0E7DFC 001E7CFC 0000827C */  sq          $2, 0x0($4)
/* 0E7E00 001E7D00 10008424 */  addiu       $4, $4, 0x10
/* 0E7E04 001E7D04 FAFF601C */  bgtz        $3, .L001E7CF0
/* 0E7E08 001E7D08 00000000 */   nop
/* 0E7E0C 001E7D0C 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 0E7E10 001E7D10 000082E4 */  swc1        $f2, 0x0($4)
/* 0E7E14 001E7D14 D901013C */  lui         $1, %hi(ShopMenu + 0x18A)
/* 0E7E18 001E7D18 5A022284 */  lh          $2, %lo(ShopMenu + 0x18A)($1)
/* 0E7E1C 001E7D1C 3400A2AF */  sw          $2, 0x34($29)
/* 0E7E20 001E7D20 4000A2AF */  sw          $2, 0x40($29)
/* 0E7E24 001E7D24 28260070 */  paddub      $4, $0, $0
/* 0E7E28 001E7D28 18FB040C */  jal         GetReadBGFile__Fi
/* 0E7E2C 001E7D2C 00000000 */   nop
/* 0E7E30 001E7D30 28864070 */  paddub      $16, $2, $0
/* 0E7E34 001E7D34 8C00448C */  lw          $4, 0x8C($2)
/* 0E7E38 001E7D38 2A00023C */  lui         $2, %hi(LIT_787)
/* 0E7E3C 001E7D3C 90D14524 */  addiu       $5, $2, %lo(LIT_787)
/* 0E7E40 001E7D40 28360070 */  paddub      $6, $0, $0
/* 0E7E44 001E7D44 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0E7E48 001E7D48 00000000 */   nop
/* 0E7E4C 001E7D4C 3C00A2AF */  sw          $2, 0x3C($29)
/* 0E7E50 001E7D50 D901013C */  lui         $1, %hi(ShopMenu + 0x18A)
/* 0E7E54 001E7D54 5A022584 */  lh          $5, %lo(ShopMenu + 0x18A)($1)
/* 0E7E58 001E7D58 C701023C */  lui         $2, %hi(TexManager)
/* 0E7E5C 001E7D5C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0E7E60 001E7D60 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0E7E64 001E7D64 00000000 */   nop
/* 0E7E68 001E7D68 C701023C */  lui         $2, %hi(TexManager)
/* 0E7E6C 001E7D6C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0E7E70 001E7D70 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0E7E74 001E7D74 00000000 */   nop
/* 0E7E78 001E7D78 C701023C */  lui         $2, %hi(TexManager)
/* 0E7E7C 001E7D7C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0E7E80 001E7D80 FFFF0524 */  addiu       $5, $0, -0x1
/* 0E7E84 001E7D84 3000A627 */  addiu       $6, $29, 0x30
/* 0E7E88 001E7D88 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0E7E8C 001E7D8C 00000000 */   nop
/* 0E7E90 001E7D90 D901013C */  lui         $1, %hi(ShopMenu + 0x18A)
/* 0E7E94 001E7D94 5A022684 */  lh          $6, %lo(ShopMenu + 0x18A)($1)
/* 0E7E98 001E7D98 C701023C */  lui         $2, %hi(TexManager)
/* 0E7E9C 001E7D9C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0E7EA0 001E7DA0 2A00023C */  lui         $2, %hi(LIT_788)
/* 0E7EA4 001E7DA4 A0D14524 */  addiu       $5, $2, %lo(LIT_788)
/* 0E7EA8 001E7DA8 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0E7EAC 001E7DAC 00000000 */   nop
/* 0E7EB0 001E7DB0 889482AF */  sw          $2, -0x6B78($28)
/* 0E7EB4 001E7DB4 D901013C */  lui         $1, %hi(ShopMenu + 0x18A)
/* 0E7EB8 001E7DB8 5A022684 */  lh          $6, %lo(ShopMenu + 0x18A)($1)
/* 0E7EBC 001E7DBC C701023C */  lui         $2, %hi(TexManager)
/* 0E7EC0 001E7DC0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0E7EC4 001E7DC4 2A00023C */  lui         $2, %hi(LIT_789__2)
/* 0E7EC8 001E7DC8 A8D14524 */  addiu       $5, $2, %lo(LIT_789__2)
/* 0E7ECC 001E7DCC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0E7ED0 001E7DD0 00000000 */   nop
/* 0E7ED4 001E7DD4 A49782AF */  sw          $2, -0x685C($28)
/* 0E7ED8 001E7DD8 D901013C */  lui         $1, %hi(ShopMenu + 0x18A)
/* 0E7EDC 001E7DDC 5A022684 */  lh          $6, %lo(ShopMenu + 0x18A)($1)
/* 0E7EE0 001E7DE0 C701023C */  lui         $2, %hi(TexManager)
/* 0E7EE4 001E7DE4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0E7EE8 001E7DE8 2A00023C */  lui         $2, %hi(LIT_790)
/* 0E7EEC 001E7DEC B0D14524 */  addiu       $5, $2, %lo(LIT_790)
/* 0E7EF0 001E7DF0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0E7EF4 001E7DF4 00000000 */   nop
/* 0E7EF8 001E7DF8 B09682AF */  sw          $2, -0x6950($28)
/* 0E7EFC 001E7DFC D901013C */  lui         $1, %hi(ShopMenu + 0x18A)
/* 0E7F00 001E7E00 5A022684 */  lh          $6, %lo(ShopMenu + 0x18A)($1)
/* 0E7F04 001E7E04 C701023C */  lui         $2, %hi(TexManager)
/* 0E7F08 001E7E08 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0E7F0C 001E7E0C 2A00023C */  lui         $2, %hi(LIT_791)
/* 0E7F10 001E7E10 B8D14524 */  addiu       $5, $2, %lo(LIT_791)
/* 0E7F14 001E7E14 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0E7F18 001E7E18 00000000 */   nop
/* 0E7F1C 001E7E1C A89682AF */  sw          $2, -0x6958($28)
/* 0E7F20 001E7E20 01000224 */  addiu       $2, $0, 0x1
/* 0E7F24 001E7E24 D901013C */  lui         $1, %hi(ShopMenu + 0x188)
/* 0E7F28 001E7E28 580222A4 */  sh          $2, %lo(ShopMenu + 0x188)($1)
/* 0E7F2C 001E7E2C 8C00048E */  lw          $4, 0x8C($16)
/* 0E7F30 001E7E30 2A00023C */  lui         $2, %hi(LIT_792__3)
/* 0E7F34 001E7E34 C8D14524 */  addiu       $5, $2, %lo(LIT_792__3)
/* 0E7F38 001E7E38 28360070 */  paddub      $6, $0, $0
/* 0E7F3C 001E7E3C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0E7F40 001E7E40 00000000 */   nop
/* 0E7F44 001E7E44 288E4070 */  paddub      $17, $2, $0
/* 0E7F48 001E7E48 8C00048E */  lw          $4, 0x8C($16)
/* 0E7F4C 001E7E4C 2A00023C */  lui         $2, %hi(LIT_793__2)
/* 0E7F50 001E7E50 D8D14524 */  addiu       $5, $2, %lo(LIT_793__2)
/* 0E7F54 001E7E54 28360070 */  paddub      $6, $0, $0
/* 0E7F58 001E7E58 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0E7F5C 001E7E5C 00000000 */   nop
/* 0E7F60 001E7E60 28864070 */  paddub      $16, $2, $0
/* 0E7F64 001E7E64 02000424 */  addiu       $4, $0, 0x2
/* 0E7F68 001E7E68 282E2072 */  paddub      $5, $17, $0
/* 0E7F6C 001E7E6C 50B0080C */  jal         InitMenuMesSet__FiPs
/* 0E7F70 001E7E70 00000000 */   nop
/* 0E7F74 001E7E74 DA01023C */  lui         $2, %hi(CommonMenuMes3)
/* 0E7F78 001E7E78 103B4424 */  addiu       $4, $2, %lo(CommonMenuMes3)
/* 0E7F7C 001E7E7C 282E0072 */  paddub      $5, $16, $0
/* 0E7F80 001E7E80 8036050C */  jal         SetBuff__6ClsMesFPs
/* 0E7F84 001E7E84 00000000 */   nop
/* 0E7F88 001E7E88 2000BF7B */  lq          $31, 0x20($29)
/* 0E7F8C 001E7E8C 1000B17B */  lq          $17, 0x10($29)
/* 0E7F90 001E7E90 0000B07B */  lq          $16, 0x0($29)
/* 0E7F94 001E7E94 6000BD27 */  addiu       $29, $29, 0x60
/* 0E7F98 001E7E98 0800E003 */  jr          $31
/* 0E7F9C 001E7E9C 00000000 */   nop
