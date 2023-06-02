.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ADD_CAMERA_ANGLE__FP12RS_STACKDATAi
/* 920F0 00191FF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 920F4 00191FF4 1000BF7F */  sq         $31, 0x10($sp)
/* 920F8 00191FF8 0000B07F */  sq         $16, 0x0($sp)
/* 920FC 00191FFC D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92100 00192000 10D2308C */  lw         $16, -0x2DF0($at)
/* 92104 00192004 04000016 */  bnez       $16, .L00192018
/* 92108 00192008 00000000 */   nop
/* 9210C 0019200C 28160070 */  paddub     $2, $0, $0
/* 92110 00192010 0B000010 */  b          .L00192040
/* 92114 00192014 00000000 */   nop
.L00192018:
/* 92118 00192018 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 9211C 0019201C 00000000 */   nop
/* 92120 00192020 28260072 */  paddub     $4, $16, $0
/* 92124 00192024 06030046 */  mov.s      $f12, $f0
/* 92128 00192028 D492040C */  jal        AddAngle__13CCameraFollowFf
/* 9212C 0019202C 00000000 */   nop
/* 92130 00192030 28260072 */  paddub     $4, $16, $0
/* 92134 00192034 C092040C */  jal        FollowOn__13CCameraFollowFv
/* 92138 00192038 00000000 */   nop
/* 9213C 0019203C 01000224 */  addiu      $2, $0, 0x1
.L00192040:
/* 92140 00192040 1000BF7B */  lq         $31, 0x10($sp)
/* 92144 00192044 0000B07B */  lq         $16, 0x0($sp)
/* 92148 00192048 2000BD27 */  addiu      $sp, $sp, 0x20
/* 9214C 0019204C 0800E003 */  jr         $31
/* 92150 00192050 00000000 */   nop
/* 92154 00192054 00000000 */  nop
/* 92158 00192058 00000000 */  nop
/* 9215C 0019205C 00000000 */  nop
