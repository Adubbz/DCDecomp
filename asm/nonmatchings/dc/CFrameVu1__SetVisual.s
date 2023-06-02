.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetVisual__9CFrameVu1FP10CVisualVu1
/* 2A310 0012A210 600285AC */  sw         $5, 0x260($4)
/* 2A314 0012A214 0800E003 */  jr         $31
/* 2A318 0012A218 00000000 */   nop
/* 2A31C 0012A21C 00000000 */  nop
