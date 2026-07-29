.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_DUNGEON_FLOOR__FP12RS_STACKDATAi
/* 08C1C0 0018C0C0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08C1C4 0018C0C4 0000BF7F */  sq          $31, 0x0($29)
/* 08C1C8 0018C0C8 F493858F */  lw          $5, -0x6C0C($28)
/* 08C1CC 0018C0CC F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 08C1D0 0018C0D0 00000000 */   nop
/* 08C1D4 0018C0D4 01000224 */  addiu       $2, $0, 0x1
/* 08C1D8 0018C0D8 0000BF7B */  lq          $31, 0x0($29)
/* 08C1DC 0018C0DC 1000BD27 */  addiu       $29, $29, 0x10
/* 08C1E0 0018C0E0 0800E003 */  jr          $31
/* 08C1E4 0018C0E4 00000000 */   nop
/* 08C1E8 0018C0E8 00000000 */  nop
/* 08C1EC 0018C0EC 00000000 */  nop
