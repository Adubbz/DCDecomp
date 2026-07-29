.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _RELEASE_CAMERA_REF_CHARA__FP12RS_STACKDATAi
/* 092B40 00192A40 4C9280AF */  sw          $0, -0x6DB4($28)
/* 092B44 00192A44 01000224 */  addiu       $2, $0, 0x1
/* 092B48 00192A48 0800E003 */  jr          $31
/* 092B4C 00192A4C 00000000 */   nop
