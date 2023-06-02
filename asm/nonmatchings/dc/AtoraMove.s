.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AtoraMove__Fv
/* 1121E0 002120E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1121E4 002120E4 0000BF7F */  sq         $31, 0x0($sp)
/* 1121E8 002120E8 6843080C */  jal        EditMenuExit__Fv
/* 1121EC 002120EC 00000000 */   nop
/* 1121F0 002120F0 03000224 */  addiu      $2, $0, 0x3
/* 1121F4 002120F4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 1121F8 002120F8 D09B22AC */  sw         $2, -0x6430($at)
/* 1121FC 002120FC 01000224 */  addiu      $2, $0, 0x1
/* 112200 00212100 0000BF7B */  lq         $31, 0x0($sp)
/* 112204 00212104 1000BD27 */  addiu      $sp, $sp, 0x10
/* 112208 00212108 0800E003 */  jr         $31
/* 11220C 0021210C 00000000 */   nop
