.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LeaveFood__5CFishFv
/* 1404D0 002403D0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1404D4 002403D4 0000BF7F */  sq         $31, 0x0($sp)
/* 1404D8 002403D8 8800828C */  lw         $2, 0x88($4)
/* 1404DC 002403DC 04004104 */  bgez       $2, .L002403F0
/* 1404E0 002403E0 00000000 */   nop
/* 1404E4 002403E4 01000224 */  addiu      $2, $0, 0x1
/* 1404E8 002403E8 07000010 */  b          .L00240408
/* 1404EC 002403EC 00000000 */   nop
.L002403F0:
/* 1404F0 002403F0 80808CC7 */  lwc1       $f12, -0x7F80($gp)
/* 1404F4 002403F4 1400090C */  jal        rand_check__Ff
/* 1404F8 002403F8 00000000 */   nop
/* 1404FC 002403FC 01000324 */  addiu      $3, $0, 0x1
/* 140500 00240400 0A180200 */  movz       $3, $0, $2
/* 140504 00240404 28166070 */  paddub     $2, $3, $0
.L00240408:
/* 140508 00240408 0000BF7B */  lq         $31, 0x0($sp)
/* 14050C 0024040C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 140510 00240410 0800E003 */  jr         $31
/* 140514 00240414 00000000 */   nop
/* 140518 00240418 00000000 */  nop
/* 14051C 0024041C 00000000 */  nop