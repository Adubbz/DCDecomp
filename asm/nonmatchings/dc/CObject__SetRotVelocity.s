.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotVelocity__7CObjectF11CVector3_f_
/* 56F20 00156E20 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 56F24 00156E24 1000A627 */  addiu      $6, $sp, 0x10
/* 56F28 00156E28 0000A378 */  lq         $3, 0x0($5)
/* 56F2C 00156E2C 0000C37C */  sq         $3, 0x0($6)
/* 56F30 00156E30 0000A527 */  addiu      $5, $sp, 0x0
/* 56F34 00156E34 0000C378 */  lq         $3, 0x0($6)
/* 56F38 00156E38 0000A37C */  sq         $3, 0x0($5)
/* 56F3C 00156E3C 0000C378 */  lq         $3, 0x0($6)
/* 56F40 00156E40 7000837C */  sq         $3, 0x70($4)
/* 56F44 00156E44 2000BD27 */  addiu      $sp, $sp, 0x20
/* 56F48 00156E48 0800E003 */  jr         $31
/* 56F4C 00156E4C 00000000 */   nop
