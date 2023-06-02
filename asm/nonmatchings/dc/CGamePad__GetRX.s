.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRX__8CGamePadFv
/* 2B3B0 0012B2B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2B3B4 0012B2B4 0000BF7F */  sq         $31, 0x0($sp)
/* 2B3B8 0012B2B8 1400848C */  lw         $4, 0x14($4)
/* 2B3BC 0012B2BC 8CAC040C */  jal        AxisCalibration__Fi
/* 2B3C0 0012B2C0 00000000 */   nop
/* 2B3C4 0012B2C4 0000BF7B */  lq         $31, 0x0($sp)
/* 2B3C8 0012B2C8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2B3CC 0012B2CC 0800E003 */  jr         $31
/* 2B3D0 0012B2D0 00000000 */   nop
/* 2B3D4 0012B2D4 00000000 */  nop
/* 2B3D8 0012B2D8 00000000 */  nop
/* 2B3DC 0012B2DC 00000000 */  nop
