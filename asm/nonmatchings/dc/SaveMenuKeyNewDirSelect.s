.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyNewDirSelect__Fv
/* 121F40 00221E40 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 121F44 00221E44 0000BF7F */  sq         $31, 0x0($sp)
/* 121F48 00221E48 CC01023C */  lui        $2, %hi(GamePad)
/* 121F4C 00221E4C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 121F50 00221E50 40000524 */  addiu      $5, $0, 0x40
/* 121F54 00221E54 1CAE040C */  jal        Down__8CGamePadFi
/* 121F58 00221E58 00000000 */   nop
/* 121F5C 00221E5C 0F004010 */  beqz       $2, .L00221E9C
/* 121F60 00221E60 00000000 */   nop
/* 121F64 00221E64 DB01023C */  lui        $2, %hi(McAccess)
/* 121F68 00221E68 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 121F6C 00221E6C 282E0070 */  paddub     $5, $0, $0
/* 121F70 00221E70 E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 121F74 00221E74 00000000 */   nop
/* 121F78 00221E78 0F000224 */  addiu      $2, $0, 0xF
/* 121F7C 00221E7C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121F80 00221E80 D48A22AC */  sw         $2, -0x752C($at)
/* 121F84 00221E84 01000424 */  addiu      $4, $0, 0x1
/* 121F88 00221E88 BCB3080C */  jal        ComMenuSePlay__Fi
/* 121F8C 00221E8C 00000000 */   nop
/* 121F90 00221E90 01000224 */  addiu      $2, $0, 0x1
/* 121F94 00221E94 18000010 */  b          .L00221EF8
/* 121F98 00221E98 00000000 */   nop
.L00221E9C:
/* 121F9C 00221E9C CC01023C */  lui        $2, %hi(GamePad)
/* 121FA0 00221EA0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 121FA4 00221EA4 20000524 */  addiu      $5, $0, 0x20
/* 121FA8 00221EA8 1CAE040C */  jal        Down__8CGamePadFi
/* 121FAC 00221EAC 00000000 */   nop
/* 121FB0 00221EB0 10004010 */  beqz       $2, .L00221EF4
/* 121FB4 00221EB4 00000000 */   nop
/* 121FB8 00221EB8 03000224 */  addiu      $2, $0, 0x3
/* 121FBC 00221EBC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121FC0 00221EC0 D48A22AC */  sw         $2, -0x752C($at)
/* 121FC4 00221EC4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121FC8 00221EC8 8082228C */  lw         $2, -0x7D80($at)
/* 121FCC 00221ECC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121FD0 00221ED0 DC8A22AC */  sw         $2, -0x7524($at)
/* 121FD4 00221ED4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121FD8 00221ED8 F88A20AC */  sw         $0, -0x7508($at)
/* 121FDC 00221EDC 02000424 */  addiu      $4, $0, 0x2
/* 121FE0 00221EE0 BCB3080C */  jal        ComMenuSePlay__Fi
/* 121FE4 00221EE4 00000000 */   nop
/* 121FE8 00221EE8 01000224 */  addiu      $2, $0, 0x1
/* 121FEC 00221EEC 02000010 */  b          .L00221EF8
/* 121FF0 00221EF0 00000000 */   nop
.L00221EF4:
/* 121FF4 00221EF4 01000224 */  addiu      $2, $0, 0x1
.L00221EF8:
/* 121FF8 00221EF8 0000BF7B */  lq         $31, 0x0($sp)
/* 121FFC 00221EFC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 122000 00221F00 0800E003 */  jr         $31
/* 122004 00221F04 00000000 */   nop
/* 122008 00221F08 00000000 */  nop
/* 12200C 00221F0C 00000000 */  nop
