.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_001436E0
/* 0437E0 001436E0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0437E4 001436E4 1000BF7F */  sq          $31, 0x10($29)
/* 0437E8 001436E8 0000B07F */  sq          $16, 0x0($29)
/* 0437EC 001436EC 28868070 */  paddub      $16, $4, $0
/* 0437F0 001436F0 940D050C */  jal         func_00143650
/* 0437F4 001436F4 00000000 */   nop
/* 0437F8 001436F8 2A00023C */  lui         $2, %hi(__vt__8CHitMark)
/* 0437FC 001436FC 20174224 */  addiu       $2, $2, %lo(__vt__8CHitMark)
/* 043800 00143700 A00002AE */  sw          $2, 0xA0($16)
/* 043804 00143704 28160072 */  paddub      $2, $16, $0
/* 043808 00143708 1000BF7B */  lq          $31, 0x10($29)
/* 04380C 0014370C 0000B07B */  lq          $16, 0x0($29)
/* 043810 00143710 2000BD27 */  addiu       $29, $29, 0x20
/* 043814 00143714 0800E003 */  jr          $31
/* 043818 00143718 00000000 */   nop
/* 04381C 0014371C 00000000 */  nop
