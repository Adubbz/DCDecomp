.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _RESET_CAMERA_ANGLE__FP12RS_STACKDATAi
/* 092A30 00192930 F0FFBD27 */  addiu       $29, $29, -0x10
/* 092A34 00192934 0000BF7F */  sq          $31, 0x0($29)
/* 092A38 00192938 01000224 */  addiu       $2, $0, 0x1
/* 092A3C 0019293C D401013C */  lui         $1, %hi(EdEventInfo + 0x44)
/* 092A40 00192940 14D222AC */  sw          $2, %lo(EdEventInfo + 0x44)($1)
/* 092A44 00192944 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 092A48 00192948 00000000 */   nop
/* 092A4C 0019294C 06030046 */  mov.s       $f12, $f0
/* 092A50 00192950 F88E040C */  jal         AngleLimit__Ff
/* 092A54 00192954 00000000 */   nop
/* 092A58 00192958 D401013C */  lui         $1, %hi(EdEventInfo + 0x48)
/* 092A5C 0019295C 18D220E4 */  swc1        $f0, %lo(EdEventInfo + 0x48)($1)
/* 092A60 00192960 01000224 */  addiu       $2, $0, 0x1
/* 092A64 00192964 0000BF7B */  lq          $31, 0x0($29)
/* 092A68 00192968 1000BD27 */  addiu       $29, $29, 0x10
/* 092A6C 0019296C 0800E003 */  jr          $31
/* 092A70 00192970 00000000 */   nop
/* 092A74 00192974 00000000 */  nop
/* 092A78 00192978 00000000 */  nop
/* 092A7C 0019297C 00000000 */  nop
