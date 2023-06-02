.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetAcceleration__7CObjectF11CVector3_f_
/* 56E20 00156D20 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 56E24 00156D24 1000A627 */  addiu      $6, $sp, 0x10
/* 56E28 00156D28 0000A378 */  lq         $3, 0x0($5)
/* 56E2C 00156D2C 0000C37C */  sq         $3, 0x0($6)
/* 56E30 00156D30 0000A527 */  addiu      $5, $sp, 0x0
/* 56E34 00156D34 0000C378 */  lq         $3, 0x0($6)
/* 56E38 00156D38 0000A37C */  sq         $3, 0x0($5)
/* 56E3C 00156D3C 0000C378 */  lq         $3, 0x0($6)
/* 56E40 00156D40 3000837C */  sq         $3, 0x30($4)
/* 56E44 00156D44 2000BD27 */  addiu      $sp, $sp, 0x20
/* 56E48 00156D48 0800E003 */  jr         $31
/* 56E4C 00156D4C 00000000 */   nop
