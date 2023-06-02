.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CB_DelayTh
/* 9698 00109598 D4500408 */  j          iSignalSema
/* 969C 0010959C 2D20C000 */   daddu     $4, $6, $0
