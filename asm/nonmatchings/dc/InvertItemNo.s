.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InvertItemNo__Fi
/* 72CB0 00172BB0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 72CB4 00172BB4 0000BF7F */  sq         $31, 0x0($sp)
/* 72CB8 00172BB8 B895080C */  jal        TransWepNoNewToOld__Fi
/* 72CBC 00172BBC 00000000 */   nop
/* 72CC0 00172BC0 0000BF7B */  lq         $31, 0x0($sp)
/* 72CC4 00172BC4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 72CC8 00172BC8 0800E003 */  jr         $31
/* 72CCC 00172BCC 00000000 */   nop
