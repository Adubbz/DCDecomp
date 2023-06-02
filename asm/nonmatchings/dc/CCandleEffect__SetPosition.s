.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPosition__13CCandleEffectFPf
/* 63BB0 00163AB0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 63BB4 00163AB4 0000BF7F */  sq         $31, 0x0($sp)
/* 63BB8 00163AB8 10008424 */  addiu      $4, $4, 0x10
/* 63BBC 00163ABC 0C86040C */  jal        sceVu0CopyVector
/* 63BC0 00163AC0 00000000 */   nop
/* 63BC4 00163AC4 0000BF7B */  lq         $31, 0x0($sp)
/* 63BC8 00163AC8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 63BCC 00163ACC 0800E003 */  jr         $31
/* 63BD0 00163AD0 00000000 */   nop
/* 63BD4 00163AD4 00000000 */  nop
/* 63BD8 00163AD8 00000000 */  nop
/* 63BDC 00163ADC 00000000 */  nop
