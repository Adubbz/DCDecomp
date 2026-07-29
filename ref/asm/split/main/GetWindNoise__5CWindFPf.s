.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetWindNoise__5CWindFPf
/* 03B5F0 0013B4F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 03B5F4 0013B4F4 0000BF7F */  sq          $31, 0x0($29)
/* 03B5F8 0013B4F8 28168070 */  paddub      $2, $4, $0
/* 03B5FC 0013B4FC 200081C4 */  lwc1        $f1, 0x20($4)
/* 03B600 0013B500 000080C4 */  lwc1        $f0, 0x0($4)
/* 03B604 0013B504 020B0046 */  mul.s       $f12, $f1, $f0
/* 03B608 0013B508 2826A070 */  paddub      $4, $5, $0
/* 03B60C 0013B50C 10004524 */  addiu       $5, $2, 0x10
/* 03B610 0013B510 FA85040C */  jal         sceVu0ScaleVector
/* 03B614 0013B514 00000000 */   nop
/* 03B618 0013B518 0000BF7B */  lq          $31, 0x0($29)
/* 03B61C 0013B51C 1000BD27 */  addiu       $29, $29, 0x10
/* 03B620 0013B520 0800E003 */  jr          $31
/* 03B624 0013B524 00000000 */   nop
/* 03B628 0013B528 00000000 */  nop
/* 03B62C 0013B52C 00000000 */  nop
