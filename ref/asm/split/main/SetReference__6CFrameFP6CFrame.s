.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetReference__6CFrameFP6CFrame
/* 028280 00128180 0400A010 */  beqz        $5, .L00128194
/* 028284 00128184 00000000 */   nop
/* 028288 00128188 100185AC */  sw          $5, 0x110($4)
/* 02828C 0012818C 01000324 */  addiu       $3, $0, 0x1
/* 028290 00128190 140183AC */  sw          $3, 0x114($4)
.L00128194:
/* 028294 00128194 0800E003 */  jr          $31
/* 028298 00128198 00000000 */   nop
/* 02829C 0012819C 00000000 */  nop
