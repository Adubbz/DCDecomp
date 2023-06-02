.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _TEST__FP12RS_STACKDATAi
/* 8B930 0018B830 01000224 */  addiu      $2, $0, 0x1
/* 8B934 0018B834 0800E003 */  jr         $31
/* 8B938 0018B838 00000000 */   nop
/* 8B93C 0018B83C 00000000 */  nop
