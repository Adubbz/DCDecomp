.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SYNC_CAMERA_POS_OBJ__FP12RS_STACKDATAi
/* 092C20 00192B20 F0FFBD27 */  addiu       $29, $29, -0x10
/* 092C24 00192B24 0000BF7F */  sq          $31, 0x0($29)
/* 092C28 00192B28 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 092C2C 00192B2C 00000000 */   nop
/* 092C30 00192B30 28264070 */  paddub      $4, $2, $0
/* 092C34 00192B34 0C29060C */  jal         GetObjHandle__Fi
/* 092C38 00192B38 00000000 */   nop
/* 092C3C 00192B3C 549282AF */  sw          $2, -0x6DAC($28)
/* 092C40 00192B40 01000224 */  addiu       $2, $0, 0x1
/* 092C44 00192B44 0000BF7B */  lq          $31, 0x0($29)
/* 092C48 00192B48 1000BD27 */  addiu       $29, $29, 0x10
/* 092C4C 00192B4C 0800E003 */  jr          $31
/* 092C50 00192B50 00000000 */   nop
/* 092C54 00192B54 00000000 */  nop
/* 092C58 00192B58 00000000 */  nop
/* 092C5C 00192B5C 00000000 */  nop
