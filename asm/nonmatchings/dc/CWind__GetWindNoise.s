.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetWindNoise__5CWindFPf
/* 3B5F0 0013B4F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 3B5F4 0013B4F4 0000BF7F */  sq         $31, 0x0($sp)
/* 3B5F8 0013B4F8 28168070 */  paddub     $2, $4, $0
/* 3B5FC 0013B4FC 200081C4 */  lwc1       $f1, 0x20($4)
/* 3B600 0013B500 000080C4 */  lwc1       $f0, 0x0($4)
/* 3B604 0013B504 020B0046 */  mul.s      $f12, $f1, $f0
/* 3B608 0013B508 2826A070 */  paddub     $4, $5, $0
/* 3B60C 0013B50C 10004524 */  addiu      $5, $2, 0x10
/* 3B610 0013B510 FA85040C */  jal        sceVu0ScaleVector
/* 3B614 0013B514 00000000 */   nop
/* 3B618 0013B518 0000BF7B */  lq         $31, 0x0($sp)
/* 3B61C 0013B51C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3B620 0013B520 0800E003 */  jr         $31
/* 3B624 0013B524 00000000 */   nop
/* 3B628 0013B528 00000000 */  nop
/* 3B62C 0013B52C 00000000 */  nop
