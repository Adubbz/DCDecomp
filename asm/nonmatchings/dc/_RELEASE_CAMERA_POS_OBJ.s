.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _RELEASE_CAMERA_POS_OBJ__FP12RS_STACKDATAi
/* 92C60 00192B60 549280AF */  sw         $0, -0x6DAC($gp)
/* 92C64 00192B64 01000224 */  addiu      $2, $0, 0x1
/* 92C68 00192B68 0800E003 */  jr         $31
/* 92C6C 00192B6C 00000000 */   nop
