.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandSE_AMBIENT_OFF__FPPv
/* 077510 00177410 01000424 */  addiu       $4, $0, 0x1
/* 077514 00177414 C08F838F */  lw          $3, -0x7040($28)
/* 077518 00177418 440064AC */  sw          $4, 0x44($3)
/* 07751C 0017741C 0800E003 */  jr          $31
/* 077520 00177420 00000000 */   nop
/* 077524 00177424 00000000 */  nop
/* 077528 00177428 00000000 */  nop
/* 07752C 0017742C 00000000 */  nop
