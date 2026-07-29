.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_FLOOR_TITLE__FP12RS_STACKDATAi
/* 0BD0E0 001BCFE0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD0E4 001BCFE4 0000BF7F */  sq          $31, 0x0($29)
/* 0BD0E8 001BCFE8 A404770C */  jal         FloorTitleOn__Fv
/* 0BD0EC 001BCFEC 00000000 */   nop
/* 0BD0F0 001BCFF0 01000224 */  addiu       $2, $0, 0x1
/* 0BD0F4 001BCFF4 0000BF7B */  lq          $31, 0x0($29)
/* 0BD0F8 001BCFF8 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD0FC 001BCFFC 0800E003 */  jr          $31
/* 0BD100 001BD000 00000000 */   nop
/* 0BD104 001BD004 00000000 */  nop
/* 0BD108 001BD008 00000000 */  nop
/* 0BD10C 001BD00C 00000000 */  nop
