.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel KeyLock__8CGamePadFi
/* 02B6E0 0012B5E0 5C0485AC */  sw          $5, 0x45C($4)
/* 02B6E4 0012B5E4 0800E003 */  jr          $31
/* 02B6E8 0012B5E8 00000000 */   nop
/* 02B6EC 0012B5EC 00000000 */  nop
