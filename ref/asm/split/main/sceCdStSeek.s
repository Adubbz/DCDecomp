.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdStSeek
/* 00C048 0010BF48 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00C04C 0010BF4C 2500083C */  lui         $8, %hi(dum_mode)
/* 00C050 0010BF50 0000BFFF */  sd          $31, 0x0($29)
/* 00C054 0010BF54 C8020825 */  addiu       $8, $8, %lo(dum_mode)
/* 00C058 0010BF58 2D280000 */  daddu       $5, $0, $0
/* 00C05C 0010BF5C 2D300000 */  daddu       $6, $0, $0
/* 00C060 0010BF60 8430040C */  jal         sceCdStream
/* 00C064 0010BF64 04000724 */   addiu      $7, $0, 0x4
/* 00C068 0010BF68 0000BFDF */  ld          $31, 0x0($29)
/* 00C06C 0010BF6C 0800E003 */  jr          $31
/* 00C070 0010BF70 1000BD27 */   addiu      $29, $29, 0x10
/* 00C074 0010BF74 00000000 */  nop
