.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPosition__13CCandleEffectFPf
/* 063BB0 00163AB0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 063BB4 00163AB4 0000BF7F */  sq          $31, 0x0($29)
/* 063BB8 00163AB8 10008424 */  addiu       $4, $4, 0x10
/* 063BBC 00163ABC 0C86040C */  jal         sceVu0CopyVector
/* 063BC0 00163AC0 00000000 */   nop
/* 063BC4 00163AC4 0000BF7B */  lq          $31, 0x0($29)
/* 063BC8 00163AC8 1000BD27 */  addiu       $29, $29, 0x10
/* 063BCC 00163ACC 0800E003 */  jr          $31
/* 063BD0 00163AD0 00000000 */   nop
/* 063BD4 00163AD4 00000000 */  nop
/* 063BD8 00163AD8 00000000 */  nop
/* 063BDC 00163ADC 00000000 */  nop
