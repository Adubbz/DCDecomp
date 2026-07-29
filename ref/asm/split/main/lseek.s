.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel lseek
/* 014A70 00114970 0800E003 */  jr          $31
/* 014A74 00114974 FFFF0224 */   addiu      $2, $0, -0x1
