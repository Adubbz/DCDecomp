.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetVelocity__7CObjectF11CVector3_f_
/* 56DF0 00156CF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 56DF4 00156CF4 1000A627 */  addiu      $6, $sp, 0x10
/* 56DF8 00156CF8 0000A378 */  lq         $3, 0x0($5)
/* 56DFC 00156CFC 0000C37C */  sq         $3, 0x0($6)
/* 56E00 00156D00 0000A527 */  addiu      $5, $sp, 0x0
/* 56E04 00156D04 0000C378 */  lq         $3, 0x0($6)
/* 56E08 00156D08 0000A37C */  sq         $3, 0x0($5)
/* 56E0C 00156D0C 0000C378 */  lq         $3, 0x0($6)
/* 56E10 00156D10 2000837C */  sq         $3, 0x20($4)
/* 56E14 00156D14 2000BD27 */  addiu      $sp, $sp, 0x20
/* 56E18 00156D18 0800E003 */  jr         $31
/* 56E1C 00156D1C 00000000 */   nop
