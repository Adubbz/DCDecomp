.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadCharaMajin__Fv
/* 013E10 01DBFB10 F0FFBD27 */  addiu       $29, $29, -0x10
/* 013E14 01DBFB14 0000BF7F */  sq          $31, 0x0($29)
/* 013E18 01DBFB18 DE01013C */  lui         $1, %hi(CScript__2 + 0x12C)
/* 013E1C 01DBFB1C 2C1C248C */  lw          $4, %lo(CScript__2 + 0x12C)($1)
/* 013E20 01DBFB20 02000324 */  addiu       $3, $0, 0x2
/* 013E24 01DBFB24 1C008310 */  beq         $4, $3, .L01DBFB98_2C5398
/* 013E28 01DBFB28 00000000 */   nop
/* 013E2C 01DBFB2C 01000324 */  addiu       $3, $0, 0x1
/* 013E30 01DBFB30 10008310 */  beq         $4, $3, .L01DBFB74_2C5374
/* 013E34 01DBFB34 00000000 */   nop
/* 013E38 01DBFB38 03008010 */  beqz        $4, .L01DBFB48_2C5348
/* 013E3C 01DBFB3C 00000000 */   nop
/* 013E40 01DBFB40 32000010 */  b           .L01DBFC0C_2C540C
/* 013E44 01DBFB44 00000000 */   nop
.L01DBFB48_2C5348:
/* 013E48 01DBFB48 948B858F */  lw          $5, -0x746C($28)
/* 013E4C 01DBFB4C DE01023C */  lui         $2, %hi(LIT_990__3)
/* 013E50 01DBFB50 10F94424 */  addiu       $4, $2, %lo(LIT_990__3)
/* 013E54 01DBFB54 28360070 */  paddub      $6, $0, $0
/* 013E58 01DBFB58 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 013E5C 01DBFB5C 00000000 */   nop
/* 013E60 01DBFB60 01000324 */  addiu       $3, $0, 0x1
/* 013E64 01DBFB64 DE01013C */  lui         $1, %hi(CScript__2 + 0x12C)
/* 013E68 01DBFB68 2C1C23AC */  sw          $3, %lo(CScript__2 + 0x12C)($1)
/* 013E6C 01DBFB6C 27000010 */  b           .L01DBFC0C_2C540C
/* 013E70 01DBFB70 00000000 */   nop
.L01DBFB74_2C5374:
/* 013E74 01DBFB74 8CFB040C */  jal         ReadBGSync__Fv
/* 013E78 01DBFB78 00000000 */   nop
/* 013E7C 01DBFB7C 23004014 */  bnez        $2, .L01DBFC0C_2C540C
/* 013E80 01DBFB80 00000000 */   nop
/* 013E84 01DBFB84 02000324 */  addiu       $3, $0, 0x2
/* 013E88 01DBFB88 DE01013C */  lui         $1, %hi(CScript__2 + 0x12C)
/* 013E8C 01DBFB8C 2C1C23AC */  sw          $3, %lo(CScript__2 + 0x12C)($1)
/* 013E90 01DBFB90 1E000010 */  b           .L01DBFC0C_2C540C
/* 013E94 01DBFB94 00000000 */   nop
.L01DBFB98_2C5398:
/* 013E98 01DBFB98 DF01023C */  lui         $2, %hi(DngEventMan + 0xEF0)
/* 013E9C 01DBFB9C A0454424 */  addiu       $4, $2, %lo(DngEventMan + 0xEF0)
/* 013EA0 01DBFBA0 74E6040C */  jal         Initialize__10CCharacterFv
/* 013EA4 01DBFBA4 00000000 */   nop
/* 013EA8 01DBFBA8 DF01023C */  lui         $2, %hi(DngEventMan + 0xEF0)
/* 013EAC 01DBFBAC A0454424 */  addiu       $4, $2, %lo(DngEventMan + 0xEF0)
/* 013EB0 01DBFBB0 948B858F */  lw          $5, -0x746C($28)
/* 013EB4 01DBFBB4 DE01023C */  lui         $2, %hi(LIT_991__2)
/* 013EB8 01DBFBB8 28F94624 */  addiu       $6, $2, %lo(LIT_991__2)
/* 013EBC 01DBFBBC DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 013EC0 01DBFBC0 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 013EC4 01DBFBC4 28460070 */  paddub      $8, $0, $0
/* 013EC8 01DBFBC8 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 013ECC 01DBFBCC 00000000 */   nop
/* 013ED0 01DBFBD0 A040033C */  lui         $3, (0x40A00000 >> 16)
/* 013ED4 01DBFBD4 DF01013C */  lui         $1, %hi(DngEventMan + 0x11E0)
/* 013ED8 01DBFBD8 904823AC */  sw          $3, %lo(DngEventMan + 0x11E0)($1)
/* 013EDC 01DBFBDC 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 013EE0 01DBFBE0 DF01013C */  lui         $1, %hi(DngEventMan + 0x11E8)
/* 013EE4 01DBFBE4 984823AC */  sw          $3, %lo(DngEventMan + 0x11E8)($1)
/* 013EE8 01DBFBE8 DF01013C */  lui         $1, %hi(DngEventMan + 0x11F4)
/* 013EEC 01DBFBEC A44820AC */  sw          $0, %lo(DngEventMan + 0x11F4)($1)
/* 013EF0 01DBFBF0 DF01013C */  lui         $1, %hi(DngEventMan + 0x11F8)
/* 013EF4 01DBFBF4 A84820AC */  sw          $0, %lo(DngEventMan + 0x11F8)($1)
/* 013EF8 01DBFBF8 FFFF0324 */  addiu       $3, $0, -0x1
/* 013EFC 01DBFBFC DE01013C */  lui         $1, %hi(CScript__2 + 0x128)
/* 013F00 01DBFC00 281C23AC */  sw          $3, %lo(CScript__2 + 0x128)($1)
/* 013F04 01DBFC04 DE01013C */  lui         $1, %hi(CScript__2 + 0x12C)
/* 013F08 01DBFC08 2C1C23AC */  sw          $3, %lo(CScript__2 + 0x12C)($1)
.L01DBFC0C_2C540C:
/* 013F0C 01DBFC0C 0000BF7B */  lq          $31, 0x0($29)
/* 013F10 01DBFC10 1000BD27 */  addiu       $29, $29, 0x10
/* 013F14 01DBFC14 0800E003 */  jr          $31
/* 013F18 01DBFC18 00000000 */   nop
/* 013F1C 01DBFC1C 00000000 */  nop
