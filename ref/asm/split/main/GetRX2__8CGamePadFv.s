.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRX2__8CGamePadFv
/* 02B470 0012B370 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02B474 0012B374 0000BF7F */  sq          $31, 0x0($29)
/* 02B478 0012B378 6000848C */  lw          $4, 0x60($4)
/* 02B47C 0012B37C 8CAC040C */  jal         AxisCalibration__Fi
/* 02B480 0012B380 00000000 */   nop
/* 02B484 0012B384 0000BF7B */  lq          $31, 0x0($29)
/* 02B488 0012B388 1000BD27 */  addiu       $29, $29, 0x10
/* 02B48C 0012B38C 0800E003 */  jr          $31
/* 02B490 0012B390 00000000 */   nop
/* 02B494 0012B394 00000000 */  nop
/* 02B498 0012B398 00000000 */  nop
/* 02B49C 0012B39C 00000000 */  nop
