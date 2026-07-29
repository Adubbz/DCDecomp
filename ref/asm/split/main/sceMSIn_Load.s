.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMSIn_Load
/* 01F2F0 0011F1F0 0800E003 */  jr          $31
/* 01F2F4 0011F1F4 2D100000 */   daddu      $2, $0, $0
