.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_WIND__FP12RS_STACKDATAi
/* 940D0 00193FD0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 940D4 00193FD4 0000BF7F */  sq         $31, 0x0($sp)
/* 940D8 00193FD8 08008324 */  addiu      $3, $4, 0x8
/* 940DC 00193FDC E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 940E0 00193FE0 00000000 */   nop
/* 940E4 00193FE4 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 940E8 00193FE8 00D420E4 */  swc1       $f0, -0x2C00($at)
/* 940EC 00193FEC 28266070 */  paddub     $4, $3, $0
/* 940F0 00193FF0 08008324 */  addiu      $3, $4, 0x8
/* 940F4 00193FF4 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 940F8 00193FF8 00000000 */   nop
/* 940FC 00193FFC D401013C */  lui        $at, (0x1D40000 >> 16)
/* 94100 00194000 04D420E4 */  swc1       $f0, -0x2BFC($at)
/* 94104 00194004 28266070 */  paddub     $4, $3, $0
/* 94108 00194008 08008324 */  addiu      $3, $4, 0x8
/* 9410C 0019400C E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 94110 00194010 00000000 */   nop
/* 94114 00194014 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 94118 00194018 08D420E4 */  swc1       $f0, -0x2BF8($at)
/* 9411C 0019401C 28266070 */  paddub     $4, $3, $0
/* 94120 00194020 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 94124 00194024 00000000 */   nop
/* 94128 00194028 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9412C 0019402C 0CD420E4 */  swc1       $f0, -0x2BF4($at)
/* 94130 00194030 01000224 */  addiu      $2, $0, 0x1
/* 94134 00194034 0000BF7B */  lq         $31, 0x0($sp)
/* 94138 00194038 1000BD27 */  addiu      $sp, $sp, 0x10
/* 9413C 0019403C 0800E003 */  jr         $31
/* 94140 00194040 00000000 */   nop
/* 94144 00194044 00000000 */  nop
/* 94148 00194048 00000000 */  nop
/* 9414C 0019404C 00000000 */  nop
