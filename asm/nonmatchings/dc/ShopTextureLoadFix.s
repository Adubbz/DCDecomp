.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ShopTextureLoadFix__Fv
/* E7DD0 001E7CD0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* E7DD4 001E7CD4 2000BF7F */  sq         $31, 0x20($sp)
/* E7DD8 001E7CD8 1000B17F */  sq         $17, 0x10($sp)
/* E7DDC 001E7CDC 0000B07F */  sq         $16, 0x0($sp)
/* E7DE0 001E7CE0 2900023C */  lui        $2, %hi(_784_2)
/* E7DE4 001E7CE4 E0264524 */  addiu      $5, $2, %lo(_784_2)
/* E7DE8 001E7CE8 3000A427 */  addiu      $4, $sp, 0x30
/* E7DEC 001E7CEC 02000324 */  addiu      $3, $0, 0x2
.L001E7CF0:
/* E7DF0 001E7CF0 0000A278 */  lq         $2, 0x0($5)
/* E7DF4 001E7CF4 1000A524 */  addiu      $5, $5, 0x10
/* E7DF8 001E7CF8 FFFF6324 */  addiu      $3, $3, -0x1
/* E7DFC 001E7CFC 0000827C */  sq         $2, 0x0($4)
/* E7E00 001E7D00 10008424 */  addiu      $4, $4, 0x10
/* E7E04 001E7D04 FAFF601C */  bgtz       $3, .L001E7CF0
/* E7E08 001E7D08 00000000 */   nop
/* E7E0C 001E7D0C 0000A2C4 */  lwc1       $f2, 0x0($5)
/* E7E10 001E7D10 000082E4 */  swc1       $f2, 0x0($4)
/* E7E14 001E7D14 D901013C */  lui        $at, (0x1D9025A >> 16)
/* E7E18 001E7D18 5A022284 */  lh         $2, (0x1D9025A & 0xFFFF)($at)
/* E7E1C 001E7D1C 3400A2AF */  sw         $2, 0x34($sp)
/* E7E20 001E7D20 4000A2AF */  sw         $2, 0x40($sp)
/* E7E24 001E7D24 28260070 */  paddub     $4, $0, $0
/* E7E28 001E7D28 18FB040C */  jal        GetReadBGFile__Fi
/* E7E2C 001E7D2C 00000000 */   nop
/* E7E30 001E7D30 28864070 */  paddub     $16, $2, $0
/* E7E34 001E7D34 8C00448C */  lw         $4, 0x8C($2)
/* E7E38 001E7D38 2A00023C */  lui        $2, %hi(_787)
/* E7E3C 001E7D3C 90D14524 */  addiu      $5, $2, %lo(_787)
/* E7E40 001E7D40 28360070 */  paddub     $6, $0, $0
/* E7E44 001E7D44 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* E7E48 001E7D48 00000000 */   nop
/* E7E4C 001E7D4C 3C00A2AF */  sw         $2, 0x3C($sp)
/* E7E50 001E7D50 D901013C */  lui        $at, (0x1D9025A >> 16)
/* E7E54 001E7D54 5A022584 */  lh         $5, (0x1D9025A & 0xFFFF)($at)
/* E7E58 001E7D58 C701023C */  lui        $2, %hi(TexManager)
/* E7E5C 001E7D5C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* E7E60 001E7D60 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* E7E64 001E7D64 00000000 */   nop
/* E7E68 001E7D68 C701023C */  lui        $2, %hi(TexManager)
/* E7E6C 001E7D6C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* E7E70 001E7D70 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* E7E74 001E7D74 00000000 */   nop
/* E7E78 001E7D78 C701023C */  lui        $2, %hi(TexManager)
/* E7E7C 001E7D7C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* E7E80 001E7D80 FFFF0524 */  addiu      $5, $0, -0x1
/* E7E84 001E7D84 3000A627 */  addiu      $6, $sp, 0x30
/* E7E88 001E7D88 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* E7E8C 001E7D8C 00000000 */   nop
/* E7E90 001E7D90 D901013C */  lui        $at, (0x1D9025A >> 16)
/* E7E94 001E7D94 5A022684 */  lh         $6, (0x1D9025A & 0xFFFF)($at)
/* E7E98 001E7D98 C701023C */  lui        $2, %hi(TexManager)
/* E7E9C 001E7D9C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* E7EA0 001E7DA0 2A00023C */  lui        $2, %hi(_788)
/* E7EA4 001E7DA4 A0D14524 */  addiu      $5, $2, %lo(_788)
/* E7EA8 001E7DA8 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* E7EAC 001E7DAC 00000000 */   nop
/* E7EB0 001E7DB0 889482AF */  sw         $2, -0x6B78($gp)
/* E7EB4 001E7DB4 D901013C */  lui        $at, (0x1D9025A >> 16)
/* E7EB8 001E7DB8 5A022684 */  lh         $6, (0x1D9025A & 0xFFFF)($at)
/* E7EBC 001E7DBC C701023C */  lui        $2, %hi(TexManager)
/* E7EC0 001E7DC0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* E7EC4 001E7DC4 2A00023C */  lui        $2, %hi(_789_2)
/* E7EC8 001E7DC8 A8D14524 */  addiu      $5, $2, %lo(_789_2)
/* E7ECC 001E7DCC B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* E7ED0 001E7DD0 00000000 */   nop
/* E7ED4 001E7DD4 A49782AF */  sw         $2, -0x685C($gp)
/* E7ED8 001E7DD8 D901013C */  lui        $at, (0x1D9025A >> 16)
/* E7EDC 001E7DDC 5A022684 */  lh         $6, (0x1D9025A & 0xFFFF)($at)
/* E7EE0 001E7DE0 C701023C */  lui        $2, %hi(TexManager)
/* E7EE4 001E7DE4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* E7EE8 001E7DE8 2A00023C */  lui        $2, %hi(_790)
/* E7EEC 001E7DEC B0D14524 */  addiu      $5, $2, %lo(_790)
/* E7EF0 001E7DF0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* E7EF4 001E7DF4 00000000 */   nop
/* E7EF8 001E7DF8 B09682AF */  sw         $2, -0x6950($gp)
/* E7EFC 001E7DFC D901013C */  lui        $at, (0x1D9025A >> 16)
/* E7F00 001E7E00 5A022684 */  lh         $6, (0x1D9025A & 0xFFFF)($at)
/* E7F04 001E7E04 C701023C */  lui        $2, %hi(TexManager)
/* E7F08 001E7E08 70584424 */  addiu      $4, $2, %lo(TexManager)
/* E7F0C 001E7E0C 2A00023C */  lui        $2, %hi(_791)
/* E7F10 001E7E10 B8D14524 */  addiu      $5, $2, %lo(_791)
/* E7F14 001E7E14 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* E7F18 001E7E18 00000000 */   nop
/* E7F1C 001E7E1C A89682AF */  sw         $2, -0x6958($gp)
/* E7F20 001E7E20 01000224 */  addiu      $2, $0, 0x1
/* E7F24 001E7E24 D901013C */  lui        $at, (0x1D90258 >> 16)
/* E7F28 001E7E28 580222A4 */  sh         $2, (0x1D90258 & 0xFFFF)($at)
/* E7F2C 001E7E2C 8C00048E */  lw         $4, 0x8C($16)
/* E7F30 001E7E30 2A00023C */  lui        $2, %hi(_792_3)
/* E7F34 001E7E34 C8D14524 */  addiu      $5, $2, %lo(_792_3)
/* E7F38 001E7E38 28360070 */  paddub     $6, $0, $0
/* E7F3C 001E7E3C C8FD040C */  jal        GetPackFile__FPUiPcPi
/* E7F40 001E7E40 00000000 */   nop
/* E7F44 001E7E44 288E4070 */  paddub     $17, $2, $0
/* E7F48 001E7E48 8C00048E */  lw         $4, 0x8C($16)
/* E7F4C 001E7E4C 2A00023C */  lui        $2, %hi(_793_2)
/* E7F50 001E7E50 D8D14524 */  addiu      $5, $2, %lo(_793_2)
/* E7F54 001E7E54 28360070 */  paddub     $6, $0, $0
/* E7F58 001E7E58 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* E7F5C 001E7E5C 00000000 */   nop
/* E7F60 001E7E60 28864070 */  paddub     $16, $2, $0
/* E7F64 001E7E64 02000424 */  addiu      $4, $0, 0x2
/* E7F68 001E7E68 282E2072 */  paddub     $5, $17, $0
/* E7F6C 001E7E6C 50B0080C */  jal        InitMenuMesSet__FiPs
/* E7F70 001E7E70 00000000 */   nop
/* E7F74 001E7E74 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* E7F78 001E7E78 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* E7F7C 001E7E7C 282E0072 */  paddub     $5, $16, $0
/* E7F80 001E7E80 8036050C */  jal        SetBuff__6ClsMesFPs
/* E7F84 001E7E84 00000000 */   nop
/* E7F88 001E7E88 2000BF7B */  lq         $31, 0x20($sp)
/* E7F8C 001E7E8C 1000B17B */  lq         $17, 0x10($sp)
/* E7F90 001E7E90 0000B07B */  lq         $16, 0x0($sp)
/* E7F94 001E7E94 6000BD27 */  addiu      $sp, $sp, 0x60
/* E7F98 001E7E98 0800E003 */  jr         $31
/* E7F9C 001E7E9C 00000000 */   nop
