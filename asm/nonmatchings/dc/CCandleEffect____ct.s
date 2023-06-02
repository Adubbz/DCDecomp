.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__13CCandleEffectFv
/* 63B60 00163A60 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 63B64 00163A64 1000BF7F */  sq         $31, 0x10($sp)
/* 63B68 00163A68 0000B07F */  sq         $16, 0x0($sp)
/* 63B6C 00163A6C 28868070 */  paddub     $16, $4, $0
/* 63B70 00163A70 8C8E050C */  jal        Initialize__13CCandleEffectFv
/* 63B74 00163A74 00000000 */   nop
/* 63B78 00163A78 28160072 */  paddub     $2, $16, $0
/* 63B7C 00163A7C 1000BF7B */  lq         $31, 0x10($sp)
/* 63B80 00163A80 0000B07B */  lq         $16, 0x0($sp)
/* 63B84 00163A84 2000BD27 */  addiu      $sp, $sp, 0x20
/* 63B88 00163A88 0800E003 */  jr         $31
/* 63B8C 00163A8C 00000000 */   nop
