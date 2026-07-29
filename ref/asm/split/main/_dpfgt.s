.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _dpfgt
/* 000260 00100160 F0FFBD27 */  addiu       $29, $29, -0x10
/* 000264 00100164 0000BF7F */  sq          $31, 0x0($29)
/* 000268 00100168 E840040C */  jal         dpcmp
/* 00026C 0010016C 00000000 */   nop
/* 000270 00100170 0000BF7B */  lq          $31, 0x0($29)
/* 000274 00100174 2A100200 */  slt         $2, $0, $2
/* 000278 00100178 0800E003 */  jr          $31
/* 00027C 0010017C 1000BD27 */   addiu      $29, $29, 0x10
