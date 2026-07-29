.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel fstat
/* 014B28 00114A28 00200224 */  addiu       $2, $0, 0x2000
/* 014B2C 00114A2C 4800A0FC */  sd          $0, 0x48($5)
/* 014B30 00114A30 0400A2AC */  sw          $2, 0x4($5)
/* 014B34 00114A34 0800E003 */  jr          $31
/* 014B38 00114A38 2D100000 */   daddu      $2, $0, $0
/* 014B3C 00114A3C 00000000 */  nop
