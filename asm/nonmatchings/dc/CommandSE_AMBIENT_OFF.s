.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandSE_AMBIENT_OFF__FPPv
/* 77510 00177410 01000424 */  addiu      $4, $0, 0x1
/* 77514 00177414 C08F838F */  lw         $3, -0x7040($gp)
/* 77518 00177418 440064AC */  sw         $4, 0x44($3)
/* 7751C 0017741C 0800E003 */  jr         $31
/* 77520 00177420 00000000 */   nop
/* 77524 00177424 00000000 */  nop
/* 77528 00177428 00000000 */  nop
/* 7752C 0017742C 00000000 */  nop
