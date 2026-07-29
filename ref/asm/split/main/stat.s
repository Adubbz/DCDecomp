.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel stat
/* 014B70 00114A70 F0FFBD27 */  addiu       $29, $29, -0x10
/* 014B74 00114A74 0000BFFF */  sd          $31, 0x0($29)
/* 014B78 00114A78 D805040C */  jal         __errno
/* 014B7C 00114A7C 00000000 */   nop
/* 014B80 00114A80 05000324 */  addiu       $3, $0, 0x5
/* 014B84 00114A84 0000BFDF */  ld          $31, 0x0($29)
/* 014B88 00114A88 000043AC */  sw          $3, 0x0($2)
/* 014B8C 00114A8C FFFF0224 */  addiu       $2, $0, -0x1
/* 014B90 00114A90 0800E003 */  jr          $31
/* 014B94 00114A94 1000BD27 */   addiu      $29, $29, 0x10
