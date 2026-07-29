.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel iDisableIntc
/* 015138 00115038 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01513C 0011503C 0000BFFF */  sd          $31, 0x0($29)
/* 015140 00115040 3450040C */  jal         _iDisableIntc
/* 015144 00115044 00000000 */   nop
/* 015148 00115048 0F000000 */  sync
/* 01514C 0011504C 0000BFDF */  ld          $31, 0x0($29)
/* 015150 00115050 0800E003 */  jr          $31
/* 015154 00115054 1000BD27 */   addiu      $29, $29, 0x10
