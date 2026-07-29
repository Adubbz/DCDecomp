.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGGetAmbient__FPf
/* 02DE30 0012DD30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02DE34 0012DD34 0000BF7F */  sq          $31, 0x0($29)
/* 02DE38 0012DD38 C701023C */  lui         $2, %hi(mgRenderInfo + 0x190)
/* 02DE3C 0012DD3C B0564524 */  addiu       $5, $2, %lo(mgRenderInfo + 0x190)
/* 02DE40 0012DD40 0C86040C */  jal         sceVu0CopyVector
/* 02DE44 0012DD44 00000000 */   nop
/* 02DE48 0012DD48 0000BF7B */  lq          $31, 0x0($29)
/* 02DE4C 0012DD4C 1000BD27 */  addiu       $29, $29, 0x10
/* 02DE50 0012DD50 0800E003 */  jr          $31
/* 02DE54 0012DD54 00000000 */   nop
/* 02DE58 0012DD58 00000000 */  nop
/* 02DE5C 0012DD5C 00000000 */  nop
