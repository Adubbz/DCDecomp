.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel getpid
/* 014B40 00114A40 0800E003 */  jr          $31
/* 014B44 00114A44 01000224 */   addiu      $2, $0, 0x1
