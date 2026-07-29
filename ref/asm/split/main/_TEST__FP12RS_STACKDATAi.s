.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _TEST__FP12RS_STACKDATAi
/* 08B930 0018B830 01000224 */  addiu       $2, $0, 0x1
/* 08B934 0018B834 0800E003 */  jr          $31
/* 08B938 0018B838 00000000 */   nop
/* 08B93C 0018B83C 00000000 */  nop
