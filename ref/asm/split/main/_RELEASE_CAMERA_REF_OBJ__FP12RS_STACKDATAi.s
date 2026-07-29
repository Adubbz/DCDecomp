.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _RELEASE_CAMERA_REF_OBJ__FP12RS_STACKDATAi
/* 092C10 00192B10 509280AF */  sw          $0, -0x6DB0($28)
/* 092C14 00192B14 01000224 */  addiu       $2, $0, 0x1
/* 092C18 00192B18 0800E003 */  jr          $31
/* 092C1C 00192B1C 00000000 */   nop
