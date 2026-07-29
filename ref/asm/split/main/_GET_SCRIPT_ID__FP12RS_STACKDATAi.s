.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_SCRIPT_ID__FP12RS_STACKDATAi
/* 0E49F0 001E48F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E49F4 001E48F4 0000BF7F */  sq          $31, 0x0($29)
/* 0E49F8 001E48F8 E09C828F */  lw          $2, -0x6320($28)
/* 0E49FC 001E48FC 9000458C */  lw          $5, 0x90($2)
/* 0E4A00 001E4900 B485070C */  jal         SetStack__FP12RS_STACKDATAi__3
/* 0E4A04 001E4904 00000000 */   nop
/* 0E4A08 001E4908 01000224 */  addiu       $2, $0, 0x1
/* 0E4A0C 001E490C 0000BF7B */  lq          $31, 0x0($29)
/* 0E4A10 001E4910 1000BD27 */  addiu       $29, $29, 0x10
/* 0E4A14 001E4914 0800E003 */  jr          $31
/* 0E4A18 001E4918 00000000 */   nop
/* 0E4A1C 001E491C 00000000 */  nop
