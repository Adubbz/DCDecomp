.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGGetAmbient__FPf
/* 2DE30 0012DD30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2DE34 0012DD34 0000BF7F */  sq         $31, 0x0($sp)
/* 2DE38 0012DD38 C701023C */  lui        $2, %hi(D_1C756B0)
/* 2DE3C 0012DD3C B0564524 */  addiu      $5, $2, %lo(D_1C756B0)
/* 2DE40 0012DD40 0C86040C */  jal        sceVu0CopyVector
/* 2DE44 0012DD44 00000000 */   nop
/* 2DE48 0012DD48 0000BF7B */  lq         $31, 0x0($sp)
/* 2DE4C 0012DD4C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2DE50 0012DD50 0800E003 */  jr         $31
/* 2DE54 0012DD54 00000000 */   nop
/* 2DE58 0012DD58 00000000 */  nop
/* 2DE5C 0012DD5C 00000000 */  nop
