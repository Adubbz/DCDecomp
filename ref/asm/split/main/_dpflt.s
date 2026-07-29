.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _dpflt
/* 000210 00100110 F0FFBD27 */  addiu       $29, $29, -0x10
/* 000214 00100114 0000BF7F */  sq          $31, 0x0($29)
/* 000218 00100118 E840040C */  jal         dpcmp
/* 00021C 0010011C 00000000 */   nop
/* 000220 00100120 0000BF7B */  lq          $31, 0x0($29)
/* 000224 00100124 2A104000 */  slt         $2, $2, $0
/* 000228 00100128 0800E003 */  jr          $31
/* 00022C 0010012C 1000BD27 */   addiu      $29, $29, 0x10
