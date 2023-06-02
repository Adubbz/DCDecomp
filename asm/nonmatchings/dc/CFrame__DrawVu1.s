.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawVu1__6CFrameFPUiP10RenderInfo
/* 2A2A0 0012A1A0 28160070 */  paddub     $2, $0, $0
/* 2A2A4 0012A1A4 0800E003 */  jr         $31
/* 2A2A8 0012A1A8 00000000 */   nop
/* 2A2AC 0012A1AC 00000000 */  nop
