.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPosition__9CMapPartsFPf
/* 09A8B0 0019A7B0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 09A8B4 0019A7B4 0000BF7F */  sq          $31, 0x0($29)
/* 09A8B8 0019A7B8 28168070 */  paddub      $2, $4, $0
/* 09A8BC 0019A7BC 2826A070 */  paddub      $4, $5, $0
/* 09A8C0 0019A7C0 10004524 */  addiu       $5, $2, 0x10
/* 09A8C4 0019A7C4 0C86040C */  jal         sceVu0CopyVector
/* 09A8C8 0019A7C8 00000000 */   nop
/* 09A8CC 0019A7CC 0000BF7B */  lq          $31, 0x0($29)
/* 09A8D0 0019A7D0 1000BD27 */  addiu       $29, $29, 0x10
/* 09A8D4 0019A7D4 0800E003 */  jr          $31
/* 09A8D8 0019A7D8 00000000 */   nop
/* 09A8DC 0019A7DC 00000000 */  nop
