.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetLX2__8CGamePadFv
/* 02B4D0 0012B3D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02B4D4 0012B3D4 0000BF7F */  sq          $31, 0x0($29)
/* 02B4D8 0012B3D8 5800848C */  lw          $4, 0x58($4)
/* 02B4DC 0012B3DC 8CAC040C */  jal         AxisCalibration__Fi
/* 02B4E0 0012B3E0 00000000 */   nop
/* 02B4E4 0012B3E4 0000BF7B */  lq          $31, 0x0($29)
/* 02B4E8 0012B3E8 1000BD27 */  addiu       $29, $29, 0x10
/* 02B4EC 0012B3EC 0800E003 */  jr          $31
/* 02B4F0 0012B3F0 00000000 */   nop
/* 02B4F4 0012B3F4 00000000 */  nop
/* 02B4F8 0012B3F8 00000000 */  nop
/* 02B4FC 0012B3FC 00000000 */  nop
