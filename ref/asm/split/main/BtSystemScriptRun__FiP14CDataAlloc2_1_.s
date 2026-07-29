.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtSystemScriptRun__FiP14CDataAlloc2_1_
/* 0BB9F0 001BB8F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BB9F4 001BB8F4 0000BF7F */  sq          $31, 0x0($29)
/* 0BB9F8 001BB8F8 109E868F */  lw          $6, -0x61F0($28)
/* 0BB9FC 001BB8FC EC5C060C */  jal         EdEventInit__FiP14CDataAlloc2_1_Pc
/* 0BBA00 001BB900 00000000 */   nop
/* 0BBA04 001BB904 0000BF7B */  lq          $31, 0x0($29)
/* 0BBA08 001BB908 1000BD27 */  addiu       $29, $29, 0x10
/* 0BBA0C 001BB90C 0800E003 */  jr          $31
/* 0BBA10 001BB910 00000000 */   nop
/* 0BBA14 001BB914 00000000 */  nop
/* 0BBA18 001BB918 00000000 */  nop
/* 0BBA1C 001BB91C 00000000 */  nop
