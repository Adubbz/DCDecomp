.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetLX__8CGamePadFv
/* 2B410 0012B310 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2B414 0012B314 0000BF7F */  sq         $31, 0x0($sp)
/* 2B418 0012B318 0C00848C */  lw         $4, 0xC($4)
/* 2B41C 0012B31C 8CAC040C */  jal        AxisCalibration__Fi
/* 2B420 0012B320 00000000 */   nop
/* 2B424 0012B324 0000BF7B */  lq         $31, 0x0($sp)
/* 2B428 0012B328 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2B42C 0012B32C 0800E003 */  jr         $31
/* 2B430 0012B330 00000000 */   nop
/* 2B434 0012B334 00000000 */  nop
/* 2B438 0012B338 00000000 */  nop
/* 2B43C 0012B33C 00000000 */  nop
