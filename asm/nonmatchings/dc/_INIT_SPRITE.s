.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _INIT_SPRITE__FP12RS_STACKDATAi
/* 92F60 00192E60 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 92F64 00192E64 0000BF7F */  sq         $31, 0x0($sp)
/* 92F68 00192E68 D501023C */  lui        $2, %hi(SpriteTable)
/* 92F6C 00192E6C 708E4424 */  addiu      $4, $2, %lo(SpriteTable)
/* 92F70 00192E70 3CB0040C */  jal        ClearPointer__12CSpriteTableFv
/* 92F74 00192E74 00000000 */   nop
/* 92F78 00192E78 D501023C */  lui        $2, %hi(SpriteTableBack)
/* 92F7C 00192E7C 108F4424 */  addiu      $4, $2, %lo(SpriteTableBack)
/* 92F80 00192E80 3CB0040C */  jal        ClearPointer__12CSpriteTableFv
/* 92F84 00192E84 00000000 */   nop
/* 92F88 00192E88 01000224 */  addiu      $2, $0, 0x1
/* 92F8C 00192E8C 0000BF7B */  lq         $31, 0x0($sp)
/* 92F90 00192E90 1000BD27 */  addiu      $sp, $sp, 0x10
/* 92F94 00192E94 0800E003 */  jr         $31
/* 92F98 00192E98 00000000 */   nop
/* 92F9C 00192E9C 00000000 */  nop
