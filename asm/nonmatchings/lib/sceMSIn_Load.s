.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMSIn_Load
/* 1F2F0 0011F1F0 0800E003 */  jr         $31
/* 1F2F4 0011F1F4 2D100000 */   daddu     $2, $0, $0
