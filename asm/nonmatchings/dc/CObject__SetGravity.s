.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetGravity__7CObjectF11CVector3_f_
/* 56E50 00156D50 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 56E54 00156D54 1000A627 */  addiu      $6, $sp, 0x10
/* 56E58 00156D58 0000A378 */  lq         $3, 0x0($5)
/* 56E5C 00156D5C 0000C37C */  sq         $3, 0x0($6)
/* 56E60 00156D60 0000A527 */  addiu      $5, $sp, 0x0
/* 56E64 00156D64 0000C378 */  lq         $3, 0x0($6)
/* 56E68 00156D68 0000A37C */  sq         $3, 0x0($5)
/* 56E6C 00156D6C 0000C378 */  lq         $3, 0x0($6)
/* 56E70 00156D70 4000837C */  sq         $3, 0x40($4)
/* 56E74 00156D74 2000BD27 */  addiu      $sp, $sp, 0x20
/* 56E78 00156D78 0800E003 */  jr         $31
/* 56E7C 00156D7C 00000000 */   nop
