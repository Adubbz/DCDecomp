.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetGridFrame__9CEditAreaFP9CFrameVu1
/* 070210 00170110 282085AC */  sw          $5, 0x2028($4)
/* 070214 00170114 0800E003 */  jr          $31
/* 070218 00170118 00000000 */   nop
/* 07021C 0017011C 00000000 */  nop
