.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VibrationEnable__8CGamePadFi
/* 2BAB0 0012B9B0 640485AC */  sw         $5, 0x464($4)
/* 2BAB4 0012B9B4 0800E003 */  jr         $31
/* 2BAB8 0012B9B8 00000000 */   nop
/* 2BABC 0012B9BC 00000000 */  nop
