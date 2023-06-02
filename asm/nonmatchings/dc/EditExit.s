.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditExit__Fv
/* 77E40 00177D40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 77E44 00177D44 0000BF7F */  sq         $31, 0x0($sp)
/* 77E48 00177D48 FCDE050C */  jal        EditSave__Fv
/* 77E4C 00177D4C 00000000 */   nop
/* 77E50 00177D50 00688044 */  mtc1       $0, $f13
/* 77E54 00177D54 00000000 */  nop
/* 77E58 00177D58 866B0046 */  mov.s      $f14, $f13
/* 77E5C 00177D5C 0043023C */  lui        $2, (0x43000000 >> 16)
/* 77E60 00177D60 00788244 */  mtc1       $2, $f15
/* 77E64 00177D64 066B0046 */  mov.s      $f12, $f13
/* 77E68 00177D68 24B8040C */  jal        MGSetBGColor__Fffff
/* 77E6C 00177D6C 00000000 */   nop
/* 77E70 00177D70 D4DD050C */  jal        StopAllSound__Fv
/* 77E74 00177D74 00000000 */   nop
.L00177D78:
/* 77E78 00177D78 8CFB040C */  jal        ReadBGSync__Fv
/* 77E7C 00177D7C 00000000 */   nop
/* 77E80 00177D80 FDFF4014 */  bnez       $2, .L00177D78
/* 77E84 00177D84 00000000 */   nop
/* 77E88 00177D88 646C050C */  jal        SndAmbientStop__Fv
/* 77E8C 00177D8C 00000000 */   nop
/* 77E90 00177D90 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 77E94 00177D94 00D2228C */  lw         $2, -0x2E00($at)
/* 77E98 00177D98 07004010 */  beqz       $2, .L00177DB8
/* 77E9C 00177D9C 00000000 */   nop
/* 77EA0 00177DA0 1467050C */  jal        SndBgmFadeOutStop__Fv
/* 77EA4 00177DA4 00000000 */   nop
/* 77EA8 00177DA8 E866050C */  jal        SndBgmStop__Fv
/* 77EAC 00177DAC 00000000 */   nop
/* 77EB0 00177DB0 4C66050C */  jal        SndBgmInit__Fv
/* 77EB4 00177DB4 00000000 */   nop
.L00177DB8:
/* 77EB8 00177DB8 B4C6050C */  jal        EdStopSoundSrc__Fv
/* 77EBC 00177DBC 00000000 */   nop
/* 77EC0 00177DC0 1469050C */  jal        SndStopAllSe__Fv
/* 77EC4 00177DC4 00000000 */   nop
/* 77EC8 00177DC8 D464050C */  jal        SndStep__Fv
/* 77ECC 00177DCC 00000000 */   nop
/* 77ED0 00177DD0 28260070 */  paddub     $4, $0, $0
/* 77ED4 00177DD4 9CB8040C */  jal        MGScisioringForce__Fi
/* 77ED8 00177DD8 00000000 */   nop
/* 77EDC 00177DDC CC01023C */  lui        $2, %hi(GamePad)
/* 77EE0 00177DE0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 77EE4 00177DE4 282E0070 */  paddub     $5, $0, $0
/* 77EE8 00177DE8 78AD040C */  jal        KeyLock__8CGamePadFi
/* 77EEC 00177DEC 00000000 */   nop
/* 77EF0 00177DF0 1000A427 */  addiu      $4, $sp, 0x10
/* 77EF4 00177DF4 0826060C */  jal        EdGetFadeColor__FPf
/* 77EF8 00177DF8 00000000 */   nop
/* 77EFC 00177DFC 1000A427 */  addiu      $4, $sp, 0x10
/* 77F00 00177E00 84B8040C */  jal        MGSetBGColor__FPf
/* 77F04 00177E04 00000000 */   nop
/* 77F08 00177E08 0000BF7B */  lq         $31, 0x0($sp)
/* 77F0C 00177E0C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 77F10 00177E10 0800E003 */  jr         $31
/* 77F14 00177E14 00000000 */   nop
/* 77F18 00177E18 00000000 */  nop
/* 77F1C 00177E1C 00000000 */  nop
