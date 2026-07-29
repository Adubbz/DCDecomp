.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_WIND__FP12RS_STACKDATAi
/* 0940D0 00193FD0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0940D4 00193FD4 0000BF7F */  sq          $31, 0x0($29)
/* 0940D8 00193FD8 08008324 */  addiu       $3, $4, 0x8
/* 0940DC 00193FDC E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 0940E0 00193FE0 00000000 */   nop
/* 0940E4 00193FE4 D401013C */  lui         $1, %hi(EdEventInfo + 0x230)
/* 0940E8 00193FE8 00D420E4 */  swc1        $f0, %lo(EdEventInfo + 0x230)($1)
/* 0940EC 00193FEC 28266070 */  paddub      $4, $3, $0
/* 0940F0 00193FF0 08008324 */  addiu       $3, $4, 0x8
/* 0940F4 00193FF4 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 0940F8 00193FF8 00000000 */   nop
/* 0940FC 00193FFC D401013C */  lui         $1, %hi(EdEventInfo + 0x234)
/* 094100 00194000 04D420E4 */  swc1        $f0, %lo(EdEventInfo + 0x234)($1)
/* 094104 00194004 28266070 */  paddub      $4, $3, $0
/* 094108 00194008 08008324 */  addiu       $3, $4, 0x8
/* 09410C 0019400C E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 094110 00194010 00000000 */   nop
/* 094114 00194014 D401013C */  lui         $1, %hi(EdEventInfo + 0x238)
/* 094118 00194018 08D420E4 */  swc1        $f0, %lo(EdEventInfo + 0x238)($1)
/* 09411C 0019401C 28266070 */  paddub      $4, $3, $0
/* 094120 00194020 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 094124 00194024 00000000 */   nop
/* 094128 00194028 D401013C */  lui         $1, %hi(EdEventInfo + 0x23C)
/* 09412C 0019402C 0CD420E4 */  swc1        $f0, %lo(EdEventInfo + 0x23C)($1)
/* 094130 00194030 01000224 */  addiu       $2, $0, 0x1
/* 094134 00194034 0000BF7B */  lq          $31, 0x0($29)
/* 094138 00194038 1000BD27 */  addiu       $29, $29, 0x10
/* 09413C 0019403C 0800E003 */  jr          $31
/* 094140 00194040 00000000 */   nop
/* 094144 00194044 00000000 */  nop
/* 094148 00194048 00000000 */  nop
/* 09414C 0019404C 00000000 */  nop
