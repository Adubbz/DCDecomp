.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_AMB_VOLF__FP12RS_STACKDATAi
/* 096160 00196060 F0FFBD27 */  addiu       $29, $29, -0x10
/* 096164 00196064 0000BF7F */  sq          $31, 0x0($29)
/* 096168 00196068 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 09616C 0019606C 00000000 */   nop
/* 096170 00196070 06030046 */  mov.s       $f12, $f0
/* 096174 00196074 906C050C */  jal         SndAmbientSetVolf__Ff
/* 096178 00196078 00000000 */   nop
/* 09617C 0019607C 01000224 */  addiu       $2, $0, 0x1
/* 096180 00196080 0000BF7B */  lq          $31, 0x0($29)
/* 096184 00196084 1000BD27 */  addiu       $29, $29, 0x10
/* 096188 00196088 0800E003 */  jr          $31
/* 09618C 0019608C 00000000 */   nop
