.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetVisual__9CFrameVu1FP10CVisualVu1
/* 02A310 0012A210 600285AC */  sw          $5, 0x260($4)
/* 02A314 0012A214 0800E003 */  jr          $31
/* 02A318 0012A218 00000000 */   nop
/* 02A31C 0012A21C 00000000 */  nop
