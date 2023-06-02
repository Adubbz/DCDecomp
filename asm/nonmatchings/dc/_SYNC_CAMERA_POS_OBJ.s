.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SYNC_CAMERA_POS_OBJ__FP12RS_STACKDATAi
/* 92C20 00192B20 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 92C24 00192B24 0000BF7F */  sq         $31, 0x0($sp)
/* 92C28 00192B28 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 92C2C 00192B2C 00000000 */   nop
/* 92C30 00192B30 28264070 */  paddub     $4, $2, $0
/* 92C34 00192B34 0C29060C */  jal        GetObjHandle__Fi
/* 92C38 00192B38 00000000 */   nop
/* 92C3C 00192B3C 549282AF */  sw         $2, -0x6DAC($gp)
/* 92C40 00192B40 01000224 */  addiu      $2, $0, 0x1
/* 92C44 00192B44 0000BF7B */  lq         $31, 0x0($sp)
/* 92C48 00192B48 1000BD27 */  addiu      $sp, $sp, 0x10
/* 92C4C 00192B4C 0800E003 */  jr         $31
/* 92C50 00192B50 00000000 */   nop
/* 92C54 00192B54 00000000 */  nop
/* 92C58 00192B58 00000000 */  nop
/* 92C5C 00192B5C 00000000 */  nop
