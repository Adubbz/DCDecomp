.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleMenuTexEnter__Fv
/* 0F5AC0 001F59C0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 0F5AC4 001F59C4 1000BF7F */  sq          $31, 0x10($29)
/* 0F5AC8 001F59C8 0000B07F */  sq          $16, 0x0($29)
/* 0F5ACC 001F59CC 2900023C */  lui         $2, %hi(LIT_936__2)
/* 0F5AD0 001F59D0 B02E4524 */  addiu       $5, $2, %lo(LIT_936__2)
/* 0F5AD4 001F59D4 2000A427 */  addiu       $4, $29, 0x20
/* 0F5AD8 001F59D8 03000324 */  addiu       $3, $0, 0x3
.L001F59DC:
/* 0F5ADC 001F59DC 0000A278 */  lq          $2, 0x0($5)
/* 0F5AE0 001F59E0 1000A524 */  addiu       $5, $5, 0x10
/* 0F5AE4 001F59E4 FFFF6324 */  addiu       $3, $3, -0x1
/* 0F5AE8 001F59E8 0000827C */  sq          $2, 0x0($4)
/* 0F5AEC 001F59EC 10008424 */  addiu       $4, $4, 0x10
/* 0F5AF0 001F59F0 FAFF601C */  bgtz        $3, .L001F59DC
/* 0F5AF4 001F59F4 00000000 */   nop
/* 0F5AF8 001F59F8 E094828F */  lw          $2, -0x6B20($28)
/* 0F5AFC 001F59FC 2400A2AF */  sw          $2, 0x24($29)
/* 0F5B00 001F5A00 3000A2AF */  sw          $2, 0x30($29)
/* 0F5B04 001F5A04 3C00A2AF */  sw          $2, 0x3C($29)
/* 0F5B08 001F5A08 28260070 */  paddub      $4, $0, $0
/* 0F5B0C 001F5A0C 18FB040C */  jal         GetReadBGFile__Fi
/* 0F5B10 001F5A10 00000000 */   nop
/* 0F5B14 001F5A14 28864070 */  paddub      $16, $2, $0
/* 0F5B18 001F5A18 8C00448C */  lw          $4, 0x8C($2)
/* 0F5B1C 001F5A1C 2A00023C */  lui         $2, %hi(LIT_940__2)
/* 0F5B20 001F5A20 98D54524 */  addiu       $5, $2, %lo(LIT_940__2)
/* 0F5B24 001F5A24 28360070 */  paddub      $6, $0, $0
/* 0F5B28 001F5A28 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0F5B2C 001F5A2C 00000000 */   nop
/* 0F5B30 001F5A30 3800A2AF */  sw          $2, 0x38($29)
/* 0F5B34 001F5A34 5800A427 */  addiu       $4, $29, 0x58
/* 0F5B38 001F5A38 588882DF */  ld          $2, -0x77A8($28)
/* 0F5B3C 001F5A3C 000082FC */  sd          $2, 0x0($4)
/* 0F5B40 001F5A40 E094828F */  lw          $2, -0x6B20($28)
/* 0F5B44 001F5A44 5800A2AF */  sw          $2, 0x58($29)
/* 0F5B48 001F5A48 4CB4080C */  jal         MenuTextureDelete__FPi
/* 0F5B4C 001F5A4C 00000000 */   nop
/* 0F5B50 001F5A50 C701023C */  lui         $2, %hi(TexManager)
/* 0F5B54 001F5A54 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F5B58 001F5A58 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0F5B5C 001F5A5C 00000000 */   nop
/* 0F5B60 001F5A60 C701023C */  lui         $2, %hi(TexManager)
/* 0F5B64 001F5A64 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0F5B68 001F5A68 FFFF0524 */  addiu       $5, $0, -0x1
/* 0F5B6C 001F5A6C 2000A627 */  addiu       $6, $29, 0x20
/* 0F5B70 001F5A70 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0F5B74 001F5A74 00000000 */   nop
/* 0F5B78 001F5A78 28D6070C */  jal         BtlMenuTexBlockEnter__Fv
/* 0F5B7C 001F5A7C 00000000 */   nop
/* 0F5B80 001F5A80 8C00048E */  lw          $4, 0x8C($16)
/* 0F5B84 001F5A84 2A00023C */  lui         $2, %hi(LIT_941)
/* 0F5B88 001F5A88 A8D54524 */  addiu       $5, $2, %lo(LIT_941)
/* 0F5B8C 001F5A8C 28360070 */  paddub      $6, $0, $0
/* 0F5B90 001F5A90 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0F5B94 001F5A94 00000000 */   nop
/* 0F5B98 001F5A98 E09682AF */  sw          $2, -0x6920($28)
/* 0F5B9C 001F5A9C 8C00048E */  lw          $4, 0x8C($16)
/* 0F5BA0 001F5AA0 2A00023C */  lui         $2, %hi(LIT_942)
/* 0F5BA4 001F5AA4 B8D54524 */  addiu       $5, $2, %lo(LIT_942)
/* 0F5BA8 001F5AA8 28360070 */  paddub      $6, $0, $0
/* 0F5BAC 001F5AAC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0F5BB0 001F5AB0 00000000 */   nop
/* 0F5BB4 001F5AB4 28864070 */  paddub      $16, $2, $0
/* 0F5BB8 001F5AB8 28260070 */  paddub      $4, $0, $0
/* 0F5BBC 001F5ABC 282E0072 */  paddub      $5, $16, $0
/* 0F5BC0 001F5AC0 50B0080C */  jal         InitMenuMesSet__FiPs
/* 0F5BC4 001F5AC4 00000000 */   nop
/* 0F5BC8 001F5AC8 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x98)
/* 0F5BCC 001F5ACC E82320AC */  sw          $0, %lo(CommonMenuMes2 + 0x98)($1)
/* 0F5BD0 001F5AD0 01000224 */  addiu       $2, $0, 0x1
/* 0F5BD4 001F5AD4 E89482AF */  sw          $2, -0x6B18($28)
/* 0F5BD8 001F5AD8 D901023C */  lui         $2, %hi(MenuMes)
/* 0F5BDC 001F5ADC F0034424 */  addiu       $4, $2, %lo(MenuMes)
/* 0F5BE0 001F5AE0 282E0072 */  paddub      $5, $16, $0
/* 0F5BE4 001F5AE4 742D080C */  jal         SetBuffInfo__10MenuClsMesFPs
/* 0F5BE8 001F5AE8 00000000 */   nop
/* 0F5BEC 001F5AEC 1000BF7B */  lq          $31, 0x10($29)
/* 0F5BF0 001F5AF0 0000B07B */  lq          $16, 0x0($29)
/* 0F5BF4 001F5AF4 6000BD27 */  addiu       $29, $29, 0x60
/* 0F5BF8 001F5AF8 0800E003 */  jr          $31
/* 0F5BFC 001F5AFC 00000000 */   nop
