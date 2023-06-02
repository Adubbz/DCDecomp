.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetLX2__8CGamePadFv
/* 2B4D0 0012B3D0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2B4D4 0012B3D4 0000BF7F */  sq         $31, 0x0($sp)
/* 2B4D8 0012B3D8 5800848C */  lw         $4, 0x58($4)
/* 2B4DC 0012B3DC 8CAC040C */  jal        AxisCalibration__Fi
/* 2B4E0 0012B3E0 00000000 */   nop
/* 2B4E4 0012B3E4 0000BF7B */  lq         $31, 0x0($sp)
/* 2B4E8 0012B3E8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2B4EC 0012B3EC 0800E003 */  jr         $31
/* 2B4F0 0012B3F0 00000000 */   nop
/* 2B4F4 0012B3F4 00000000 */  nop
/* 2B4F8 0012B3F8 00000000 */  nop
/* 2B4FC 0012B3FC 00000000 */  nop
