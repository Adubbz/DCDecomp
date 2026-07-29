.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FrameNameComp__FPcPc
/* 0287E0 001286E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0287E4 001286E4 0000BF7F */  sq          $31, 0x0($29)
/* 0287E8 001286E8 7CA1040C */  jal         StrCmp__FPcPc
/* 0287EC 001286EC 00000000 */   nop
/* 0287F0 001286F0 0000BF7B */  lq          $31, 0x0($29)
/* 0287F4 001286F4 1000BD27 */  addiu       $29, $29, 0x10
/* 0287F8 001286F8 0800E003 */  jr          $31
/* 0287FC 001286FC 00000000 */   nop
