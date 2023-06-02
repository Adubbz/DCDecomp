.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMSIn_ATick
/* 1F2E8 0011F1E8 0800E003 */  jr         $31
/* 1F2EC 0011F1EC 2D100000 */   daddu     $2, $0, $0
