.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel kill
/* 014B48 00114A48 F0FFBD27 */  addiu       $29, $29, -0x10
/* 014B4C 00114A4C 01000224 */  addiu       $2, $0, 0x1
/* 014B50 00114A50 03008214 */  bne         $4, $2, .L00114A60
/* 014B54 00114A54 0000BFFF */   sd         $31, 0x0($29)
/* 014B58 00114A58 D04F040C */  jal         Exit
/* 014B5C 00114A5C 2D20A000 */   daddu      $4, $5, $0
.L00114A60:
/* 014B60 00114A60 0000BFDF */  ld          $31, 0x0($29)
/* 014B64 00114A64 2D100000 */  daddu       $2, $0, $0
/* 014B68 00114A68 0800E003 */  jr          $31
/* 014B6C 00114A6C 1000BD27 */   addiu      $29, $29, 0x10
