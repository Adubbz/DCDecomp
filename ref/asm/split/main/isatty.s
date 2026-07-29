.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel isatty
/* 014B20 00114A20 0800E003 */  jr          $31
/* 014B24 00114A24 01000224 */   addiu      $2, $0, 0x1
