.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _FINISH__FP12RS_STACKDATAi
/* 8C0B0 0018BFB0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8C0B4 0018BFB4 0000BF7F */  sq         $31, 0x0($sp)
/* 8C0B8 0018BFB8 045E060C */  jal        EdEventAllClear__Fv
/* 8C0BC 0018BFBC 00000000 */   nop
/* 8C0C0 0018BFC0 01000224 */  addiu      $2, $0, 0x1
/* 8C0C4 0018BFC4 0000BF7B */  lq         $31, 0x0($sp)
/* 8C0C8 0018BFC8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8C0CC 0018BFCC 0800E003 */  jr         $31
/* 8C0D0 0018BFD0 00000000 */   nop
/* 8C0D4 0018BFD4 00000000 */  nop
/* 8C0D8 0018BFD8 00000000 */  nop
/* 8C0DC 0018BFDC 00000000 */  nop
