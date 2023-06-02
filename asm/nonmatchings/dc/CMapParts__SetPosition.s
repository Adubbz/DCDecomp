.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPosition__9CMapPartsFPf
/* 9A8E0 0019A7E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 9A8E4 0019A7E4 0000BF7F */  sq         $31, 0x0($sp)
/* 9A8E8 0019A7E8 10008424 */  addiu      $4, $4, 0x10
/* 9A8EC 0019A7EC 0C86040C */  jal        sceVu0CopyVector
/* 9A8F0 0019A7F0 00000000 */   nop
/* 9A8F4 0019A7F4 0000BF7B */  lq         $31, 0x0($sp)
/* 9A8F8 0019A7F8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 9A8FC 0019A7FC 0800E003 */  jr         $31
/* 9A900 0019A800 00000000 */   nop
/* 9A904 0019A804 00000000 */  nop
/* 9A908 0019A808 00000000 */  nop
/* 9A90C 0019A80C 00000000 */  nop
