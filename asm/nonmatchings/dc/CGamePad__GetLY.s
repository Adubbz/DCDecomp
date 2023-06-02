.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetLY__8CGamePadFv
/* 2B440 0012B340 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2B444 0012B344 0000BF7F */  sq         $31, 0x0($sp)
/* 2B448 0012B348 0800848C */  lw         $4, 0x8($4)
/* 2B44C 0012B34C 8CAC040C */  jal        AxisCalibration__Fi
/* 2B450 0012B350 00000000 */   nop
/* 2B454 0012B354 0000BF7B */  lq         $31, 0x0($sp)
/* 2B458 0012B358 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2B45C 0012B35C 0800E003 */  jr         $31
/* 2B460 0012B360 00000000 */   nop
/* 2B464 0012B364 00000000 */  nop
/* 2B468 0012B368 00000000 */  nop
/* 2B46C 0012B36C 00000000 */  nop
