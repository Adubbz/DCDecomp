.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetReference__6CFrameFP6CFrame
/* 28280 00128180 0400A010 */  beqz       $5, .L00128194
/* 28284 00128184 00000000 */   nop
/* 28288 00128188 100185AC */  sw         $5, 0x110($4)
/* 2828C 0012818C 01000324 */  addiu      $3, $0, 0x1
/* 28290 00128190 140183AC */  sw         $3, 0x114($4)
.L00128194:
/* 28294 00128194 0800E003 */  jr         $31
/* 28298 00128198 00000000 */   nop
/* 2829C 0012819C 00000000 */  nop
