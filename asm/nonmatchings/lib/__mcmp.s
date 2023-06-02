.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __mcmp
/* 4098 00103F98 1000A38C */  lw         $3, 0x10($5)
/* 409C 00103F9C 1000828C */  lw         $2, 0x10($4)
/* 40A0 00103FA0 23104300 */  subu       $2, $2, $3
/* 40A4 00103FA4 07004010 */  beqz       $2, .L00103FC4
/* 40A8 00103FA8 80180300 */   sll       $3, $3, 2
/* 40AC 00103FAC 0800E003 */  jr         $31
/* 40B0 00103FB0 00000000 */   nop
.L00103FB4:
/* 40B4 00103FB4 01000324 */  addiu      $3, $0, 0x1
/* 40B8 00103FB8 FFFF0224 */  addiu      $2, $0, -0x1
/* 40BC 00103FBC 0800E003 */  jr         $31
/* 40C0 00103FC0 0A106400 */   movz      $2, $3, $4
.L00103FC4:
/* 40C4 00103FC4 14008724 */  addiu      $7, $4, 0x14
/* 40C8 00103FC8 1400A224 */  addiu      $2, $5, 0x14
/* 40CC 00103FCC 2130E300 */  addu       $6, $7, $3
/* 40D0 00103FD0 21184300 */  addu       $3, $2, $3
/* 40D4 00103FD4 FCFFC624 */  addiu      $6, $6, -0x4
.L00103FD8:
/* 40D8 00103FD8 FCFF6324 */  addiu      $3, $3, -0x4
/* 40DC 00103FDC 0000C28C */  lw         $2, 0x0($6)
/* 40E0 00103FE0 0000648C */  lw         $4, 0x0($3)
/* 40E4 00103FE4 F3FF4454 */  bnel       $2, $4, .L00103FB4
/* 40E8 00103FE8 2B204400 */   sltu      $4, $2, $4
/* 40EC 00103FEC 2B10E600 */  sltu       $2, $7, $6
/* 40F0 00103FF0 F9FF4014 */  bnez       $2, .L00103FD8
/* 40F4 00103FF4 FCFFC624 */   addiu     $6, $6, -0x4
/* 40F8 00103FF8 0800E003 */  jr         $31
/* 40FC 00103FFC 2D100000 */   daddu     $2, $0, $0
