.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _ADD_CAMERA_ANGLE__FP12RS_STACKDATAi
/* 0920F0 00191FF0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0920F4 00191FF4 1000BF7F */  sq          $31, 0x10($29)
/* 0920F8 00191FF8 0000B07F */  sq          $16, 0x0($29)
/* 0920FC 00191FFC D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 092100 00192000 10D2308C */  lw          $16, %lo(EdEventInfo + 0x40)($1)
/* 092104 00192004 04000016 */  bnez        $16, .L00192018
/* 092108 00192008 00000000 */   nop
/* 09210C 0019200C 28160070 */  paddub      $2, $0, $0
/* 092110 00192010 0B000010 */  b           .L00192040
/* 092114 00192014 00000000 */   nop
.L00192018:
/* 092118 00192018 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 09211C 0019201C 00000000 */   nop
/* 092120 00192020 28260072 */  paddub      $4, $16, $0
/* 092124 00192024 06030046 */  mov.s       $f12, $f0
/* 092128 00192028 D492040C */  jal         AddAngle__13CCameraFollowFf
/* 09212C 0019202C 00000000 */   nop
/* 092130 00192030 28260072 */  paddub      $4, $16, $0
/* 092134 00192034 C092040C */  jal         FollowOn__13CCameraFollowFv
/* 092138 00192038 00000000 */   nop
/* 09213C 0019203C 01000224 */  addiu       $2, $0, 0x1
.L00192040:
/* 092140 00192040 1000BF7B */  lq          $31, 0x10($29)
/* 092144 00192044 0000B07B */  lq          $16, 0x0($29)
/* 092148 00192048 2000BD27 */  addiu       $29, $29, 0x20
/* 09214C 0019204C 0800E003 */  jr          $31
/* 092150 00192050 00000000 */   nop
/* 092154 00192054 00000000 */  nop
/* 092158 00192058 00000000 */  nop
/* 09215C 0019205C 00000000 */  nop
