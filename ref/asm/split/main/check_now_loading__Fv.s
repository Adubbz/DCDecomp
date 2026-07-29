.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel check_now_loading__Fv
/* 054040 00153F40 E086828F */  lw          $2, -0x7920($28)
/* 054044 00153F44 0800E003 */  jr          $31
/* 054048 00153F48 00000000 */   nop
/* 05404C 00153F4C 00000000 */  nop
