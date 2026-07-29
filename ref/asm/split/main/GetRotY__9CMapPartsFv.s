.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRotY__9CMapPartsFv
/* 09A9B0 0019A8B0 F800828C */  lw          $2, 0xF8($4)
/* 09A9B4 0019A8B4 0800E003 */  jr          $31
/* 09A9B8 0019A8B8 00000000 */   nop
/* 09A9BC 0019A8BC 00000000 */  nop
