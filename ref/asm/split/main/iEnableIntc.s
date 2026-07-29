.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel iEnableIntc
/* 015118 00115018 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01511C 0011501C 0000BFFF */  sd          $31, 0x0($29)
/* 015120 00115020 3050040C */  jal         _iEnableIntc
/* 015124 00115024 00000000 */   nop
/* 015128 00115028 0F000000 */  sync
/* 01512C 0011502C 0000BFDF */  ld          $31, 0x0($29)
/* 015130 00115030 0800E003 */  jr          $31
/* 015134 00115034 1000BD27 */   addiu      $29, $29, 0x10
