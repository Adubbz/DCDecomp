.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdSyncS
/* 00AF38 0010AE38 E0FFBD27 */  addiu       $29, $29, -0x20
/* 00AF3C 0010AE3C 1000BFFF */  sd          $31, 0x10($29)
/* 00AF40 0010AE40 0F008014 */  bnez        $4, .L0010AE80
/* 00AF44 0010AE44 0000B0FF */   sd         $16, 0x0($29)
/* 00AF48 0010AE48 2500023C */  lui         $2, %hi(CD_debug)
/* 00AF4C 0010AE4C 7002438C */  lw          $3, %lo(CD_debug)($2)
/* 00AF50 0010AE50 03006018 */  blez        $3, .L0010AE60
/* 00AF54 0010AE54 2900043C */   lui        $4, %hi(RO_00297140)
/* 00AF58 0010AE58 A611040C */  jal         printf
/* 00AF5C 0010AE5C 40718424 */   addiu      $4, $4, %lo(RO_00297140)
.L0010AE60:
/* 00AF60 0010AE60 2A00103C */  lui         $16, %hi(cdrc)
/* 00AF64 0010AE64 00000000 */  nop
.L0010AE68:
/* 00AF68 0010AE68 A65D040C */  jal         sceSifCheckStatRpc
/* 00AF6C 0010AE6C 604D0426 */   addiu      $4, $16, %lo(cdrc)
/* 00AF70 0010AE70 FDFF4014 */  bnez        $2, .L0010AE68
/* 00AF74 0010AE74 2D100000 */   daddu      $2, $0, $0
/* 00AF78 0010AE78 05000010 */  b           .L0010AE90
/* 00AF7C 0010AE7C 1000BFDF */   ld         $31, 0x10($29)
.L0010AE80:
/* 00AF80 0010AE80 2A00043C */  lui         $4, %hi(cdrc)
/* 00AF84 0010AE84 A65D040C */  jal         sceSifCheckStatRpc
/* 00AF88 0010AE88 604D8424 */   addiu      $4, $4, %lo(cdrc)
/* 00AF8C 0010AE8C 1000BFDF */  ld          $31, 0x10($29)
.L0010AE90:
/* 00AF90 0010AE90 0000B0DF */  ld          $16, 0x0($29)
/* 00AF94 0010AE94 0800E003 */  jr          $31
/* 00AF98 0010AE98 2000BD27 */   addiu      $29, $29, 0x20
/* 00AF9C 0010AE9C 00000000 */  nop
