.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotAcceleration__7CObjectF11CVector3_f_
/* 56F50 00156E50 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 56F54 00156E54 1000A627 */  addiu      $6, $sp, 0x10
/* 56F58 00156E58 0000A378 */  lq         $3, 0x0($5)
/* 56F5C 00156E5C 0000C37C */  sq         $3, 0x0($6)
/* 56F60 00156E60 0000A527 */  addiu      $5, $sp, 0x0
/* 56F64 00156E64 0000C378 */  lq         $3, 0x0($6)
/* 56F68 00156E68 0000A37C */  sq         $3, 0x0($5)
/* 56F6C 00156E6C 0000C378 */  lq         $3, 0x0($6)
/* 56F70 00156E70 8000837C */  sq         $3, 0x80($4)
/* 56F74 00156E74 2000BD27 */  addiu      $sp, $sp, 0x20
/* 56F78 00156E78 0800E003 */  jr         $31
/* 56F7C 00156E7C 00000000 */   nop
