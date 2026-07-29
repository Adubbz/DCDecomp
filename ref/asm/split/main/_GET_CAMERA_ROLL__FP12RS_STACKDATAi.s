.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_CAMERA_ROLL__FP12RS_STACKDATAi
/* 092CE0 00192BE0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 092CE4 00192BE4 1000BF7F */  sq          $31, 0x10($29)
/* 092CE8 00192BE8 0000B07F */  sq          $16, 0x0($29)
/* 092CEC 00192BEC 28868070 */  paddub      $16, $4, $0
/* 092CF0 00192BF0 8046060C */  jal         GetCamera__Fv
/* 092CF4 00192BF4 00000000 */   nop
/* 092CF8 00192BF8 04004014 */  bnez        $2, .L00192C0C
/* 092CFC 00192BFC 00000000 */   nop
/* 092D00 00192C00 28160070 */  paddub      $2, $0, $0
/* 092D04 00192C04 09000010 */  b           .L00192C2C
/* 092D08 00192C08 00000000 */   nop
.L00192C0C:
/* 092D0C 00192C0C 28264070 */  paddub      $4, $2, $0
/* 092D10 00192C10 B891040C */  jal         GetRoll__7CCameraFv
/* 092D14 00192C14 00000000 */   nop
/* 092D18 00192C18 28260072 */  paddub      $4, $16, $0
/* 092D1C 00192C1C 06030046 */  mov.s       $f12, $f0
/* 092D20 00192C20 0029060C */  jal         SetStack__FP12RS_STACKDATAf
/* 092D24 00192C24 00000000 */   nop
/* 092D28 00192C28 01000224 */  addiu       $2, $0, 0x1
.L00192C2C:
/* 092D2C 00192C2C 1000BF7B */  lq          $31, 0x10($29)
/* 092D30 00192C30 0000B07B */  lq          $16, 0x0($29)
/* 092D34 00192C34 2000BD27 */  addiu       $29, $29, 0x20
/* 092D38 00192C38 0800E003 */  jr          $31
/* 092D3C 00192C3C 00000000 */   nop
