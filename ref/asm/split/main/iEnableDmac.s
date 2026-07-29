.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel iEnableDmac
/* 015158 00115058 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01515C 0011505C 0000BFFF */  sd          $31, 0x0($29)
/* 015160 00115060 3850040C */  jal         _iEnableDmac
/* 015164 00115064 00000000 */   nop
/* 015168 00115068 0F000000 */  sync
/* 01516C 0011506C 0000BFDF */  ld          $31, 0x0($29)
/* 015170 00115070 0800E003 */  jr          $31
/* 015174 00115074 1000BD27 */   addiu      $29, $29, 0x10
