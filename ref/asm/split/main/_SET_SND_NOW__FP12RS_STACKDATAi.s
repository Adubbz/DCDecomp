.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_SND_NOW__FP12RS_STACKDATAi
/* 0E48F0 001E47F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E48F4 001E47F4 0000BF7F */  sq          $31, 0x0($29)
/* 0E48F8 001E47F8 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E48FC 001E47FC 00000000 */   nop
/* 0E4900 001E4800 28264070 */  paddub      $4, $2, $0
/* 0E4904 001E4804 FFFF0524 */  addiu       $5, $0, -0x1
/* 0E4908 001E4808 28360070 */  paddub      $6, $0, $0
/* 0E490C 001E480C AC69050C */  jal         SndSePlay__Fiii
/* 0E4910 001E4810 00000000 */   nop
/* 0E4914 001E4814 01000224 */  addiu       $2, $0, 0x1
/* 0E4918 001E4818 0000BF7B */  lq          $31, 0x0($29)
/* 0E491C 001E481C 1000BD27 */  addiu       $29, $29, 0x10
/* 0E4920 001E4820 0800E003 */  jr          $31
/* 0E4924 001E4824 00000000 */   nop
/* 0E4928 001E4828 00000000 */  nop
/* 0E492C 001E482C 00000000 */  nop
