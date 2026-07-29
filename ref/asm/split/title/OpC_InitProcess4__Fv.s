.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpC_InitProcess4__Fv
/* 011D20 01DBDA20 30FFBD27 */  addiu       $29, $29, -0xD0
/* 011D24 01DBDA24 0000BF7F */  sq          $31, 0x0($29)
.L01DBDA28_2C3228:
/* 011D28 01DBDA28 8CFB040C */  jal         ReadBGSync__Fv
/* 011D2C 01DBDA2C 00000000 */   nop
/* 011D30 01DBDA30 FDFF4014 */  bnez        $2, .L01DBDA28_2C3228
/* 011D34 01DBDA34 00000000 */   nop
/* 011D38 01DBDA38 C701023C */  lui         $2, %hi(TexManager)
/* 011D3C 01DBDA3C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011D40 01DBDA40 282E0070 */  paddub      $5, $0, $0
/* 011D44 01DBDA44 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 011D48 01DBDA48 00000000 */   nop
/* 011D4C 01DBDA4C C701023C */  lui         $2, %hi(TexManager)
/* 011D50 01DBDA50 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011D54 01DBDA54 0A000524 */  addiu       $5, $0, 0xA
/* 011D58 01DBDA58 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 011D5C 01DBDA5C 00000000 */   nop
/* 011D60 01DBDA60 C701023C */  lui         $2, %hi(TexManager)
/* 011D64 01DBDA64 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011D68 01DBDA68 0B000524 */  addiu       $5, $0, 0xB
/* 011D6C 01DBDA6C C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 011D70 01DBDA70 00000000 */   nop
/* 011D74 01DBDA74 C701023C */  lui         $2, %hi(TexManager)
/* 011D78 01DBDA78 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011D7C 01DBDA7C FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 011D80 01DBDA80 00000000 */   nop
/* 011D84 01DBDA84 DD01023C */  lui         $2, %hi(LIT_593__4)
/* 011D88 01DBDA88 B07D4524 */  addiu       $5, $2, %lo(LIT_593__4)
/* 011D8C 01DBDA8C 1000A427 */  addiu       $4, $29, 0x10
/* 011D90 01DBDA90 0B000324 */  addiu       $3, $0, 0xB
.L01DBDA94_2C3294:
/* 011D94 01DBDA94 0000A278 */  lq          $2, 0x0($5)
/* 011D98 01DBDA98 1000A524 */  addiu       $5, $5, 0x10
/* 011D9C 01DBDA9C FFFF6324 */  addiu       $3, $3, -0x1
/* 011DA0 01DBDAA0 0000827C */  sq          $2, 0x0($4)
/* 011DA4 01DBDAA4 10008424 */  addiu       $4, $4, 0x10
/* 011DA8 01DBDAA8 FAFF601C */  bgtz        $3, .L01DBDA94_2C3294
/* 011DAC 01DBDAAC 00000000 */   nop
/* 011DB0 01DBDAB0 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 011DB4 01DBDAB4 000082E4 */  swc1        $f2, 0x0($4)
/* 011DB8 01DBDAB8 948B848F */  lw          $4, -0x746C($28)
/* 011DBC 01DBDABC DE01023C */  lui         $2, %hi(LIT_468__5)
/* 011DC0 01DBDAC0 08ED4524 */  addiu       $5, $2, %lo(LIT_468__5)
/* 011DC4 01DBDAC4 28360070 */  paddub      $6, $0, $0
/* 011DC8 01DBDAC8 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011DCC 01DBDACC 00000000 */   nop
/* 011DD0 01DBDAD0 1C00A2AF */  sw          $2, 0x1C($29)
/* 011DD4 01DBDAD4 2000A0AF */  sw          $0, 0x20($29)
/* 011DD8 01DBDAD8 2400A0AF */  sw          $0, 0x24($29)
/* 011DDC 01DBDADC 948B848F */  lw          $4, -0x746C($28)
/* 011DE0 01DBDAE0 DE01023C */  lui         $2, %hi(LIT_469__6)
/* 011DE4 01DBDAE4 18ED4524 */  addiu       $5, $2, %lo(LIT_469__6)
/* 011DE8 01DBDAE8 28360070 */  paddub      $6, $0, $0
/* 011DEC 01DBDAEC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011DF0 01DBDAF0 00000000 */   nop
/* 011DF4 01DBDAF4 2800A2AF */  sw          $2, 0x28($29)
/* 011DF8 01DBDAF8 0A000224 */  addiu       $2, $0, 0xA
/* 011DFC 01DBDAFC 2C00A2AF */  sw          $2, 0x2C($29)
/* 011E00 01DBDB00 3000A0AF */  sw          $0, 0x30($29)
/* 011E04 01DBDB04 948B848F */  lw          $4, -0x746C($28)
/* 011E08 01DBDB08 DE01023C */  lui         $2, %hi(LIT_470__5)
/* 011E0C 01DBDB0C 28ED4524 */  addiu       $5, $2, %lo(LIT_470__5)
/* 011E10 01DBDB10 28360070 */  paddub      $6, $0, $0
/* 011E14 01DBDB14 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011E18 01DBDB18 00000000 */   nop
/* 011E1C 01DBDB1C 3400A2AF */  sw          $2, 0x34($29)
/* 011E20 01DBDB20 0A000224 */  addiu       $2, $0, 0xA
/* 011E24 01DBDB24 3800A2AF */  sw          $2, 0x38($29)
/* 011E28 01DBDB28 3C00A0AF */  sw          $0, 0x3C($29)
/* 011E2C 01DBDB2C 948B848F */  lw          $4, -0x746C($28)
/* 011E30 01DBDB30 DE01023C */  lui         $2, %hi(LIT_471__5)
/* 011E34 01DBDB34 38ED4524 */  addiu       $5, $2, %lo(LIT_471__5)
/* 011E38 01DBDB38 28360070 */  paddub      $6, $0, $0
/* 011E3C 01DBDB3C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011E40 01DBDB40 00000000 */   nop
/* 011E44 01DBDB44 4000A2AF */  sw          $2, 0x40($29)
/* 011E48 01DBDB48 0A000224 */  addiu       $2, $0, 0xA
/* 011E4C 01DBDB4C 4400A2AF */  sw          $2, 0x44($29)
/* 011E50 01DBDB50 4800A0AF */  sw          $0, 0x48($29)
/* 011E54 01DBDB54 948B848F */  lw          $4, -0x746C($28)
/* 011E58 01DBDB58 DE01023C */  lui         $2, %hi(LIT_472__3)
/* 011E5C 01DBDB5C 48ED4524 */  addiu       $5, $2, %lo(LIT_472__3)
/* 011E60 01DBDB60 28360070 */  paddub      $6, $0, $0
/* 011E64 01DBDB64 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011E68 01DBDB68 00000000 */   nop
/* 011E6C 01DBDB6C 4C00A2AF */  sw          $2, 0x4C($29)
/* 011E70 01DBDB70 0A000224 */  addiu       $2, $0, 0xA
/* 011E74 01DBDB74 5000A2AF */  sw          $2, 0x50($29)
/* 011E78 01DBDB78 5400A0AF */  sw          $0, 0x54($29)
/* 011E7C 01DBDB7C 948B848F */  lw          $4, -0x746C($28)
/* 011E80 01DBDB80 DE01023C */  lui         $2, %hi(LIT_473__3)
/* 011E84 01DBDB84 58ED4524 */  addiu       $5, $2, %lo(LIT_473__3)
/* 011E88 01DBDB88 28360070 */  paddub      $6, $0, $0
/* 011E8C 01DBDB8C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011E90 01DBDB90 00000000 */   nop
/* 011E94 01DBDB94 5800A2AF */  sw          $2, 0x58($29)
/* 011E98 01DBDB98 0A000224 */  addiu       $2, $0, 0xA
/* 011E9C 01DBDB9C 5C00A2AF */  sw          $2, 0x5C($29)
/* 011EA0 01DBDBA0 6000A0AF */  sw          $0, 0x60($29)
/* 011EA4 01DBDBA4 948B848F */  lw          $4, -0x746C($28)
/* 011EA8 01DBDBA8 DE01023C */  lui         $2, %hi(LIT_474__2)
/* 011EAC 01DBDBAC 68ED4524 */  addiu       $5, $2, %lo(LIT_474__2)
/* 011EB0 01DBDBB0 28360070 */  paddub      $6, $0, $0
/* 011EB4 01DBDBB4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011EB8 01DBDBB8 00000000 */   nop
/* 011EBC 01DBDBBC 6400A2AF */  sw          $2, 0x64($29)
/* 011EC0 01DBDBC0 0A000224 */  addiu       $2, $0, 0xA
/* 011EC4 01DBDBC4 6800A2AF */  sw          $2, 0x68($29)
/* 011EC8 01DBDBC8 6C00A0AF */  sw          $0, 0x6C($29)
/* 011ECC 01DBDBCC 948B848F */  lw          $4, -0x746C($28)
/* 011ED0 01DBDBD0 DE01023C */  lui         $2, %hi(LIT_475__4)
/* 011ED4 01DBDBD4 78ED4524 */  addiu       $5, $2, %lo(LIT_475__4)
/* 011ED8 01DBDBD8 28360070 */  paddub      $6, $0, $0
/* 011EDC 01DBDBDC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011EE0 01DBDBE0 00000000 */   nop
/* 011EE4 01DBDBE4 7000A2AF */  sw          $2, 0x70($29)
/* 011EE8 01DBDBE8 0B000224 */  addiu       $2, $0, 0xB
/* 011EEC 01DBDBEC 7400A2AF */  sw          $2, 0x74($29)
/* 011EF0 01DBDBF0 7800A0AF */  sw          $0, 0x78($29)
/* 011EF4 01DBDBF4 948B848F */  lw          $4, -0x746C($28)
/* 011EF8 01DBDBF8 DE01023C */  lui         $2, %hi(LIT_476__2)
/* 011EFC 01DBDBFC 88ED4524 */  addiu       $5, $2, %lo(LIT_476__2)
/* 011F00 01DBDC00 28360070 */  paddub      $6, $0, $0
/* 011F04 01DBDC04 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011F08 01DBDC08 00000000 */   nop
/* 011F0C 01DBDC0C 7C00A2AF */  sw          $2, 0x7C($29)
/* 011F10 01DBDC10 0B000224 */  addiu       $2, $0, 0xB
/* 011F14 01DBDC14 8000A2AF */  sw          $2, 0x80($29)
/* 011F18 01DBDC18 8400A0AF */  sw          $0, 0x84($29)
/* 011F1C 01DBDC1C 948B848F */  lw          $4, -0x746C($28)
/* 011F20 01DBDC20 DE01023C */  lui         $2, %hi(LIT_477__2)
/* 011F24 01DBDC24 98ED4524 */  addiu       $5, $2, %lo(LIT_477__2)
/* 011F28 01DBDC28 28360070 */  paddub      $6, $0, $0
/* 011F2C 01DBDC2C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011F30 01DBDC30 00000000 */   nop
/* 011F34 01DBDC34 8800A2AF */  sw          $2, 0x88($29)
/* 011F38 01DBDC38 0B000224 */  addiu       $2, $0, 0xB
/* 011F3C 01DBDC3C 8C00A2AF */  sw          $2, 0x8C($29)
/* 011F40 01DBDC40 9000A0AF */  sw          $0, 0x90($29)
/* 011F44 01DBDC44 948B848F */  lw          $4, -0x746C($28)
/* 011F48 01DBDC48 DE01023C */  lui         $2, %hi(LIT_478__3)
/* 011F4C 01DBDC4C A8ED4524 */  addiu       $5, $2, %lo(LIT_478__3)
/* 011F50 01DBDC50 28360070 */  paddub      $6, $0, $0
/* 011F54 01DBDC54 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011F58 01DBDC58 00000000 */   nop
/* 011F5C 01DBDC5C 9400A2AF */  sw          $2, 0x94($29)
/* 011F60 01DBDC60 0B000224 */  addiu       $2, $0, 0xB
/* 011F64 01DBDC64 9800A2AF */  sw          $2, 0x98($29)
/* 011F68 01DBDC68 9C00A0AF */  sw          $0, 0x9C($29)
/* 011F6C 01DBDC6C 948B848F */  lw          $4, -0x746C($28)
/* 011F70 01DBDC70 DE01023C */  lui         $2, %hi(LIT_595__4)
/* 011F74 01DBDC74 E8F04524 */  addiu       $5, $2, %lo(LIT_595__4)
/* 011F78 01DBDC78 28360070 */  paddub      $6, $0, $0
/* 011F7C 01DBDC7C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011F80 01DBDC80 00000000 */   nop
/* 011F84 01DBDC84 A000A2AF */  sw          $2, 0xA0($29)
/* 011F88 01DBDC88 11000224 */  addiu       $2, $0, 0x11
/* 011F8C 01DBDC8C A400A2AF */  sw          $2, 0xA4($29)
/* 011F90 01DBDC90 A800A0AF */  sw          $0, 0xA8($29)
/* 011F94 01DBDC94 948B848F */  lw          $4, -0x746C($28)
/* 011F98 01DBDC98 DE01023C */  lui         $2, %hi(LIT_596__5)
/* 011F9C 01DBDC9C F8F04524 */  addiu       $5, $2, %lo(LIT_596__5)
/* 011FA0 01DBDCA0 28360070 */  paddub      $6, $0, $0
/* 011FA4 01DBDCA4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011FA8 01DBDCA8 00000000 */   nop
/* 011FAC 01DBDCAC AC00A2AF */  sw          $2, 0xAC($29)
/* 011FB0 01DBDCB0 11000224 */  addiu       $2, $0, 0x11
/* 011FB4 01DBDCB4 B000A2AF */  sw          $2, 0xB0($29)
/* 011FB8 01DBDCB8 B400A0AF */  sw          $0, 0xB4($29)
/* 011FBC 01DBDCBC B800A0AF */  sw          $0, 0xB8($29)
/* 011FC0 01DBDCC0 C701023C */  lui         $2, %hi(TexManager)
/* 011FC4 01DBDCC4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011FC8 01DBDCC8 FFFF0524 */  addiu       $5, $0, -0x1
/* 011FCC 01DBDCCC 1000A627 */  addiu       $6, $29, 0x10
/* 011FD0 01DBDCD0 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 011FD4 01DBDCD4 00000000 */   nop
/* 011FD8 01DBDCD8 DE01013C */  lui         $1, %hi(CScript__2 + 0x20)
/* 011FDC 01DBDCDC 201B20AC */  sw          $0, %lo(CScript__2 + 0x20)($1)
/* 011FE0 01DBDCE0 0000BF7B */  lq          $31, 0x0($29)
/* 011FE4 01DBDCE4 D000BD27 */  addiu       $29, $29, 0xD0
/* 011FE8 01DBDCE8 0800E003 */  jr          $31
/* 011FEC 01DBDCEC 00000000 */   nop
