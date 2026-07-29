.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GotoDungeon__Fv
/* 07EDE0 0017ECE0 01000224 */  addiu       $2, $0, 0x1
/* 07EDE4 0017ECE4 889082AF */  sw          $2, -0x6F78($28)
/* 07EDE8 0017ECE8 0800E003 */  jr          $31
/* 07EDEC 0017ECEC 00000000 */   nop
