.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ADD_CAMERA_HEIGHT__FP12RS_STACKDATAi
/* 92160 00192060 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 92164 00192064 1000BF7F */  sq         $31, 0x10($sp)
/* 92168 00192068 0000B07F */  sq         $16, 0x0($sp)
/* 9216C 0019206C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92170 00192070 10D2308C */  lw         $16, -0x2DF0($at)
/* 92174 00192074 04000016 */  bnez       $16, .L00192088
/* 92178 00192078 00000000 */   nop
/* 9217C 0019207C 28160070 */  paddub     $2, $0, $0
/* 92180 00192080 0B000010 */  b          .L001920B0
/* 92184 00192084 00000000 */   nop
.L00192088:
/* 92188 00192088 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 9218C 0019208C 00000000 */   nop
/* 92190 00192090 28260072 */  paddub     $4, $16, $0
/* 92194 00192094 06030046 */  mov.s      $f12, $f0
/* 92198 00192098 F492040C */  jal        AddHeight__13CCameraFollowFf
/* 9219C 0019209C 00000000 */   nop
/* 921A0 001920A0 28260072 */  paddub     $4, $16, $0
/* 921A4 001920A4 C092040C */  jal        FollowOn__13CCameraFollowFv
/* 921A8 001920A8 00000000 */   nop
/* 921AC 001920AC 01000224 */  addiu      $2, $0, 0x1
.L001920B0:
/* 921B0 001920B0 1000BF7B */  lq         $31, 0x10($sp)
/* 921B4 001920B4 0000B07B */  lq         $16, 0x0($sp)
/* 921B8 001920B8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 921BC 001920BC 0800E003 */  jr         $31
/* 921C0 001920C0 00000000 */   nop
/* 921C4 001920C4 00000000 */  nop
/* 921C8 001920C8 00000000 */  nop
/* 921CC 001920CC 00000000 */  nop
