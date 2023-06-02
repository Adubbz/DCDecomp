.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _NAME_REGISTRY__FP12RS_STACKDATAi
/* 8BFC0 0018BEC0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8BFC4 0018BEC4 0000BF7F */  sq         $31, 0x0($sp)
/* 8BFC8 0018BEC8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8BFCC 0018BECC 00000000 */   nop
/* 8BFD0 0018BED0 28264070 */  paddub     $4, $2, $0
/* 8BFD4 0018BED4 2CCB050C */  jal        EdSetNameRegChara__Fi
/* 8BFD8 0018BED8 00000000 */   nop
/* 8BFDC 0018BEDC 06000224 */  addiu      $2, $0, 0x6
/* 8BFE0 0018BEE0 289282AF */  sw         $2, -0x6DD8($gp)
/* 8BFE4 0018BEE4 01000224 */  addiu      $2, $0, 0x1
/* 8BFE8 0018BEE8 0000BF7B */  lq         $31, 0x0($sp)
/* 8BFEC 0018BEEC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8BFF0 0018BEF0 0800E003 */  jr         $31
/* 8BFF4 0018BEF4 00000000 */   nop
/* 8BFF8 0018BEF8 00000000 */  nop
/* 8BFFC 0018BEFC 00000000 */  nop
