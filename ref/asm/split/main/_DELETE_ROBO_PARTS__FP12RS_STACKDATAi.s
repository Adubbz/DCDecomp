.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _DELETE_ROBO_PARTS__FP12RS_STACKDATAi
/* 090970 00190870 F0FFBD27 */  addiu       $29, $29, -0x10
/* 090974 00190874 0000BF7F */  sq          $31, 0x0($29)
/* 090978 00190878 3CFB050C */  jal         EdDeleteE05RoboParts__Fv
/* 09097C 0019087C 00000000 */   nop
/* 090980 00190880 01000224 */  addiu       $2, $0, 0x1
/* 090984 00190884 0000BF7B */  lq          $31, 0x0($29)
/* 090988 00190888 1000BD27 */  addiu       $29, $29, 0x10
/* 09098C 0019088C 0800E003 */  jr          $31
/* 090990 00190890 00000000 */   nop
/* 090994 00190894 00000000 */  nop
/* 090998 00190898 00000000 */  nop
/* 09099C 0019089C 00000000 */  nop
