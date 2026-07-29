.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPosition__9CMapPartsFPf
/* 09A8E0 0019A7E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 09A8E4 0019A7E4 0000BF7F */  sq          $31, 0x0($29)
/* 09A8E8 0019A7E8 10008424 */  addiu       $4, $4, 0x10
/* 09A8EC 0019A7EC 0C86040C */  jal         sceVu0CopyVector
/* 09A8F0 0019A7F0 00000000 */   nop
/* 09A8F4 0019A7F4 0000BF7B */  lq          $31, 0x0($29)
/* 09A8F8 0019A7F8 1000BD27 */  addiu       $29, $29, 0x10
/* 09A8FC 0019A7FC 0800E003 */  jr          $31
/* 09A900 0019A800 00000000 */   nop
/* 09A904 0019A804 00000000 */  nop
/* 09A908 0019A808 00000000 */  nop
/* 09A90C 0019A80C 00000000 */  nop
