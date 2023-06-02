.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EditMenuToExitDraw__Fv
/* 111E40 00211D40 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 111E44 00211D44 0000BF7F */  sq         $31, 0x0($sp)
/* 111E48 00211D48 3C41080C */  jal        DrawMoveMenuIcon__Fv
/* 111E4C 00211D4C 00000000 */   nop
/* 111E50 00211D50 0000BF7B */  lq         $31, 0x0($sp)
/* 111E54 00211D54 1000BD27 */  addiu      $sp, $sp, 0x10
/* 111E58 00211D58 0800E003 */  jr         $31
/* 111E5C 00211D5C 00000000 */   nop
