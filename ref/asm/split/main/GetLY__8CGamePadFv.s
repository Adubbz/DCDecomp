.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetLY__8CGamePadFv
/* 02B440 0012B340 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02B444 0012B344 0000BF7F */  sq          $31, 0x0($29)
/* 02B448 0012B348 0800848C */  lw          $4, 0x8($4)
/* 02B44C 0012B34C 8CAC040C */  jal         AxisCalibration__Fi
/* 02B450 0012B350 00000000 */   nop
/* 02B454 0012B354 0000BF7B */  lq          $31, 0x0($29)
/* 02B458 0012B358 1000BD27 */  addiu       $29, $29, 0x10
/* 02B45C 0012B35C 0800E003 */  jr          $31
/* 02B460 0012B360 00000000 */   nop
/* 02B464 0012B364 00000000 */  nop
/* 02B468 0012B368 00000000 */  nop
/* 02B46C 0012B36C 00000000 */  nop
