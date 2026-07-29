.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _NAME_REGISTRY__FP12RS_STACKDATAi
/* 08BFC0 0018BEC0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08BFC4 0018BEC4 0000BF7F */  sq          $31, 0x0($29)
/* 08BFC8 0018BEC8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08BFCC 0018BECC 00000000 */   nop
/* 08BFD0 0018BED0 28264070 */  paddub      $4, $2, $0
/* 08BFD4 0018BED4 2CCB050C */  jal         EdSetNameRegChara__Fi
/* 08BFD8 0018BED8 00000000 */   nop
/* 08BFDC 0018BEDC 06000224 */  addiu       $2, $0, 0x6
/* 08BFE0 0018BEE0 289282AF */  sw          $2, -0x6DD8($28)
/* 08BFE4 0018BEE4 01000224 */  addiu       $2, $0, 0x1
/* 08BFE8 0018BEE8 0000BF7B */  lq          $31, 0x0($29)
/* 08BFEC 0018BEEC 1000BD27 */  addiu       $29, $29, 0x10
/* 08BFF0 0018BEF0 0800E003 */  jr          $31
/* 08BFF4 0018BEF4 00000000 */   nop
/* 08BFF8 0018BEF8 00000000 */  nop
/* 08BFFC 0018BEFC 00000000 */  nop
