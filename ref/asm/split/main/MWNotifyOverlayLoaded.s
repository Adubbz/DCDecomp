.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MWNotifyOverlayLoaded
/* 022F70 00122E70 0800E003 */  jr          $31
/* 022F74 00122E74 00000000 */   nop
/* 022F78 00122E78 00000000 */  nop
/* 022F7C 00122E7C 00000000 */  nop
