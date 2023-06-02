.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DRAW_THUNDER__FP12RS_STACKDATAi
/* 935D0 001934D0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 935D4 001934D4 0000BF7F */  sq         $31, 0x0($sp)
/* 935D8 001934D8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 935DC 001934DC 00000000 */   nop
/* 935E0 001934E0 789082AF */  sw         $2, -0x6F88($gp)
/* 935E4 001934E4 01000224 */  addiu      $2, $0, 0x1
/* 935E8 001934E8 0000BF7B */  lq         $31, 0x0($sp)
/* 935EC 001934EC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 935F0 001934F0 0800E003 */  jr         $31
/* 935F4 001934F4 00000000 */   nop
/* 935F8 001934F8 00000000 */  nop
/* 935FC 001934FC 00000000 */  nop
