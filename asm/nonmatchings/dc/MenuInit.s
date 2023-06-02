.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuInit__Fv
/* 41E40 00141D40 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 41E44 00141D44 0000BF7F */  sq         $31, 0x0($sp)
/* 41E48 00141D48 6496040C */  jal        InitializeDataBuffer__Fv
/* 41E4C 00141D4C 00000000 */   nop
/* 41E50 00141D50 2B00023C */  lui        $2, %hi(TextureData)
/* 41E54 00141D54 30B04424 */  addiu      $4, $2, %lo(TextureData)
/* 41E58 00141D58 0100023C */  lui        $2, (0x186A0 >> 16)
/* 41E5C 00141D5C A0864534 */  ori        $5, $2, (0x186A0 & 0xFFFF)
/* 41E60 00141D60 A496040C */  jal        SetDataBuffer__FP14CDataAlloc2_1_i
/* 41E64 00141D64 00000000 */   nop
/* 41E68 00141D68 10270424 */  addiu      $4, $0, 0x2710
/* 41E6C 00141D6C 0100023C */  lui        $2, (0x186A0 >> 16)
/* 41E70 00141D70 A0864534 */  ori        $5, $2, (0x186A0 & 0xFFFF)
/* 41E74 00141D74 B896040C */  jal        SetPacketReadBuffer__Fii
/* 41E78 00141D78 00000000 */   nop
/* 41E7C 00141D7C C701023C */  lui        $2, %hi(TexManager)
/* 41E80 00141D80 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 41E84 00141D84 E03F0524 */  addiu      $5, $0, 0x3FE0
/* 41E88 00141D88 F0C3040C */  jal        Initialize__15CTextureManagerFi
/* 41E8C 00141D8C 00000000 */   nop
/* 41E90 00141D90 C701023C */  lui        $2, %hi(TexManager)
/* 41E94 00141D94 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 41E98 00141D98 2500023C */  lui        $2, %hi(texdata$879)
/* 41E9C 00141D9C 501C4524 */  addiu      $5, $2, %lo(texdata$879)
/* 41EA0 00141DA0 98D0040C */  jal        EnterTextureFile__15CTextureManagerFP16LOADTEXTURE_INFO
/* 41EA4 00141DA4 00000000 */   nop
/* 41EA8 00141DA8 C701023C */  lui        $2, %hi(TexManager)
/* 41EAC 00141DAC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 41EB0 00141DB0 FFFF0524 */  addiu      $5, $0, -0x1
/* 41EB4 00141DB4 948B868F */  lw         $6, -0x746C($gp)
/* 41EB8 00141DB8 4CCF040C */  jal        LoadTextureBlock__15CTextureManagerFiPUi
/* 41EBC 00141DBC 00000000 */   nop
/* 41EC0 00141DC0 00608044 */  mtc1       $0, $f12
/* 41EC4 00141DC4 00000000 */  nop
/* 41EC8 00141DC8 46630046 */  mov.s      $f13, $f12
/* 41ECC 00141DCC 0043023C */  lui        $2, (0x43000000 >> 16)
/* 41ED0 00141DD0 00788244 */  mtc1       $2, $f15
/* 41ED4 00141DD4 00000000 */  nop
/* 41ED8 00141DD8 867B0046 */  mov.s      $f14, $f15
/* 41EDC 00141DDC 24B8040C */  jal        MGSetBGColor__Fffff
/* 41EE0 00141DE0 00000000 */   nop
/* 41EE4 00141DE4 2A00023C */  lui        $2, %hi(_884_2)
/* 41EE8 00141DE8 A0944224 */  addiu      $2, $2, %lo(_884_2)
/* 41EEC 00141DEC CE01013C */  lui        $at, (0x1CE7350 >> 16)
/* 41EF0 00141DF0 507322AC */  sw         $2, (0x1CE7350 & 0xFFFF)($at)
/* 41EF4 00141DF4 10000224 */  addiu      $2, $0, 0x10
/* 41EF8 00141DF8 CE01013C */  lui        $at, (0x1CE7340 >> 16)
/* 41EFC 00141DFC 407322AC */  sw         $2, (0x1CE7340 & 0xFFFF)($at)
/* 41F00 00141E00 CE01013C */  lui        $at, (0x1CE7344 >> 16)
/* 41F04 00141E04 447322AC */  sw         $2, (0x1CE7344 & 0xFFFF)($at)
/* 41F08 00141E08 00010224 */  addiu      $2, $0, 0x100
/* 41F0C 00141E0C CE01013C */  lui        $at, (0x1CE7348 >> 16)
/* 41F10 00141E10 487322AC */  sw         $2, (0x1CE7348 & 0xFFFF)($at)
/* 41F14 00141E14 E0000224 */  addiu      $2, $0, 0xE0
/* 41F18 00141E18 CE01013C */  lui        $at, (0x1CE734C >> 16)
/* 41F1C 00141E1C 4C7322AC */  sw         $2, (0x1CE734C & 0xFFFF)($at)
/* 41F20 00141E20 40000224 */  addiu      $2, $0, 0x40
/* 41F24 00141E24 CE01013C */  lui        $at, (0x1CE7354 >> 16)
/* 41F28 00141E28 547322AC */  sw         $2, (0x1CE7354 & 0xFFFF)($at)
/* 41F2C 00141E2C CC01023C */  lui        $2, %hi(GamePad)
/* 41F30 00141E30 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 41F34 00141E34 00F00534 */  ori        $5, $0, 0xF000
/* 41F38 00141E38 19000624 */  addiu      $6, $0, 0x19
/* 41F3C 00141E3C 03000724 */  addiu      $7, $0, 0x3
/* 41F40 00141E40 58AD040C */  jal        SetAutoRepeat__8CGamePadFiii
/* 41F44 00141E44 00000000 */   nop
/* 41F48 00141E48 0000BF7B */  lq         $31, 0x0($sp)
/* 41F4C 00141E4C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 41F50 00141E50 0800E003 */  jr         $31
/* 41F54 00141E54 00000000 */   nop
/* 41F58 00141E58 00000000 */  nop
/* 41F5C 00141E5C 00000000 */  nop
