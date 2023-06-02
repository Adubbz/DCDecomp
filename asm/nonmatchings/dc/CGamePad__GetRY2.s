.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRY2__8CGamePadFv
/* 2B4A0 0012B3A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2B4A4 0012B3A4 0000BF7F */  sq         $31, 0x0($sp)
/* 2B4A8 0012B3A8 5C00848C */  lw         $4, 0x5C($4)
/* 2B4AC 0012B3AC 8CAC040C */  jal        AxisCalibration__Fi
/* 2B4B0 0012B3B0 00000000 */   nop
/* 2B4B4 0012B3B4 0000BF7B */  lq         $31, 0x0($sp)
/* 2B4B8 0012B3B8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2B4BC 0012B3BC 0800E003 */  jr         $31
/* 2B4C0 0012B3C0 00000000 */   nop
/* 2B4C4 0012B3C4 00000000 */  nop
/* 2B4C8 0012B3C8 00000000 */  nop
/* 2B4CC 0012B3CC 00000000 */  nop
