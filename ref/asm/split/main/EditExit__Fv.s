.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EditExit__Fv
/* 077E40 00177D40 E0FFBD27 */  addiu       $29, $29, -0x20
/* 077E44 00177D44 0000BF7F */  sq          $31, 0x0($29)
/* 077E48 00177D48 FCDE050C */  jal         EditSave__Fv
/* 077E4C 00177D4C 00000000 */   nop
/* 077E50 00177D50 00688044 */  mtc1        $0, $f13
/* 077E54 00177D54 00000000 */  nop
/* 077E58 00177D58 866B0046 */  mov.s       $f14, $f13
/* 077E5C 00177D5C 0043023C */  lui         $2, (0x43000000 >> 16)
/* 077E60 00177D60 00788244 */  mtc1        $2, $f15
/* 077E64 00177D64 066B0046 */  mov.s       $f12, $f13
/* 077E68 00177D68 24B8040C */  jal         MGSetBGColor__Fffff
/* 077E6C 00177D6C 00000000 */   nop
/* 077E70 00177D70 D4DD050C */  jal         StopAllSound__Fv
/* 077E74 00177D74 00000000 */   nop
.L00177D78:
/* 077E78 00177D78 8CFB040C */  jal         ReadBGSync__Fv
/* 077E7C 00177D7C 00000000 */   nop
/* 077E80 00177D80 FDFF4014 */  bnez        $2, .L00177D78
/* 077E84 00177D84 00000000 */   nop
/* 077E88 00177D88 646C050C */  jal         SndAmbientStop__Fv
/* 077E8C 00177D8C 00000000 */   nop
/* 077E90 00177D90 D401013C */  lui         $1, %hi(EdEventInfo + 0x30)
/* 077E94 00177D94 00D2228C */  lw          $2, %lo(EdEventInfo + 0x30)($1)
/* 077E98 00177D98 07004010 */  beqz        $2, .L00177DB8
/* 077E9C 00177D9C 00000000 */   nop
/* 077EA0 00177DA0 1467050C */  jal         SndBgmFadeOutStop__Fv
/* 077EA4 00177DA4 00000000 */   nop
/* 077EA8 00177DA8 E866050C */  jal         SndBgmStop__Fv
/* 077EAC 00177DAC 00000000 */   nop
/* 077EB0 00177DB0 4C66050C */  jal         SndBgmInit__Fv
/* 077EB4 00177DB4 00000000 */   nop
.L00177DB8:
/* 077EB8 00177DB8 B4C6050C */  jal         EdStopSoundSrc__Fv
/* 077EBC 00177DBC 00000000 */   nop
/* 077EC0 00177DC0 1469050C */  jal         SndStopAllSe__Fv
/* 077EC4 00177DC4 00000000 */   nop
/* 077EC8 00177DC8 D464050C */  jal         SndStep__Fv
/* 077ECC 00177DCC 00000000 */   nop
/* 077ED0 00177DD0 28260070 */  paddub      $4, $0, $0
/* 077ED4 00177DD4 9CB8040C */  jal         MGScisioringForce__Fi
/* 077ED8 00177DD8 00000000 */   nop
/* 077EDC 00177DDC CC01023C */  lui         $2, %hi(GamePad)
/* 077EE0 00177DE0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 077EE4 00177DE4 282E0070 */  paddub      $5, $0, $0
/* 077EE8 00177DE8 78AD040C */  jal         KeyLock__8CGamePadFi
/* 077EEC 00177DEC 00000000 */   nop
/* 077EF0 00177DF0 1000A427 */  addiu       $4, $29, 0x10
/* 077EF4 00177DF4 0826060C */  jal         EdGetFadeColor__FPf
/* 077EF8 00177DF8 00000000 */   nop
/* 077EFC 00177DFC 1000A427 */  addiu       $4, $29, 0x10
/* 077F00 00177E00 84B8040C */  jal         MGSetBGColor__FPf
/* 077F04 00177E04 00000000 */   nop
/* 077F08 00177E08 0000BF7B */  lq          $31, 0x0($29)
/* 077F0C 00177E0C 2000BD27 */  addiu       $29, $29, 0x20
/* 077F10 00177E10 0800E003 */  jr          $31
/* 077F14 00177E14 00000000 */   nop
/* 077F18 00177E18 00000000 */  nop
/* 077F1C 00177E1C 00000000 */  nop
