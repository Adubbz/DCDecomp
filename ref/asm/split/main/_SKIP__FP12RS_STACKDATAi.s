.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SKIP__FP12RS_STACKDATAi
/* 08C040 0018BF40 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08C044 0018BF44 0000BF7F */  sq          $31, 0x0($29)
/* 08C048 0018BF48 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08C04C 0018BF4C 00000000 */   nop
/* 08C050 0018BF50 409282AF */  sw          $2, -0x6DC0($28)
/* 08C054 0018BF54 01000224 */  addiu       $2, $0, 0x1
/* 08C058 0018BF58 0000BF7B */  lq          $31, 0x0($29)
/* 08C05C 0018BF5C 1000BD27 */  addiu       $29, $29, 0x10
/* 08C060 0018BF60 0800E003 */  jr          $31
/* 08C064 0018BF64 00000000 */   nop
/* 08C068 0018BF68 00000000 */  nop
/* 08C06C 0018BF6C 00000000 */  nop
