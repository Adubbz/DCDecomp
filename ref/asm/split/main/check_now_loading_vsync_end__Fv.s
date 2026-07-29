.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel check_now_loading_vsync_end__Fv
/* 054060 00153F60 E88D828F */  lw          $2, -0x7218($28)
/* 054064 00153F64 0800E003 */  jr          $31
/* 054068 00153F68 00000000 */   nop
/* 05406C 00153F6C 00000000 */  nop
