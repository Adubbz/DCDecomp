.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdExitLoop__Fv
/* 078210 00178110 01000224 */  addiu       $2, $0, 0x1
/* 078214 00178114 8C9082AF */  sw          $2, -0x6F74($28)
/* 078218 00178118 0800E003 */  jr          $31
/* 07821C 0017811C 00000000 */   nop
