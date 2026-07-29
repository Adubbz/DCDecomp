.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDmaCallback
/* 00CF68 0010CE68 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00CF6C 0010CE6C 2900043C */  lui         $4, %hi(RO_00297448)
/* 00CF70 0010CE70 0000BFFF */  sd          $31, 0x0($29)
/* 00CF74 0010CE74 A611040C */  jal         printf
/* 00CF78 0010CE78 48748424 */   addiu      $4, $4, %lo(RO_00297448)
/* 00CF7C 0010CE7C 0000BFDF */  ld          $31, 0x0($29)
/* 00CF80 0010CE80 2D100000 */  daddu       $2, $0, $0
/* 00CF84 0010CE84 0800E003 */  jr          $31
/* 00CF88 0010CE88 1000BD27 */   addiu      $29, $29, 0x10
/* 00CF8C 0010CE8C 00000000 */  nop
