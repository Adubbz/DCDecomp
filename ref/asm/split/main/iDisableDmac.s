.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel iDisableDmac
/* 015178 00115078 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01517C 0011507C 0000BFFF */  sd          $31, 0x0($29)
/* 015180 00115080 3C50040C */  jal         _iDisableDmac
/* 015184 00115084 00000000 */   nop
/* 015188 00115088 0F000000 */  sync
/* 01518C 0011508C 0000BFDF */  ld          $31, 0x0($29)
/* 015190 00115090 0800E003 */  jr          $31
/* 015194 00115094 1000BD27 */   addiu      $29, $29, 0x10
