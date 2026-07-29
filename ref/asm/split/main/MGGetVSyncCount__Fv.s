.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGGetVSyncCount__Fv
/* 02C310 0012C210 108C828F */  lw          $2, -0x73F0($28)
/* 02C314 0012C214 0800E003 */  jr          $31
/* 02C318 0012C218 00000000 */   nop
/* 02C31C 0012C21C 00000000 */  nop
