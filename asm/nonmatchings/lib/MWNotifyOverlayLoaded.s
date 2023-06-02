.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MWNotifyOverlayLoaded
/* 22F70 00122E70 0800E003 */  jr         $31
/* 22F74 00122E74 00000000 */   nop
/* 22F78 00122E78 00000000 */  nop
/* 22F7C 00122E7C 00000000 */  nop
