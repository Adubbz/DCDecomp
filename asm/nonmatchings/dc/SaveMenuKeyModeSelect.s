.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyModeSelect__Fv
/* 120F40 00220E40 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 120F44 00220E44 0000BF7F */  sq         $31, 0x0($sp)
/* 120F48 00220E48 CC01023C */  lui        $2, %hi(GamePad)
/* 120F4C 00220E4C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 120F50 00220E50 00500524 */  addiu      $5, $0, 0x5000
/* 120F54 00220E54 1CAE040C */  jal        Down__8CGamePadFi
/* 120F58 00220E58 00000000 */   nop
/* 120F5C 00220E5C 0C004010 */  beqz       $2, .L00220E90
/* 120F60 00220E60 00000000 */   nop
/* 120F64 00220E64 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120F68 00220E68 DC8A228C */  lw         $2, -0x7524($at)
/* 120F6C 00220E6C 05004010 */  beqz       $2, .L00220E84
/* 120F70 00220E70 00000000 */   nop
/* 120F74 00220E74 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120F78 00220E78 DC8A20AC */  sw         $0, -0x7524($at)
/* 120F7C 00220E7C 04000010 */  b          .L00220E90
/* 120F80 00220E80 00000000 */   nop
.L00220E84:
/* 120F84 00220E84 01000224 */  addiu      $2, $0, 0x1
/* 120F88 00220E88 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120F8C 00220E8C DC8A22AC */  sw         $2, -0x7524($at)
.L00220E90:
/* 120F90 00220E90 CC01023C */  lui        $2, %hi(GamePad)
/* 120F94 00220E94 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 120F98 00220E98 40000524 */  addiu      $5, $0, 0x40
/* 120F9C 00220E9C 1CAE040C */  jal        Down__8CGamePadFi
/* 120FA0 00220EA0 00000000 */   nop
/* 120FA4 00220EA4 18004010 */  beqz       $2, .L00220F08
/* 120FA8 00220EA8 00000000 */   nop
/* 120FAC 00220EAC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120FB0 00220EB0 DC8A228C */  lw         $2, -0x7524($at)
/* 120FB4 00220EB4 06004010 */  beqz       $2, .L00220ED0
/* 120FB8 00220EB8 00000000 */   nop
/* 120FBC 00220EBC 01000224 */  addiu      $2, $0, 0x1
/* 120FC0 00220EC0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120FC4 00220EC4 EC8A22AC */  sw         $2, -0x7514($at)
/* 120FC8 00220EC8 04000010 */  b          .L00220EDC
/* 120FCC 00220ECC 00000000 */   nop
.L00220ED0:
/* 120FD0 00220ED0 02000224 */  addiu      $2, $0, 0x2
/* 120FD4 00220ED4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120FD8 00220ED8 EC8A22AC */  sw         $2, -0x7514($at)
.L00220EDC:
/* 120FDC 00220EDC 03000224 */  addiu      $2, $0, 0x3
/* 120FE0 00220EE0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120FE4 00220EE4 D48A22AC */  sw         $2, -0x752C($at)
/* 120FE8 00220EE8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 120FEC 00220EEC DC8A20AC */  sw         $0, -0x7524($at)
/* 120FF0 00220EF0 01000424 */  addiu      $4, $0, 0x1
/* 120FF4 00220EF4 BCB3080C */  jal        ComMenuSePlay__Fi
/* 120FF8 00220EF8 00000000 */   nop
/* 120FFC 00220EFC 01000224 */  addiu      $2, $0, 0x1
/* 121000 00220F00 16000010 */  b          .L00220F5C
/* 121004 00220F04 00000000 */   nop
.L00220F08:
/* 121008 00220F08 CC01023C */  lui        $2, %hi(GamePad)
/* 12100C 00220F0C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 121010 00220F10 20000524 */  addiu      $5, $0, 0x20
/* 121014 00220F14 1CAE040C */  jal        Down__8CGamePadFi
/* 121018 00220F18 00000000 */   nop
/* 12101C 00220F1C 0E004010 */  beqz       $2, .L00220F58
/* 121020 00220F20 00000000 */   nop
/* 121024 00220F24 01000224 */  addiu      $2, $0, 0x1
/* 121028 00220F28 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12102C 00220F2C D48A22AC */  sw         $2, -0x752C($at)
/* 121030 00220F30 607F080C */  jal        ExitSaveSelect__Fv
/* 121034 00220F34 00000000 */   nop
/* 121038 00220F38 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12103C 00220F3C F88A20AC */  sw         $0, -0x7508($at)
/* 121040 00220F40 02000424 */  addiu      $4, $0, 0x2
/* 121044 00220F44 BCB3080C */  jal        ComMenuSePlay__Fi
/* 121048 00220F48 00000000 */   nop
/* 12104C 00220F4C 01000224 */  addiu      $2, $0, 0x1
/* 121050 00220F50 02000010 */  b          .L00220F5C
/* 121054 00220F54 00000000 */   nop
.L00220F58:
/* 121058 00220F58 01000224 */  addiu      $2, $0, 0x1
.L00220F5C:
/* 12105C 00220F5C 0000BF7B */  lq         $31, 0x0($sp)
/* 121060 00220F60 1000BD27 */  addiu      $sp, $sp, 0x10
/* 121064 00220F64 0800E003 */  jr         $31
/* 121068 00220F68 00000000 */   nop
/* 12106C 00220F6C 00000000 */  nop
