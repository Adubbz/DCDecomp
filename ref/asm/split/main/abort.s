.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel abort
/* 0002A8 001001A8 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0002AC 001001AC 0000BFFF */  sd          $31, 0x0($29)
.L001001B0:
/* 0002B0 001001B0 B213040C */  jal         raise
/* 0002B4 001001B4 06000424 */   addiu      $4, $0, 0x6
/* 0002B8 001001B8 2C00040C */  jal         _exit
/* 0002BC 001001BC 01000424 */   addiu      $4, $0, 0x1
/* 0002C0 001001C0 FBFF0010 */  b           .L001001B0
/* 0002C4 001001C4 00000000 */   nop
