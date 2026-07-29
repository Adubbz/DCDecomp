.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel scePadGetState
/* 01FC60 0011FB60 2D308000 */  daddu       $6, $4, $0
/* 01FC64 0011FB64 70000324 */  addiu       $3, $0, 0x70
/* 01FC68 0011FB68 1C000424 */  addiu       $4, $0, 0x1C
/* 01FC6C 0011FB6C 1818C370 */  mult1       $3, $6, $3
/* 01FC70 0011FB70 1820A400 */  mult        $4, $5, $4
/* 01FC74 0011FB74 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01FC78 0011FB78 2B00023C */  lui         $2, %hi(PadInfo)
/* 01FC7C 0011FB7C 0000BFFF */  sd          $31, 0x0($29)
/* 01FC80 0011FB80 909C4224 */  addiu       $2, $2, %lo(PadInfo)
/* 01FC84 0011FB84 21208300 */  addu        $4, $4, $3
/* 01FC88 0011FB88 21104400 */  addu        $2, $2, $4
/* 01FC8C 0011FB8C 1000438C */  lw          $3, 0x10($2)
/* 01FC90 0011FB90 0E006010 */  beqz        $3, .L0011FBCC
/* 01FC94 0011FB94 63000224 */   addiu      $2, $0, 0x63
/* 01FC98 0011FB98 8C7E040C */  jal         scePadGetDmaStr
/* 01FC9C 0011FB9C 2D20C000 */   daddu      $4, $6, $0
/* 01FCA0 0011FBA0 2D204000 */  daddu       $4, $2, $0
/* 01FCA4 0011FBA4 06000324 */  addiu       $3, $0, 0x6
/* 01FCA8 0011FBA8 70008290 */  lbu         $2, 0x70($4)
/* 01FCAC 0011FBAC 08004314 */  bne         $2, $3, .L0011FBD0
/* 01FCB0 0011FBB0 0000BFDF */   ld         $31, 0x0($29)
/* 01FCB4 0011FBB4 71008390 */  lbu         $3, 0x71($4)
/* 01FCB8 0011FBB8 02000224 */  addiu       $2, $0, 0x2
/* 01FCBC 0011FBBC 04006254 */  bnel        $3, $2, .L0011FBD0
/* 01FCC0 0011FBC0 70008290 */   lbu        $2, 0x70($4)
/* 01FCC4 0011FBC4 02000010 */  b           .L0011FBD0
/* 01FCC8 0011FBC8 05000224 */   addiu      $2, $0, 0x5
.L0011FBCC:
/* 01FCCC 0011FBCC 0000BFDF */  ld          $31, 0x0($29)
.L0011FBD0:
/* 01FCD0 0011FBD0 0800E003 */  jr          $31
/* 01FCD4 0011FBD4 1000BD27 */   addiu      $29, $29, 0x10
