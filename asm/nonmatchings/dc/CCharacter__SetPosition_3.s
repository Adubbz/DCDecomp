.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPosition__10CCharacterF11CVector3_f_
/* 39210 00139110 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 39214 00139114 0000BF7F */  sq         $31, 0x0($sp)
/* 39218 00139118 1000A327 */  addiu      $3, $sp, 0x10
/* 3921C 0013911C 0000A278 */  lq         $2, 0x0($5)
/* 39220 00139120 0000627C */  sq         $2, 0x0($3)
/* 39224 00139124 1000ACC7 */  lwc1       $f12, 0x10($sp)
/* 39228 00139128 1400ADC7 */  lwc1       $f13, 0x14($sp)
/* 3922C 0013912C 1800AEC7 */  lwc1       $f14, 0x18($sp)
/* 39230 00139130 ECE3040C */  jal        SetPosition__10CCharacterFfff
/* 39234 00139134 00000000 */   nop
/* 39238 00139138 0000BF7B */  lq         $31, 0x0($sp)
/* 3923C 0013913C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 39240 00139140 0800E003 */  jr         $31
/* 39244 00139144 00000000 */   nop
/* 39248 00139148 00000000 */  nop
/* 3924C 0013914C 00000000 */  nop
