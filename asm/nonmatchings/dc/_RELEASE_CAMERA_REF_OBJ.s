.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _RELEASE_CAMERA_REF_OBJ__FP12RS_STACKDATAi
/* 92C10 00192B10 509280AF */  sw         $0, -0x6DB0($gp)
/* 92C14 00192B14 01000224 */  addiu      $2, $0, 0x1
/* 92C18 00192B18 0800E003 */  jr         $31
/* 92C1C 00192B1C 00000000 */   nop
