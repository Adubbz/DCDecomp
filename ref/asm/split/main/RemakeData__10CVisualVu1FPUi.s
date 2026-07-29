.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel RemakeData__10CVisualVu1FPUi
/* 034CB0 00134BB0 28160070 */  paddub      $2, $0, $0
/* 034CB4 00134BB4 0800E003 */  jr          $31
/* 034CB8 00134BB8 00000000 */   nop
/* 034CBC 00134BBC 00000000 */  nop
