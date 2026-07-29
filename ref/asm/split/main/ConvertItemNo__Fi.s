.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ConvertItemNo__Fi
/* 072C90 00172B90 F0FFBD27 */  addiu       $29, $29, -0x10
/* 072C94 00172B94 0000BF7F */  sq          $31, 0x0($29)
/* 072C98 00172B98 8095080C */  jal         TransWepNo__Fi
/* 072C9C 00172B9C 00000000 */   nop
/* 072CA0 00172BA0 0000BF7B */  lq          $31, 0x0($29)
/* 072CA4 00172BA4 1000BD27 */  addiu       $29, $29, 0x10
/* 072CA8 00172BA8 0800E003 */  jr          $31
/* 072CAC 00172BAC 00000000 */   nop
