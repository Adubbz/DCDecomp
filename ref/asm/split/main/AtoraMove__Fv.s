.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AtoraMove__Fv
/* 1121E0 002120E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 1121E4 002120E4 0000BF7F */  sq          $31, 0x0($29)
/* 1121E8 002120E8 6843080C */  jal         EditMenuExit__Fv
/* 1121EC 002120EC 00000000 */   nop
/* 1121F0 002120F0 03000224 */  addiu       $2, $0, 0x3
/* 1121F4 002120F4 D201013C */  lui         $1, %hi(EditMenuStatus)
/* 1121F8 002120F8 D09B22AC */  sw          $2, %lo(EditMenuStatus)($1)
/* 1121FC 002120FC 01000224 */  addiu       $2, $0, 0x1
/* 112200 00212100 0000BF7B */  lq          $31, 0x0($29)
/* 112204 00212104 1000BD27 */  addiu       $29, $29, 0x10
/* 112208 00212108 0800E003 */  jr          $31
/* 11220C 0021210C 00000000 */   nop
