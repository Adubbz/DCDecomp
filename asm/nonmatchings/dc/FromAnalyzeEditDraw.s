.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FromAnalyzeEditDraw__Fv
/* 113080 00212F80 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 113084 00212F84 0000BF7F */  sq         $31, 0x0($sp)
/* 113088 00212F88 3C41080C */  jal        DrawMoveMenuIcon__Fv
/* 11308C 00212F8C 00000000 */   nop
/* 113090 00212F90 80000424 */  addiu      $4, $0, 0x80
/* 113094 00212F94 5C96838F */  lw         $3, -0x69A4($gp)
/* 113098 00212F98 80100300 */  sll        $2, $3, 2
/* 11309C 00212F9C 21104300 */  addu       $2, $2, $3
/* 1130A0 00212FA0 40100200 */  sll        $2, $2, 1
/* 1130A4 00212FA4 23208200 */  subu       $4, $4, $2
/* 1130A8 00212FA8 02008104 */  bgez       $4, .L00212FB4
/* 1130AC 00212FAC 00000000 */   nop
/* 1130B0 00212FB0 28260070 */  paddub     $4, $0, $0
.L00212FB4:
/* 1130B4 00212FB4 40000524 */  addiu      $5, $0, 0x40
/* 1130B8 00212FB8 4448080C */  jal        AnalyzeBackDraw__Fii
/* 1130BC 00212FBC 00000000 */   nop
/* 1130C0 00212FC0 0000BF7B */  lq         $31, 0x0($sp)
/* 1130C4 00212FC4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 1130C8 00212FC8 0800E003 */  jr         $31
/* 1130CC 00212FCC 00000000 */   nop
