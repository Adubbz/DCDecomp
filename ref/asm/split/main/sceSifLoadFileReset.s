.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifLoadFileReset
/* 018D50 00118C50 F0FFBD27 */  addiu       $29, $29, -0x10
/* 018D54 00118C54 2500023C */  lui         $2, %hi(_bind_check)
/* 018D58 00118C58 FFFF0324 */  addiu       $3, $0, -0x1
/* 018D5C 00118C5C 2B00043C */  lui         $4, %hi(_lfversion)
/* 018D60 00118C60 0000BFFF */  sd          $31, 0x0($29)
/* 018D64 00118C64 A8858424 */  addiu       $4, $4, %lo(_lfversion)
/* 018D68 00118C68 200A43AC */  sw          $3, %lo(_bind_check)($2)
/* 018D6C 00118C6C 2D280000 */  daddu       $5, $0, $0
/* 018D70 00118C70 5A0D040C */  jal         memset
/* 018D74 00118C74 04000624 */   addiu      $6, $0, 0x4
/* 018D78 00118C78 0000BFDF */  ld          $31, 0x0($29)
/* 018D7C 00118C7C 2D100000 */  daddu       $2, $0, $0
/* 018D80 00118C80 0800E003 */  jr          $31
/* 018D84 00118C84 1000BD27 */   addiu      $29, $29, 0x10
