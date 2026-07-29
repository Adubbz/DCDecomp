.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_DUNGEON_FLOOR__FP12RS_STACKDATAi
/* 08C190 0018C090 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08C194 0018C094 0000BF7F */  sq          $31, 0x0($29)
/* 08C198 0018C098 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08C19C 0018C09C 00000000 */   nop
/* 08C1A0 0018C0A0 28264070 */  paddub      $4, $2, $0
/* 08C1A4 0018C0A4 48EE060C */  jal         BtSetMapJumpFloor__Fi
/* 08C1A8 0018C0A8 00000000 */   nop
/* 08C1AC 0018C0AC 01000224 */  addiu       $2, $0, 0x1
/* 08C1B0 0018C0B0 0000BF7B */  lq          $31, 0x0($29)
/* 08C1B4 0018C0B4 1000BD27 */  addiu       $29, $29, 0x10
/* 08C1B8 0018C0B8 0800E003 */  jr          $31
/* 08C1BC 0018C0BC 00000000 */   nop
