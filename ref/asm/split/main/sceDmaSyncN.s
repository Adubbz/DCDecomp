.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDmaSyncN
/* 00CEF0 0010CDF0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00CEF4 0010CDF4 2900043C */  lui         $4, %hi(RO_002973F0)
/* 00CEF8 0010CDF8 0000BFFF */  sd          $31, 0x0($29)
/* 00CEFC 0010CDFC A611040C */  jal         printf
/* 00CF00 0010CE00 F0738424 */   addiu      $4, $4, %lo(RO_002973F0)
/* 00CF04 0010CE04 0000BFDF */  ld          $31, 0x0($29)
/* 00CF08 0010CE08 2D100000 */  daddu       $2, $0, $0
/* 00CF0C 0010CE0C 0800E003 */  jr          $31
/* 00CF10 0010CE10 1000BD27 */   addiu      $29, $29, 0x10
/* 00CF14 0010CE14 00000000 */  nop
