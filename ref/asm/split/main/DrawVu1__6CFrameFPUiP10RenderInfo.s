.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawVu1__6CFrameFPUiP10RenderInfo
/* 02A2A0 0012A1A0 28160070 */  paddub      $2, $0, $0
/* 02A2A4 0012A1A4 0800E003 */  jr          $31
/* 02A2A8 0012A1A8 00000000 */   nop
/* 02A2AC 0012A1AC 00000000 */  nop
