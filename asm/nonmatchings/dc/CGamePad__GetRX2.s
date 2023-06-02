.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRX2__8CGamePadFv
/* 2B470 0012B370 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2B474 0012B374 0000BF7F */  sq         $31, 0x0($sp)
/* 2B478 0012B378 6000848C */  lw         $4, 0x60($4)
/* 2B47C 0012B37C 8CAC040C */  jal        AxisCalibration__Fi
/* 2B480 0012B380 00000000 */   nop
/* 2B484 0012B384 0000BF7B */  lq         $31, 0x0($sp)
/* 2B488 0012B388 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2B48C 0012B38C 0800E003 */  jr         $31
/* 2B490 0012B390 00000000 */   nop
/* 2B494 0012B394 00000000 */  nop
/* 2B498 0012B398 00000000 */  nop
/* 2B49C 0012B39C 00000000 */  nop
