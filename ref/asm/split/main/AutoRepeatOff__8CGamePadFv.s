.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AutoRepeatOff__8CGamePadFv
/* 02B9F0 0012B8F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02B9F4 0012B8F4 0000BF7F */  sq          $31, 0x0($29)
/* 02B9F8 0012B8F8 FFFF0524 */  addiu       $5, $0, -0x1
/* 02B9FC 0012B8FC 3CAD040C */  jal         CancelAutoRepeat__8CGamePadFi
/* 02BA00 0012B900 00000000 */   nop
/* 02BA04 0012B904 0000BF7B */  lq          $31, 0x0($29)
/* 02BA08 0012B908 1000BD27 */  addiu       $29, $29, 0x10
/* 02BA0C 0012B90C 0800E003 */  jr          $31
/* 02BA10 0012B910 00000000 */   nop
/* 02BA14 0012B914 00000000 */  nop
/* 02BA18 0012B918 00000000 */  nop
/* 02BA1C 0012B91C 00000000 */  nop
