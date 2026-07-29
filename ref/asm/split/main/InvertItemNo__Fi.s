.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InvertItemNo__Fi
/* 072CB0 00172BB0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 072CB4 00172BB4 0000BF7F */  sq          $31, 0x0($29)
/* 072CB8 00172BB8 B895080C */  jal         TransWepNoNewToOld__Fi
/* 072CBC 00172BBC 00000000 */   nop
/* 072CC0 00172BC0 0000BF7B */  lq          $31, 0x0($29)
/* 072CC4 00172BC4 1000BD27 */  addiu       $29, $29, 0x10
/* 072CC8 00172BC8 0800E003 */  jr          $31
/* 072CCC 00172BCC 00000000 */   nop
