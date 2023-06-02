.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRotY__9CMapPartsFv
/* 9A9B0 0019A8B0 F800828C */  lw         $2, 0xF8($4)
/* 9A9B4 0019A8B4 0800E003 */  jr         $31
/* 9A9B8 0019A8B8 00000000 */   nop
/* 9A9BC 0019A8BC 00000000 */  nop
