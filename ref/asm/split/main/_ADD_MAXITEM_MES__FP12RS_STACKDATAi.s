.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _ADD_MAXITEM_MES__FP12RS_STACKDATAi
/* 090500 00190400 F0FFBD27 */  addiu       $29, $29, -0x10
/* 090504 00190404 0000BF7F */  sq          $31, 0x0($29)
/* 090508 00190408 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 09050C 0019040C 00000000 */   nop
/* 090510 00190410 04004104 */  bgez        $2, .L00190424
/* 090514 00190414 00000000 */   nop
/* 090518 00190418 28260070 */  paddub      $4, $0, $0
/* 09051C 0019041C 60CC050C */  jal         EdAddMaxItem__Fi
/* 090520 00190420 00000000 */   nop
.L00190424:
/* 090524 00190424 28264070 */  paddub      $4, $2, $0
/* 090528 00190428 28000524 */  addiu       $5, $0, 0x28
/* 09052C 0019042C 2481050C */  jal         MaxUpMes__Fii
/* 090530 00190430 00000000 */   nop
/* 090534 00190434 01000224 */  addiu       $2, $0, 0x1
/* 090538 00190438 0000BF7B */  lq          $31, 0x0($29)
/* 09053C 0019043C 1000BD27 */  addiu       $29, $29, 0x10
/* 090540 00190440 0800E003 */  jr          $31
/* 090544 00190444 00000000 */   nop
/* 090548 00190448 00000000 */  nop
/* 09054C 0019044C 00000000 */  nop
