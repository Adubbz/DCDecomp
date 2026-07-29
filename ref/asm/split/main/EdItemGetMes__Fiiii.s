.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdItemGetMes__Fiiii
/* 073B70 00173A70 F0FFBD27 */  addiu       $29, $29, -0x10
/* 073B74 00173A74 0000BF7F */  sq          $31, 0x0($29)
/* 073B78 00173A78 282EC070 */  paddub      $5, $6, $0
/* 073B7C 00173A7C 2836E070 */  paddub      $6, $7, $0
/* 073B80 00173A80 01000724 */  addiu       $7, $0, 0x1
/* 073B84 00173A84 A480050C */  jal         ItemGetMes__Fiiii
/* 073B88 00173A88 00000000 */   nop
/* 073B8C 00173A8C 0000BF7B */  lq          $31, 0x0($29)
/* 073B90 00173A90 1000BD27 */  addiu       $29, $29, 0x10
/* 073B94 00173A94 0800E003 */  jr          $31
/* 073B98 00173A98 00000000 */   nop
/* 073B9C 00173A9C 00000000 */  nop
