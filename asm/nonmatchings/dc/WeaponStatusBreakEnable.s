.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponStatusBreakEnable__FP11WEAPON_HAVE
/* 10CF30 0020CE30 04008014 */  bnez       $4, .L0020CE44
/* 10CF34 0020CE34 00000000 */   nop
/* 10CF38 0020CE38 28160070 */  paddub     $2, $0, $0
/* 10CF3C 0020CE3C 07000010 */  b          .L0020CE5C
/* 10CF40 0020CE40 00000000 */   nop
.L0020CE44:
/* 10CF44 0020CE44 28160070 */  paddub     $2, $0, $0
/* 10CF48 0020CE48 02008384 */  lh         $3, 0x2($4)
/* 10CF4C 0020CE4C 05006328 */  slti       $3, $3, 0x5
/* 10CF50 0020CE50 02006014 */  bnez       $3, .L0020CE5C
/* 10CF54 0020CE54 00000000 */   nop
/* 10CF58 0020CE58 01000224 */  addiu      $2, $0, 0x1
.L0020CE5C:
/* 10CF5C 0020CE5C 0800E003 */  jr         $31
/* 10CF60 0020CE60 00000000 */   nop
/* 10CF64 0020CE64 00000000 */  nop
/* 10CF68 0020CE68 00000000 */  nop
/* 10CF6C 0020CE6C 00000000 */  nop
