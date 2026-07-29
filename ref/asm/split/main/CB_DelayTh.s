.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CB_DelayTh
/* 009698 00109598 D4500408 */  j           iSignalSema
/* 00969C 0010959C 2D20C000 */   daddu      $4, $6, $0
