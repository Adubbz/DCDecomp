.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_RUBY_ELEMENT__FP12RS_STACKDATAi
/* 0BD140 001BD040 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BD144 001BD044 0000BF7F */  sq          $31, 0x0($29)
/* 0BD148 001BD048 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BD14C 001BD04C 00000000 */   nop
/* 0BD150 001BD050 01000224 */  addiu       $2, $0, 0x1
/* 0BD154 001BD054 0000BF7B */  lq          $31, 0x0($29)
/* 0BD158 001BD058 1000BD27 */  addiu       $29, $29, 0x10
/* 0BD15C 001BD05C 0800E003 */  jr          $31
/* 0BD160 001BD060 00000000 */   nop
/* 0BD164 001BD064 00000000 */  nop
/* 0BD168 001BD068 00000000 */  nop
/* 0BD16C 001BD06C 00000000 */  nop
