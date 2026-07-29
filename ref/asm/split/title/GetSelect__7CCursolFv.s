.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetSelect__7CCursolFv
/* 0293C0 01DD50C0 1C00828C */  lw          $2, 0x1C($4)
/* 0293C4 01DD50C4 0800E003 */  jr          $31
/* 0293C8 01DD50C8 00000000 */   nop
/* 0293CC 01DD50CC 00000000 */  nop
