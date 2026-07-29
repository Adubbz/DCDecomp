.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetMapNo__9CEditAreaFv
/* 0701F0 001700F0 0400828C */  lw          $2, 0x4($4)
/* 0701F4 001700F4 0800E003 */  jr          $31
/* 0701F8 001700F8 00000000 */   nop
/* 0701FC 001700FC 00000000 */  nop
