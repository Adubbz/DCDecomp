.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _INIT_SPRITE__FP12RS_STACKDATAi
/* 092F60 00192E60 F0FFBD27 */  addiu       $29, $29, -0x10
/* 092F64 00192E64 0000BF7F */  sq          $31, 0x0($29)
/* 092F68 00192E68 D501023C */  lui         $2, %hi(SpriteTable)
/* 092F6C 00192E6C 708E4424 */  addiu       $4, $2, %lo(SpriteTable)
/* 092F70 00192E70 3CB0040C */  jal         ClearPointer__12CSpriteTableFv
/* 092F74 00192E74 00000000 */   nop
/* 092F78 00192E78 D501023C */  lui         $2, %hi(SpriteTableBack)
/* 092F7C 00192E7C 108F4424 */  addiu       $4, $2, %lo(SpriteTableBack)
/* 092F80 00192E80 3CB0040C */  jal         ClearPointer__12CSpriteTableFv
/* 092F84 00192E84 00000000 */   nop
/* 092F88 00192E88 01000224 */  addiu       $2, $0, 0x1
/* 092F8C 00192E8C 0000BF7B */  lq          $31, 0x0($29)
/* 092F90 00192E90 1000BD27 */  addiu       $29, $29, 0x10
/* 092F94 00192E94 0800E003 */  jr          $31
/* 092F98 00192E98 00000000 */   nop
/* 092F9C 00192E9C 00000000 */  nop
