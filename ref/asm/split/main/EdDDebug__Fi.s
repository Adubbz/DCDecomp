.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdDDebug__Fi
/* 070350 00170250 348780AF */  sw          $0, -0x78CC($28)
/* 070354 00170254 0800E003 */  jr          $31
/* 070358 00170258 00000000 */   nop
/* 07035C 0017025C 00000000 */  nop
