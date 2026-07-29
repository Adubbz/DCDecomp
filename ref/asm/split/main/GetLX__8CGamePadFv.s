.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetLX__8CGamePadFv
/* 02B410 0012B310 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02B414 0012B314 0000BF7F */  sq          $31, 0x0($29)
/* 02B418 0012B318 0C00848C */  lw          $4, 0xC($4)
/* 02B41C 0012B31C 8CAC040C */  jal         AxisCalibration__Fi
/* 02B420 0012B320 00000000 */   nop
/* 02B424 0012B324 0000BF7B */  lq          $31, 0x0($29)
/* 02B428 0012B328 1000BD27 */  addiu       $29, $29, 0x10
/* 02B42C 0012B32C 0800E003 */  jr          $31
/* 02B430 0012B330 00000000 */   nop
/* 02B434 0012B334 00000000 */  nop
/* 02B438 0012B338 00000000 */  nop
/* 02B43C 0012B33C 00000000 */  nop
