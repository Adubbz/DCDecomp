.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sceFsDbChk
/* 17D18 00117C18 0800E003 */  jr         $31
/* 17D1C 00117C1C 2D100000 */   daddu     $2, $0, $0
