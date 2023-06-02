.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel run_event_check__Fv
/* 77FC0 00177EC0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 77FC4 00177EC4 0000BF7F */  sq         $31, 0x0($sp)
/* 77FC8 00177EC8 8890828F */  lw         $2, -0x6F78($gp)
/* 77FCC 00177ECC 12004014 */  bnez       $2, .L00177F18
/* 77FD0 00177ED0 00000000 */   nop
/* 77FD4 00177ED4 9890828F */  lw         $2, -0x6F68($gp)
/* 77FD8 00177ED8 0F004014 */  bnez       $2, .L00177F18
/* 77FDC 00177EDC 00000000 */   nop
/* 77FE0 00177EE0 A890828F */  lw         $2, -0x6F58($gp)
/* 77FE4 00177EE4 0C004014 */  bnez       $2, .L00177F18
/* 77FE8 00177EE8 00000000 */   nop
/* 77FEC 00177EEC A490828F */  lw         $2, -0x6F5C($gp)
/* 77FF0 00177EF0 09004014 */  bnez       $2, .L00177F18
/* 77FF4 00177EF4 00000000 */   nop
/* 77FF8 00177EF8 90CD050C */  jal        EdSystemMesCheck__Fv
/* 77FFC 00177EFC 00000000 */   nop
/* 78000 00177F00 05004014 */  bnez       $2, .L00177F18
/* 78004 00177F04 00000000 */   nop
/* 78008 00177F08 84CC050C */  jal        EdCheckItemOver__Fv
/* 7800C 00177F0C 00000000 */   nop
/* 78010 00177F10 04004010 */  beqz       $2, .L00177F24
/* 78014 00177F14 00000000 */   nop
.L00177F18:
/* 78018 00177F18 01000224 */  addiu      $2, $0, 0x1
/* 7801C 00177F1C 02000010 */  b          .L00177F28
/* 78020 00177F20 00000000 */   nop
.L00177F24:
/* 78024 00177F24 28160070 */  paddub     $2, $0, $0
.L00177F28:
/* 78028 00177F28 0000BF7B */  lq         $31, 0x0($sp)
/* 7802C 00177F2C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 78030 00177F30 0800E003 */  jr         $31
/* 78034 00177F34 00000000 */   nop
/* 78038 00177F38 00000000 */  nop
/* 7803C 00177F3C 00000000 */  nop
