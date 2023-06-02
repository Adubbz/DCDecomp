.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdGetUseItem__Fv
/* 72D80 00172C80 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 72D84 00172C84 0000BF7F */  sq         $31, 0x0($sp)
/* 72D88 00172C88 708F848F */  lw         $4, -0x7090($gp)
/* 72D8C 00172C8C ECCA050C */  jal        InvertItemNo__Fi
/* 72D90 00172C90 00000000 */   nop
/* 72D94 00172C94 0000BF7B */  lq         $31, 0x0($sp)
/* 72D98 00172C98 1000BD27 */  addiu      $sp, $sp, 0x10
/* 72D9C 00172C9C 0800E003 */  jr         $31
/* 72DA0 00172CA0 00000000 */   nop
/* 72DA4 00172CA4 00000000 */  nop
/* 72DA8 00172CA8 00000000 */  nop
/* 72DAC 00172CAC 00000000 */  nop
