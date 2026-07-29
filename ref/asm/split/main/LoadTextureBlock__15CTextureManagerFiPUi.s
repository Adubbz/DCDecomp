.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadTextureBlock__15CTextureManagerFiPUi
/* 033E30 00133D30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 033E34 00133D34 0000BF7F */  sq          $31, 0x0($29)
/* 033E38 00133D38 283EC070 */  paddub      $7, $6, $0
/* 033E3C 00133D3C 444E868C */  lw          $6, 0x4E44($4)
/* 033E40 00133D40 58CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP16LOADTEXTURE_INFOPUi
/* 033E44 00133D44 00000000 */   nop
/* 033E48 00133D48 0000BF7B */  lq          $31, 0x0($29)
/* 033E4C 00133D4C 1000BD27 */  addiu       $29, $29, 0x10
/* 033E50 00133D50 0800E003 */  jr          $31
/* 033E54 00133D54 00000000 */   nop
/* 033E58 00133D58 00000000 */  nop
/* 033E5C 00133D5C 00000000 */  nop
