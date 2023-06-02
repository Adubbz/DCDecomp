.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyArart__Fv
/* 121E10 00221D10 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 121E14 00221D14 0000BF7F */  sq         $31, 0x0($sp)
/* 121E18 00221D18 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121E1C 00221D1C F08A238C */  lw         $3, -0x7510($at)
/* 121E20 00221D20 02000224 */  addiu      $2, $0, 0x2
/* 121E24 00221D24 1B006210 */  beq        $3, $2, .L00221D94
/* 121E28 00221D28 00000000 */   nop
/* 121E2C 00221D2C 01000224 */  addiu      $2, $0, 0x1
/* 121E30 00221D30 05006210 */  beq        $3, $2, .L00221D48
/* 121E34 00221D34 00000000 */   nop
/* 121E38 00221D38 3A006010 */  beqz       $3, .L00221E24
/* 121E3C 00221D3C 00000000 */   nop
/* 121E40 00221D40 27000010 */  b          .L00221DE0
/* 121E44 00221D44 00000000 */   nop
.L00221D48:
/* 121E48 00221D48 CC01023C */  lui        $2, %hi(GamePad)
/* 121E4C 00221D4C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 121E50 00221D50 60000524 */  addiu      $5, $0, 0x60
/* 121E54 00221D54 1CAE040C */  jal        Down__8CGamePadFi
/* 121E58 00221D58 00000000 */   nop
/* 121E5C 00221D5C 31004010 */  beqz       $2, .L00221E24
/* 121E60 00221D60 00000000 */   nop
/* 121E64 00221D64 03000224 */  addiu      $2, $0, 0x3
/* 121E68 00221D68 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121E6C 00221D6C D48A22AC */  sw         $2, -0x752C($at)
/* 121E70 00221D70 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121E74 00221D74 8082228C */  lw         $2, -0x7D80($at)
/* 121E78 00221D78 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121E7C 00221D7C DC8A22AC */  sw         $2, -0x7524($at)
/* 121E80 00221D80 02000424 */  addiu      $4, $0, 0x2
/* 121E84 00221D84 BCB3080C */  jal        ComMenuSePlay__Fi
/* 121E88 00221D88 00000000 */   nop
/* 121E8C 00221D8C 25000010 */  b          .L00221E24
/* 121E90 00221D90 00000000 */   nop
.L00221D94:
/* 121E94 00221D94 CC01023C */  lui        $2, %hi(GamePad)
/* 121E98 00221D98 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 121E9C 00221D9C 60000524 */  addiu      $5, $0, 0x60
/* 121EA0 00221DA0 1CAE040C */  jal        Down__8CGamePadFi
/* 121EA4 00221DA4 00000000 */   nop
/* 121EA8 00221DA8 1E004010 */  beqz       $2, .L00221E24
/* 121EAC 00221DAC 00000000 */   nop
/* 121EB0 00221DB0 03000224 */  addiu      $2, $0, 0x3
/* 121EB4 00221DB4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121EB8 00221DB8 D48A22AC */  sw         $2, -0x752C($at)
/* 121EBC 00221DBC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121EC0 00221DC0 8082228C */  lw         $2, -0x7D80($at)
/* 121EC4 00221DC4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121EC8 00221DC8 DC8A22AC */  sw         $2, -0x7524($at)
/* 121ECC 00221DCC 02000424 */  addiu      $4, $0, 0x2
/* 121ED0 00221DD0 BCB3080C */  jal        ComMenuSePlay__Fi
/* 121ED4 00221DD4 00000000 */   nop
/* 121ED8 00221DD8 12000010 */  b          .L00221E24
/* 121EDC 00221DDC 00000000 */   nop
.L00221DE0:
/* 121EE0 00221DE0 CC01023C */  lui        $2, %hi(GamePad)
/* 121EE4 00221DE4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 121EE8 00221DE8 60000524 */  addiu      $5, $0, 0x60
/* 121EEC 00221DEC 1CAE040C */  jal        Down__8CGamePadFi
/* 121EF0 00221DF0 00000000 */   nop
/* 121EF4 00221DF4 0B004010 */  beqz       $2, .L00221E24
/* 121EF8 00221DF8 00000000 */   nop
/* 121EFC 00221DFC 03000224 */  addiu      $2, $0, 0x3
/* 121F00 00221E00 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121F04 00221E04 D48A22AC */  sw         $2, -0x752C($at)
/* 121F08 00221E08 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121F0C 00221E0C 8082228C */  lw         $2, -0x7D80($at)
/* 121F10 00221E10 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121F14 00221E14 DC8A22AC */  sw         $2, -0x7524($at)
/* 121F18 00221E18 02000424 */  addiu      $4, $0, 0x2
/* 121F1C 00221E1C BCB3080C */  jal        ComMenuSePlay__Fi
/* 121F20 00221E20 00000000 */   nop
.L00221E24:
/* 121F24 00221E24 01000224 */  addiu      $2, $0, 0x1
/* 121F28 00221E28 0000BF7B */  lq         $31, 0x0($sp)
/* 121F2C 00221E2C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 121F30 00221E30 0800E003 */  jr         $31
/* 121F34 00221E34 00000000 */   nop
/* 121F38 00221E38 00000000 */  nop
/* 121F3C 00221E3C 00000000 */  nop
