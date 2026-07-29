.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _EB_INTRO_END__FP12RS_STACKDATAi
/* 096950 00196850 F0FFBD27 */  addiu       $29, $29, -0x10
/* 096954 00196854 0000BF7F */  sq          $31, 0x0($29)
/* 096958 00196858 58A1050C */  jal         EBExit__Fv
/* 09695C 0019685C 00000000 */   nop
/* 096960 00196860 01000224 */  addiu       $2, $0, 0x1
/* 096964 00196864 0000BF7B */  lq          $31, 0x0($29)
/* 096968 00196868 1000BD27 */  addiu       $29, $29, 0x10
/* 09696C 0019686C 0800E003 */  jr          $31
/* 096970 00196870 00000000 */   nop
/* 096974 00196874 00000000 */  nop
/* 096978 00196878 00000000 */  nop
/* 09697C 0019687C 00000000 */  nop
