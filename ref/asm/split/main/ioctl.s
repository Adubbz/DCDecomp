.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ioctl
/* 014A68 00114968 0800E003 */  jr          $31
/* 014A6C 0011496C FFFF0224 */   addiu      $2, $0, -0x1
