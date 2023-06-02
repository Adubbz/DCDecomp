.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_CAMERA_ROLL__FP12RS_STACKDATAi
/* 92CE0 00192BE0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 92CE4 00192BE4 1000BF7F */  sq         $31, 0x10($sp)
/* 92CE8 00192BE8 0000B07F */  sq         $16, 0x0($sp)
/* 92CEC 00192BEC 28868070 */  paddub     $16, $4, $0
/* 92CF0 00192BF0 8046060C */  jal        GetCamera__Fv
/* 92CF4 00192BF4 00000000 */   nop
/* 92CF8 00192BF8 04004014 */  bnez       $2, .L00192C0C
/* 92CFC 00192BFC 00000000 */   nop
/* 92D00 00192C00 28160070 */  paddub     $2, $0, $0
/* 92D04 00192C04 09000010 */  b          .L00192C2C
/* 92D08 00192C08 00000000 */   nop
.L00192C0C:
/* 92D0C 00192C0C 28264070 */  paddub     $4, $2, $0
/* 92D10 00192C10 B891040C */  jal        GetRoll__7CCameraFv
/* 92D14 00192C14 00000000 */   nop
/* 92D18 00192C18 28260072 */  paddub     $4, $16, $0
/* 92D1C 00192C1C 06030046 */  mov.s      $f12, $f0
/* 92D20 00192C20 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 92D24 00192C24 00000000 */   nop
/* 92D28 00192C28 01000224 */  addiu      $2, $0, 0x1
.L00192C2C:
/* 92D2C 00192C2C 1000BF7B */  lq         $31, 0x10($sp)
/* 92D30 00192C30 0000B07B */  lq         $16, 0x0($sp)
/* 92D34 00192C34 2000BD27 */  addiu      $sp, $sp, 0x20
/* 92D38 00192C38 0800E003 */  jr         $31
/* 92D3C 00192C3C 00000000 */   nop
