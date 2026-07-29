.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel open
/* 014A38 00114938 F0FFBD27 */  addiu       $29, $29, -0x10
/* 014A3C 0011493C 0000BFFF */  sd          $31, 0x0($29)
/* 014A40 00114940 D805040C */  jal         __errno
/* 014A44 00114944 00000000 */   nop
/* 014A48 00114948 05000324 */  addiu       $3, $0, 0x5
/* 014A4C 0011494C 0000BFDF */  ld          $31, 0x0($29)
/* 014A50 00114950 000043AC */  sw          $3, 0x0($2)
/* 014A54 00114954 FFFF0224 */  addiu       $2, $0, -0x1
/* 014A58 00114958 0800E003 */  jr          $31
/* 014A5C 0011495C 1000BD27 */   addiu      $29, $29, 0x10
