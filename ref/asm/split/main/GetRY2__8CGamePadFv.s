.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRY2__8CGamePadFv
/* 02B4A0 0012B3A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02B4A4 0012B3A4 0000BF7F */  sq          $31, 0x0($29)
/* 02B4A8 0012B3A8 5C00848C */  lw          $4, 0x5C($4)
/* 02B4AC 0012B3AC 8CAC040C */  jal         AxisCalibration__Fi
/* 02B4B0 0012B3B0 00000000 */   nop
/* 02B4B4 0012B3B4 0000BF7B */  lq          $31, 0x0($29)
/* 02B4B8 0012B3B8 1000BD27 */  addiu       $29, $29, 0x10
/* 02B4BC 0012B3BC 0800E003 */  jr          $31
/* 02B4C0 0012B3C0 00000000 */   nop
/* 02B4C4 0012B3C4 00000000 */  nop
/* 02B4C8 0012B3C8 00000000 */  nop
/* 02B4CC 0012B3CC 00000000 */  nop
