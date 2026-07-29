.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRY__8CGamePadFv
/* 02B3E0 0012B2E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02B3E4 0012B2E4 0000BF7F */  sq          $31, 0x0($29)
/* 02B3E8 0012B2E8 1000848C */  lw          $4, 0x10($4)
/* 02B3EC 0012B2EC 8CAC040C */  jal         AxisCalibration__Fi
/* 02B3F0 0012B2F0 00000000 */   nop
/* 02B3F4 0012B2F4 0000BF7B */  lq          $31, 0x0($29)
/* 02B3F8 0012B2F8 1000BD27 */  addiu       $29, $29, 0x10
/* 02B3FC 0012B2FC 0800E003 */  jr          $31
/* 02B400 0012B300 00000000 */   nop
/* 02B404 0012B304 00000000 */  nop
/* 02B408 0012B308 00000000 */  nop
/* 02B40C 0012B30C 00000000 */  nop
