.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_CAMERA_ROLL__FP12RS_STACKDATAi
/* 92C70 00192B70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 92C74 00192B74 1000BF7F */  sq         $31, 0x10($sp)
/* 92C78 00192B78 0000B07F */  sq         $16, 0x0($sp)
/* 92C7C 00192B7C 28868070 */  paddub     $16, $4, $0
/* 92C80 00192B80 8046060C */  jal        GetCamera__Fv
/* 92C84 00192B84 00000000 */   nop
/* 92C88 00192B88 281E4070 */  paddub     $3, $2, $0
/* 92C8C 00192B8C 04006014 */  bnez       $3, .L00192BA0
/* 92C90 00192B90 00000000 */   nop
/* 92C94 00192B94 28160070 */  paddub     $2, $0, $0
/* 92C98 00192B98 09000010 */  b          .L00192BC0
/* 92C9C 00192B9C 00000000 */   nop
.L00192BA0:
/* 92CA0 00192BA0 28260072 */  paddub     $4, $16, $0
/* 92CA4 00192BA4 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 92CA8 00192BA8 00000000 */   nop
/* 92CAC 00192BAC 28266070 */  paddub     $4, $3, $0
/* 92CB0 00192BB0 06030046 */  mov.s      $f12, $f0
/* 92CB4 00192BB4 9891040C */  jal        SetRoll__7CCameraFf
/* 92CB8 00192BB8 00000000 */   nop
/* 92CBC 00192BBC 01000224 */  addiu      $2, $0, 0x1
.L00192BC0:
/* 92CC0 00192BC0 1000BF7B */  lq         $31, 0x10($sp)
/* 92CC4 00192BC4 0000B07B */  lq         $16, 0x0($sp)
/* 92CC8 00192BC8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 92CCC 00192BCC 0800E003 */  jr         $31
/* 92CD0 00192BD0 00000000 */   nop
/* 92CD4 00192BD4 00000000 */  nop
/* 92CD8 00192BD8 00000000 */  nop
/* 92CDC 00192BDC 00000000 */  nop
