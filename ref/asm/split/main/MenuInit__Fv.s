.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MenuInit__Fv
/* 041E40 00141D40 F0FFBD27 */  addiu       $29, $29, -0x10
/* 041E44 00141D44 0000BF7F */  sq          $31, 0x0($29)
/* 041E48 00141D48 6496040C */  jal         InitializeDataBuffer__Fv
/* 041E4C 00141D4C 00000000 */   nop
/* 041E50 00141D50 2B00023C */  lui         $2, %hi(TextureData)
/* 041E54 00141D54 30B04424 */  addiu       $4, $2, %lo(TextureData)
/* 041E58 00141D58 0100023C */  lui         $2, (0x186A0 >> 16)
/* 041E5C 00141D5C A0864534 */  ori         $5, $2, (0x186A0 & 0xFFFF)
/* 041E60 00141D60 A496040C */  jal         SetDataBuffer__FP14CDataAlloc2_1_i
/* 041E64 00141D64 00000000 */   nop
/* 041E68 00141D68 10270424 */  addiu       $4, $0, 0x2710
/* 041E6C 00141D6C 0100023C */  lui         $2, (0x186A0 >> 16)
/* 041E70 00141D70 A0864534 */  ori         $5, $2, (0x186A0 & 0xFFFF)
/* 041E74 00141D74 B896040C */  jal         SetPacketReadBuffer__Fii
/* 041E78 00141D78 00000000 */   nop
/* 041E7C 00141D7C C701023C */  lui         $2, %hi(TexManager)
/* 041E80 00141D80 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 041E84 00141D84 E03F0524 */  addiu       $5, $0, 0x3FE0
/* 041E88 00141D88 F0C3040C */  jal         Initialize__15CTextureManagerFi
/* 041E8C 00141D8C 00000000 */   nop
/* 041E90 00141D90 C701023C */  lui         $2, %hi(TexManager)
/* 041E94 00141D94 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 041E98 00141D98 2500023C */  lui         $2, %hi(texdata$879)
/* 041E9C 00141D9C 501C4524 */  addiu       $5, $2, %lo(texdata$879)
/* 041EA0 00141DA0 98D0040C */  jal         EnterTextureFile__15CTextureManagerFP16LOADTEXTURE_INFO
/* 041EA4 00141DA4 00000000 */   nop
/* 041EA8 00141DA8 C701023C */  lui         $2, %hi(TexManager)
/* 041EAC 00141DAC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 041EB0 00141DB0 FFFF0524 */  addiu       $5, $0, -0x1
/* 041EB4 00141DB4 948B868F */  lw          $6, -0x746C($28)
/* 041EB8 00141DB8 4CCF040C */  jal         LoadTextureBlock__15CTextureManagerFiPUi
/* 041EBC 00141DBC 00000000 */   nop
/* 041EC0 00141DC0 00608044 */  mtc1        $0, $f12
/* 041EC4 00141DC4 00000000 */  nop
/* 041EC8 00141DC8 46630046 */  mov.s       $f13, $f12
/* 041ECC 00141DCC 0043023C */  lui         $2, (0x43000000 >> 16)
/* 041ED0 00141DD0 00788244 */  mtc1        $2, $f15
/* 041ED4 00141DD4 00000000 */  nop
/* 041ED8 00141DD8 867B0046 */  mov.s       $f14, $f15
/* 041EDC 00141DDC 24B8040C */  jal         MGSetBGColor__Fffff
/* 041EE0 00141DE0 00000000 */   nop
/* 041EE4 00141DE4 2A00023C */  lui         $2, %hi(LIT_884__2)
/* 041EE8 00141DE8 A0944224 */  addiu       $2, $2, %lo(LIT_884__2)
/* 041EEC 00141DEC CE01013C */  lui         $1, %hi(DebugFont + 0x10)
/* 041EF0 00141DF0 507322AC */  sw          $2, %lo(DebugFont + 0x10)($1)
/* 041EF4 00141DF4 10000224 */  addiu       $2, $0, 0x10
/* 041EF8 00141DF8 CE01013C */  lui         $1, %hi(DebugFont)
/* 041EFC 00141DFC 407322AC */  sw          $2, %lo(DebugFont)($1)
/* 041F00 00141E00 CE01013C */  lui         $1, %hi(DebugFont + 0x4)
/* 041F04 00141E04 447322AC */  sw          $2, %lo(DebugFont + 0x4)($1)
/* 041F08 00141E08 00010224 */  addiu       $2, $0, 0x100
/* 041F0C 00141E0C CE01013C */  lui         $1, %hi(DebugFont + 0x8)
/* 041F10 00141E10 487322AC */  sw          $2, %lo(DebugFont + 0x8)($1)
/* 041F14 00141E14 E0000224 */  addiu       $2, $0, 0xE0
/* 041F18 00141E18 CE01013C */  lui         $1, %hi(DebugFont + 0xC)
/* 041F1C 00141E1C 4C7322AC */  sw          $2, %lo(DebugFont + 0xC)($1)
/* 041F20 00141E20 40000224 */  addiu       $2, $0, 0x40
/* 041F24 00141E24 CE01013C */  lui         $1, %hi(DebugFont + 0x14)
/* 041F28 00141E28 547322AC */  sw          $2, %lo(DebugFont + 0x14)($1)
/* 041F2C 00141E2C CC01023C */  lui         $2, %hi(GamePad)
/* 041F30 00141E30 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 041F34 00141E34 00F00534 */  ori         $5, $0, 0xF000
/* 041F38 00141E38 19000624 */  addiu       $6, $0, 0x19
/* 041F3C 00141E3C 03000724 */  addiu       $7, $0, 0x3
/* 041F40 00141E40 58AD040C */  jal         SetAutoRepeat__8CGamePadFiii
/* 041F44 00141E44 00000000 */   nop
/* 041F48 00141E48 0000BF7B */  lq          $31, 0x0($29)
/* 041F4C 00141E4C 1000BD27 */  addiu       $29, $29, 0x10
/* 041F50 00141E50 0800E003 */  jr          $31
/* 041F54 00141E54 00000000 */   nop
/* 041F58 00141E58 00000000 */  nop
/* 041F5C 00141E5C 00000000 */  nop
