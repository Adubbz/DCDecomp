.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPosition__9CMapPartsFPf
/* 9A8B0 0019A7B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 9A8B4 0019A7B4 0000BF7F */  sq         $31, 0x0($sp)
/* 9A8B8 0019A7B8 28168070 */  paddub     $2, $4, $0
/* 9A8BC 0019A7BC 2826A070 */  paddub     $4, $5, $0
/* 9A8C0 0019A7C0 10004524 */  addiu      $5, $2, 0x10
/* 9A8C4 0019A7C4 0C86040C */  jal        sceVu0CopyVector
/* 9A8C8 0019A7C8 00000000 */   nop
/* 9A8CC 0019A7CC 0000BF7B */  lq         $31, 0x0($sp)
/* 9A8D0 0019A7D0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 9A8D4 0019A7D4 0800E003 */  jr         $31
/* 9A8D8 0019A7D8 00000000 */   nop
/* 9A8DC 0019A7DC 00000000 */  nop
