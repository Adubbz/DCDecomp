.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMoment__7CObjectF11CVector3_f_
/* 56E80 00156D80 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 56E84 00156D84 1000A627 */  addiu      $6, $sp, 0x10
/* 56E88 00156D88 0000A378 */  lq         $3, 0x0($5)
/* 56E8C 00156D8C 0000C37C */  sq         $3, 0x0($6)
/* 56E90 00156D90 0000A527 */  addiu      $5, $sp, 0x0
/* 56E94 00156D94 0000C378 */  lq         $3, 0x0($6)
/* 56E98 00156D98 0000A37C */  sq         $3, 0x0($5)
/* 56E9C 00156D9C 0000C378 */  lq         $3, 0x0($6)
/* 56EA0 00156DA0 5000837C */  sq         $3, 0x50($4)
/* 56EA4 00156DA4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 56EA8 00156DA8 0800E003 */  jr         $31
/* 56EAC 00156DAC 00000000 */   nop
