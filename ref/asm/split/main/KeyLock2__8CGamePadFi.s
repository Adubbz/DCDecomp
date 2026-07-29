.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel KeyLock2__8CGamePadFi
/* 02B6F0 0012B5F0 600485AC */  sw          $5, 0x460($4)
/* 02B6F4 0012B5F4 0800E003 */  jr          $31
/* 02B6F8 0012B5F8 00000000 */   nop
/* 02B6FC 0012B5FC 00000000 */  nop
