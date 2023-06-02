.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_AMB_VOLF__FP12RS_STACKDATAi
/* 96160 00196060 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 96164 00196064 0000BF7F */  sq         $31, 0x0($sp)
/* 96168 00196068 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 9616C 0019606C 00000000 */   nop
/* 96170 00196070 06030046 */  mov.s      $f12, $f0
/* 96174 00196074 906C050C */  jal        SndAmbientSetVolf__Ff
/* 96178 00196078 00000000 */   nop
/* 9617C 0019607C 01000224 */  addiu      $2, $0, 0x1
/* 96180 00196080 0000BF7B */  lq         $31, 0x0($sp)
/* 96184 00196084 1000BD27 */  addiu      $sp, $sp, 0x10
/* 96188 00196088 0800E003 */  jr         $31
/* 9618C 0019608C 00000000 */   nop
