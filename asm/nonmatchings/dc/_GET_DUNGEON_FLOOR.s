.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_DUNGEON_FLOOR__FP12RS_STACKDATAi
/* 8C1C0 0018C0C0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8C1C4 0018C0C4 0000BF7F */  sq         $31, 0x0($sp)
/* 8C1C8 0018C0C8 F493858F */  lw         $5, -0x6C0C($gp)
/* 8C1CC 0018C0CC F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 8C1D0 0018C0D0 00000000 */   nop
/* 8C1D4 0018C0D4 01000224 */  addiu      $2, $0, 0x1
/* 8C1D8 0018C0D8 0000BF7B */  lq         $31, 0x0($sp)
/* 8C1DC 0018C0DC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8C1E0 0018C0E0 0800E003 */  jr         $31
/* 8C1E4 0018C0E4 00000000 */   nop
/* 8C1E8 0018C0E8 00000000 */  nop
/* 8C1EC 0018C0EC 00000000 */  nop
