.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RemakeData__10CVisualVu1FPUi
/* 34CB0 00134BB0 28160070 */  paddub     $2, $0, $0
/* 34CB4 00134BB4 0800E003 */  jr         $31
/* 34CB8 00134BB8 00000000 */   nop
/* 34CBC 00134BBC 00000000 */  nop
