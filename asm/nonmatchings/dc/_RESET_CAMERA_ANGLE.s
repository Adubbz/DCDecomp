.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _RESET_CAMERA_ANGLE__FP12RS_STACKDATAi
/* 92A30 00192930 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 92A34 00192934 0000BF7F */  sq         $31, 0x0($sp)
/* 92A38 00192938 01000224 */  addiu      $2, $0, 0x1
/* 92A3C 0019293C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92A40 00192940 14D222AC */  sw         $2, -0x2DEC($at)
/* 92A44 00192944 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 92A48 00192948 00000000 */   nop
/* 92A4C 0019294C 06030046 */  mov.s      $f12, $f0
/* 92A50 00192950 F88E040C */  jal        AngleLimit__Ff
/* 92A54 00192954 00000000 */   nop
/* 92A58 00192958 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92A5C 0019295C 18D220E4 */  swc1       $f0, -0x2DE8($at)
/* 92A60 00192960 01000224 */  addiu      $2, $0, 0x1
/* 92A64 00192964 0000BF7B */  lq         $31, 0x0($sp)
/* 92A68 00192968 1000BD27 */  addiu      $sp, $sp, 0x10
/* 92A6C 0019296C 0800E003 */  jr         $31
/* 92A70 00192970 00000000 */   nop
/* 92A74 00192974 00000000 */  nop
/* 92A78 00192978 00000000 */  nop
/* 92A7C 0019297C 00000000 */  nop
