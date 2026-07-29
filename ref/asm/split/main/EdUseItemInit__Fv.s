.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdUseItemInit__Fv
/* 072CD0 00172BD0 64000324 */  addiu       $3, $0, 0x64
/* 072CD4 00172BD4 D201013C */  lui         $1, %hi(use_item_list)
/* 072CD8 00172BD8 009A23AC */  sw          $3, %lo(use_item_list)($1)
/* 072CDC 00172BDC FFFF0324 */  addiu       $3, $0, -0x1
/* 072CE0 00172BE0 D201013C */  lui         $1, %hi(use_item_list + 0x4)
/* 072CE4 00172BE4 049A23AC */  sw          $3, %lo(use_item_list + 0x4)($1)
/* 072CE8 00172BE8 708F83AF */  sw          $3, -0x7090($28)
/* 072CEC 00172BEC 0800E003 */  jr          $31
/* 072CF0 00172BF0 00000000 */   nop
/* 072CF4 00172BF4 00000000 */  nop
/* 072CF8 00172BF8 00000000 */  nop
/* 072CFC 00172BFC 00000000 */  nop
