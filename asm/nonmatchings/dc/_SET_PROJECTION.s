.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_PROJECTION__FP12RS_STACKDATAi
/* 922D0 001921D0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 922D4 001921D4 0000BF7F */  sq         $31, 0x0($sp)
/* 922D8 001921D8 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 922DC 001921DC 00000000 */   nop
/* 922E0 001921E0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 922E4 001921E4 0CD220E4 */  swc1       $f0, -0x2DF4($at)
/* 922E8 001921E8 01000224 */  addiu      $2, $0, 0x1
/* 922EC 001921EC 0000BF7B */  lq         $31, 0x0($sp)
/* 922F0 001921F0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 922F4 001921F4 0800E003 */  jr         $31
/* 922F8 001921F8 00000000 */   nop
/* 922FC 001921FC 00000000 */  nop
