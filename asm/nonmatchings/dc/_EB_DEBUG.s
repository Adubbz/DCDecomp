.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _EB_DEBUG__FP12RS_STACKDATAi
/* 96980 00196880 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 96984 00196884 0000BF7F */  sq         $31, 0x0($sp)
/* 96988 00196888 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9698C 0019688C 00000000 */   nop
/* 96990 00196890 28264070 */  paddub     $4, $2, $0
/* 96994 00196894 08A1050C */  jal        EBDebug__Fi
/* 96998 00196898 00000000 */   nop
/* 9699C 0019689C 01000224 */  addiu      $2, $0, 0x1
/* 969A0 001968A0 0000BF7B */  lq         $31, 0x0($sp)
/* 969A4 001968A4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 969A8 001968A8 0800E003 */  jr         $31
/* 969AC 001968AC 00000000 */   nop
