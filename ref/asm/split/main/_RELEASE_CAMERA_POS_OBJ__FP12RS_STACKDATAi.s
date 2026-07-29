.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _RELEASE_CAMERA_POS_OBJ__FP12RS_STACKDATAi
/* 092C60 00192B60 549280AF */  sw          $0, -0x6DAC($28)
/* 092C64 00192B64 01000224 */  addiu       $2, $0, 0x1
/* 092C68 00192B68 0800E003 */  jr          $31
/* 092C6C 00192B6C 00000000 */   nop
