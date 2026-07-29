.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __unwinding_cleanup
/* 00DEF0 0010DDF0 0800E003 */  jr          $31
/* 00DEF4 0010DDF4 00000000 */   nop
