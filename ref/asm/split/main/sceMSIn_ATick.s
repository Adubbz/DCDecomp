.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMSIn_ATick
/* 01F2E8 0011F1E8 0800E003 */  jr          $31
/* 01F2EC 0011F1EC 2D100000 */   daddu      $2, $0, $0
