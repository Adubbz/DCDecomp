.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ConvertItemNo__Fi
/* 72C90 00172B90 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 72C94 00172B94 0000BF7F */  sq         $31, 0x0($sp)
/* 72C98 00172B98 8095080C */  jal        TransWepNo__Fi
/* 72C9C 00172B9C 00000000 */   nop
/* 72CA0 00172BA0 0000BF7B */  lq         $31, 0x0($sp)
/* 72CA4 00172BA4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 72CA8 00172BA8 0800E003 */  jr         $31
/* 72CAC 00172BAC 00000000 */   nop
