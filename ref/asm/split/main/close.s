.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel close
/* 014A60 00114960 0800E003 */  jr          $31
/* 014A64 00114964 FFFF0224 */   addiu      $2, $0, -0x1
