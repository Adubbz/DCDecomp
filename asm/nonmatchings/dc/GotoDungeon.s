.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GotoDungeon__Fv
/* 7EDE0 0017ECE0 01000224 */  addiu      $2, $0, 0x1
/* 7EDE4 0017ECE4 889082AF */  sw         $2, -0x6F78($gp)
/* 7EDE8 0017ECE8 0800E003 */  jr         $31
/* 7EDEC 0017ECEC 00000000 */   nop
