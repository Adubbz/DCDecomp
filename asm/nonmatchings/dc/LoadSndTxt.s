.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadSndTxt__Fv
/* 40F90 00140E90 58C4BD27 */  addiu      $sp, $sp, -0x3BA8
/* 40F94 00140E94 0880BD27 */  addiu      $sp, $sp, -0x7FF8
/* 40F98 00140E98 1000BF7F */  sq         $31, 0x10($sp)
/* 40F9C 00140E9C 0000B07F */  sq         $16, 0x0($sp)
/* 40FA0 00140EA0 2000B027 */  addiu      $16, $sp, 0x20
/* 40FA4 00140EA4 3F000332 */  andi       $3, $16, 0x3F
/* 40FA8 00140EA8 04000106 */  bgez       $16, .L00140EBC
/* 40FAC 00140EAC 00000000 */   nop
/* 40FB0 00140EB0 02006010 */  beqz       $3, .L00140EBC
/* 40FB4 00140EB4 00000000 */   nop
/* 40FB8 00140EB8 C0FF6324 */  addiu      $3, $3, -0x40
.L00140EBC:
/* 40FBC 00140EBC 04006010 */  beqz       $3, .L00140ED0
/* 40FC0 00140EC0 00000000 */   nop
/* 40FC4 00140EC4 40000224 */  addiu      $2, $0, 0x40
/* 40FC8 00140EC8 23104300 */  subu       $2, $2, $3
/* 40FCC 00140ECC 21800202 */  addu       $16, $16, $2
.L00140ED0:
/* 40FD0 00140ED0 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 40FD4 00140ED4 2A00023C */  lui        $2, %hi(_657)
/* 40FD8 00140ED8 60934524 */  addiu      $5, $2, %lo(_657)
/* 40FDC 00140EDC 28360072 */  paddub     $6, $16, $0
/* 40FE0 00140EE0 F012050C */  jal        LoadSeInf__6CSoundFPcPUi
/* 40FE4 00140EE4 00000000 */   nop
/* 40FE8 00140EE8 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 40FEC 00140EEC 2A00023C */  lui        $2, %hi(_658)
/* 40FF0 00140EF0 80934524 */  addiu      $5, $2, %lo(_658)
/* 40FF4 00140EF4 28360072 */  paddub     $6, $16, $0
/* 40FF8 00140EF8 A412050C */  jal        LoadSqInf__6CSoundFPcPUi
/* 40FFC 00140EFC 00000000 */   nop
/* 41000 00140F00 E464050C */  jal        SndInitSeTable__Fv
/* 41004 00140F04 00000000 */   nop
/* 41008 00140F08 1000BF7B */  lq         $31, 0x10($sp)
/* 4100C 00140F0C 0000B07B */  lq         $16, 0x0($sp)
/* 41010 00140F10 A83BBD27 */  addiu      $sp, $sp, 0x3BA8
/* 41014 00140F14 F87FBD27 */  addiu      $sp, $sp, 0x7FF8
/* 41018 00140F18 0800E003 */  jr         $31
/* 4101C 00140F1C 00000000 */   nop
