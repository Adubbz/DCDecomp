.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SADD_MAXITEM__FP12RS_STACKDATAi
/* 95840 00195740 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 95844 00195744 0000BF7F */  sq         $31, 0x0($sp)
/* 95848 00195748 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9584C 0019574C 00000000 */   nop
/* 95850 00195750 28264070 */  paddub     $4, $2, $0
/* 95854 00195754 60CC050C */  jal        EdAddMaxItem__Fi
/* 95858 00195758 00000000 */   nop
/* 9585C 0019575C 01000224 */  addiu      $2, $0, 0x1
/* 95860 00195760 0000BF7B */  lq         $31, 0x0($sp)
/* 95864 00195764 1000BD27 */  addiu      $sp, $sp, 0x10
/* 95868 00195768 0800E003 */  jr         $31
/* 9586C 0019576C 00000000 */   nop
