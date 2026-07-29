.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _INITIALIZE__FP12RS_STACKDATAi
/* 08BE70 0018BD70 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08BE74 0018BD74 0000BF7F */  sq          $31, 0x0($29)
/* 08BE78 0018BD78 885C060C */  jal         EdInitEventParam__Fv
/* 08BE7C 0018BD7C 00000000 */   nop
/* 08BE80 0018BD80 01000224 */  addiu       $2, $0, 0x1
/* 08BE84 0018BD84 0000BF7B */  lq          $31, 0x0($29)
/* 08BE88 0018BD88 1000BD27 */  addiu       $29, $29, 0x10
/* 08BE8C 0018BD8C 0800E003 */  jr          $31
/* 08BE90 0018BD90 00000000 */   nop
/* 08BE94 0018BD94 00000000 */  nop
/* 08BE98 0018BD98 00000000 */  nop
/* 08BE9C 0018BD9C 00000000 */  nop
