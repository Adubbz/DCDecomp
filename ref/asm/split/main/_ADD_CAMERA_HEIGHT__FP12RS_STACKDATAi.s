.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _ADD_CAMERA_HEIGHT__FP12RS_STACKDATAi
/* 092160 00192060 E0FFBD27 */  addiu       $29, $29, -0x20
/* 092164 00192064 1000BF7F */  sq          $31, 0x10($29)
/* 092168 00192068 0000B07F */  sq          $16, 0x0($29)
/* 09216C 0019206C D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 092170 00192070 10D2308C */  lw          $16, %lo(EdEventInfo + 0x40)($1)
/* 092174 00192074 04000016 */  bnez        $16, .L00192088
/* 092178 00192078 00000000 */   nop
/* 09217C 0019207C 28160070 */  paddub      $2, $0, $0
/* 092180 00192080 0B000010 */  b           .L001920B0
/* 092184 00192084 00000000 */   nop
.L00192088:
/* 092188 00192088 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 09218C 0019208C 00000000 */   nop
/* 092190 00192090 28260072 */  paddub      $4, $16, $0
/* 092194 00192094 06030046 */  mov.s       $f12, $f0
/* 092198 00192098 F492040C */  jal         AddHeight__13CCameraFollowFf
/* 09219C 0019209C 00000000 */   nop
/* 0921A0 001920A0 28260072 */  paddub      $4, $16, $0
/* 0921A4 001920A4 C092040C */  jal         FollowOn__13CCameraFollowFv
/* 0921A8 001920A8 00000000 */   nop
/* 0921AC 001920AC 01000224 */  addiu       $2, $0, 0x1
.L001920B0:
/* 0921B0 001920B0 1000BF7B */  lq          $31, 0x10($29)
/* 0921B4 001920B4 0000B07B */  lq          $16, 0x0($29)
/* 0921B8 001920B8 2000BD27 */  addiu       $29, $29, 0x20
/* 0921BC 001920BC 0800E003 */  jr          $31
/* 0921C0 001920C0 00000000 */   nop
/* 0921C4 001920C4 00000000 */  nop
/* 0921C8 001920C8 00000000 */  nop
/* 0921CC 001920CC 00000000 */  nop
