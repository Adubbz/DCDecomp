.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtlDrawOption__Fv
/* 0F5930 001F5830 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0F5934 001F5834 0000BF7F */  sq          $31, 0x0($29)
/* 0F5938 001F5838 AC7C080C */  jal         DrawMenuOption__Fv
/* 0F593C 001F583C 00000000 */   nop
/* 0F5940 001F5840 28260070 */  paddub      $4, $0, $0
/* 0F5944 001F5844 046F050C */  jal         setbilinear__Fi
/* 0F5948 001F5848 00000000 */   nop
/* 0F594C 001F584C 0000BF7B */  lq          $31, 0x0($29)
/* 0F5950 001F5850 1000BD27 */  addiu       $29, $29, 0x10
/* 0F5954 001F5854 0800E003 */  jr          $31
/* 0F5958 001F5858 00000000 */   nop
/* 0F595C 001F585C 00000000 */  nop
