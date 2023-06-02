.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _EB_INTRO_END__FP12RS_STACKDATAi
/* 96950 00196850 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 96954 00196854 0000BF7F */  sq         $31, 0x0($sp)
/* 96958 00196858 58A1050C */  jal        EBExit__Fv
/* 9695C 0019685C 00000000 */   nop
/* 96960 00196860 01000224 */  addiu      $2, $0, 0x1
/* 96964 00196864 0000BF7B */  lq         $31, 0x0($sp)
/* 96968 00196868 1000BD27 */  addiu      $sp, $sp, 0x10
/* 9696C 0019686C 0800E003 */  jr         $31
/* 96970 00196870 00000000 */   nop
/* 96974 00196874 00000000 */  nop
/* 96978 00196878 00000000 */  nop
/* 9697C 0019687C 00000000 */  nop
