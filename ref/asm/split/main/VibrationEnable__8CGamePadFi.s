.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel VibrationEnable__8CGamePadFi
/* 02BAB0 0012B9B0 640485AC */  sw          $5, 0x464($4)
/* 02BAB4 0012B9B4 0800E003 */  jr          $31
/* 02BAB8 0012B9B8 00000000 */   nop
/* 02BABC 0012B9BC 00000000 */  nop
