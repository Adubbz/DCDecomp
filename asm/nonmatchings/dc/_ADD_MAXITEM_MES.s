.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ADD_MAXITEM_MES__FP12RS_STACKDATAi
/* 90500 00190400 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 90504 00190404 0000BF7F */  sq         $31, 0x0($sp)
/* 90508 00190408 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9050C 0019040C 00000000 */   nop
/* 90510 00190410 04004104 */  bgez       $2, .L00190424
/* 90514 00190414 00000000 */   nop
/* 90518 00190418 28260070 */  paddub     $4, $0, $0
/* 9051C 0019041C 60CC050C */  jal        EdAddMaxItem__Fi
/* 90520 00190420 00000000 */   nop
.L00190424:
/* 90524 00190424 28264070 */  paddub     $4, $2, $0
/* 90528 00190428 28000524 */  addiu      $5, $0, 0x28
/* 9052C 0019042C 2481050C */  jal        MaxUpMes__Fii
/* 90530 00190430 00000000 */   nop
/* 90534 00190434 01000224 */  addiu      $2, $0, 0x1
/* 90538 00190438 0000BF7B */  lq         $31, 0x0($sp)
/* 9053C 0019043C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 90540 00190440 0800E003 */  jr         $31
/* 90544 00190444 00000000 */   nop
/* 90548 00190448 00000000 */  nop
/* 9054C 0019044C 00000000 */  nop
