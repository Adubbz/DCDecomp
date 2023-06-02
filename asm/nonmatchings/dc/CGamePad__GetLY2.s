.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetLY2__8CGamePadFv
/* 2B500 0012B400 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2B504 0012B404 0000BF7F */  sq         $31, 0x0($sp)
/* 2B508 0012B408 5400848C */  lw         $4, 0x54($4)
/* 2B50C 0012B40C 8CAC040C */  jal        AxisCalibration__Fi
/* 2B510 0012B410 00000000 */   nop
/* 2B514 0012B414 0000BF7B */  lq         $31, 0x0($sp)
/* 2B518 0012B418 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2B51C 0012B41C 0800E003 */  jr         $31
/* 2B520 0012B420 00000000 */   nop
/* 2B524 0012B424 00000000 */  nop
/* 2B528 0012B428 00000000 */  nop
/* 2B52C 0012B42C 00000000 */  nop
