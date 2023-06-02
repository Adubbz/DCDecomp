.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AtoraSelectDraw__Fv
/* 111FB0 00211EB0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 111FB4 00211EB4 0000BF7F */  sq         $31, 0x0($sp)
/* 111FB8 00211EB8 3C96828F */  lw         $2, -0x69C4($gp)
/* 111FBC 00211EBC 07004014 */  bnez       $2, .L00211EDC
/* 111FC0 00211EC0 00000000 */   nop
/* 111FC4 00211EC4 8CFB040C */  jal        ReadBGSync__Fv
/* 111FC8 00211EC8 00000000 */   nop
/* 111FCC 00211ECC 03004014 */  bnez       $2, .L00211EDC
/* 111FD0 00211ED0 00000000 */   nop
/* 111FD4 00211ED4 01000224 */  addiu      $2, $0, 0x1
/* 111FD8 00211ED8 3C9682AF */  sw         $2, -0x69C4($gp)
.L00211EDC:
/* 111FDC 00211EDC A06A080C */  jal        DrawMenuAtoraSelect__Fv
/* 111FE0 00211EE0 00000000 */   nop
/* 111FE4 00211EE4 78968387 */  lh         $3, -0x6988($gp)
/* 111FE8 00211EE8 02000224 */  addiu      $2, $0, 0x2
/* 111FEC 00211EEC 06006210 */  beq        $3, $2, .L00211F08
/* 111FF0 00211EF0 00000000 */   nop
/* 111FF4 00211EF4 01000224 */  addiu      $2, $0, 0x1
/* 111FF8 00211EF8 03006210 */  beq        $3, $2, .L00211F08
/* 111FFC 00211EFC 00000000 */   nop
/* 112000 00211F00 05000010 */  b          .L00211F18
/* 112004 00211F04 00000000 */   nop
.L00211F08:
/* 112008 00211F08 3C41080C */  jal        DrawMoveMenuIcon__Fv
/* 11200C 00211F0C 00000000 */   nop
/* 112010 00211F10 07000010 */  b          .L00211F30
/* 112014 00211F14 00000000 */   nop
.L00211F18:
/* 112018 00211F18 2468080C */  jal        GetMenuAtraEventFlag__Fv
/* 11201C 00211F1C 00000000 */   nop
/* 112020 00211F20 03004014 */  bnez       $2, .L00211F30
/* 112024 00211F24 00000000 */   nop
/* 112028 00211F28 3C41080C */  jal        DrawMoveMenuIcon__Fv
/* 11202C 00211F2C 00000000 */   nop
.L00211F30:
/* 112030 00211F30 0000BF7B */  lq         $31, 0x0($sp)
/* 112034 00211F34 1000BD27 */  addiu      $sp, $sp, 0x10
/* 112038 00211F38 0800E003 */  jr         $31
/* 11203C 00211F3C 00000000 */   nop
