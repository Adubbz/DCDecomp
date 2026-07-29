.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _STOP_SND_NOW__FP12RS_STACKDATAi
/* 0E4930 001E4830 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E4934 001E4834 0000BF7F */  sq          $31, 0x0($29)
/* 0E4938 001E4838 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E493C 001E483C 00000000 */   nop
/* 0E4940 001E4840 28264070 */  paddub      $4, $2, $0
/* 0E4944 001E4844 282E0070 */  paddub      $5, $0, $0
/* 0E4948 001E4848 2C6A050C */  jal         SndSeStop__Fii
/* 0E494C 001E484C 00000000 */   nop
/* 0E4950 001E4850 01000224 */  addiu       $2, $0, 0x1
/* 0E4954 001E4854 0000BF7B */  lq          $31, 0x0($29)
/* 0E4958 001E4858 1000BD27 */  addiu       $29, $29, 0x10
/* 0E495C 001E485C 0800E003 */  jr          $31
/* 0E4960 001E4860 00000000 */   nop
/* 0E4964 001E4864 00000000 */  nop
/* 0E4968 001E4868 00000000 */  nop
/* 0E496C 001E486C 00000000 */  nop
