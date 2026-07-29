.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetLY2__8CGamePadFv
/* 02B500 0012B400 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02B504 0012B404 0000BF7F */  sq          $31, 0x0($29)
/* 02B508 0012B408 5400848C */  lw          $4, 0x54($4)
/* 02B50C 0012B40C 8CAC040C */  jal         AxisCalibration__Fi
/* 02B510 0012B410 00000000 */   nop
/* 02B514 0012B414 0000BF7B */  lq          $31, 0x0($29)
/* 02B518 0012B418 1000BD27 */  addiu       $29, $29, 0x10
/* 02B51C 0012B41C 0800E003 */  jr          $31
/* 02B520 0012B420 00000000 */   nop
/* 02B524 0012B424 00000000 */  nop
/* 02B528 0012B428 00000000 */  nop
/* 02B52C 0012B42C 00000000 */  nop
