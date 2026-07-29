.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AtoraMoveDraw__Fv
/* 1121D0 002120D0 0800E003 */  jr          $31
/* 1121D4 002120D4 00000000 */   nop
/* 1121D8 002120D8 00000000 */  nop
/* 1121DC 002120DC 00000000 */  nop
