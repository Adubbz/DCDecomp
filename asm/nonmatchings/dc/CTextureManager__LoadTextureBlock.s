.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadTextureBlock__15CTextureManagerFiPUi
/* 33E30 00133D30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 33E34 00133D34 0000BF7F */  sq         $31, 0x0($sp)
/* 33E38 00133D38 283EC070 */  paddub     $7, $6, $0
/* 33E3C 00133D3C 444E868C */  lw         $6, 0x4E44($4)
/* 33E40 00133D40 58CF040C */  jal        LoadTextureBlock__15CTextureManagerFiP16LOADTEXTURE_INFOPUi
/* 33E44 00133D44 00000000 */   nop
/* 33E48 00133D48 0000BF7B */  lq         $31, 0x0($sp)
/* 33E4C 00133D4C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 33E50 00133D50 0800E003 */  jr         $31
/* 33E54 00133D54 00000000 */   nop
/* 33E58 00133D58 00000000 */  nop
/* 33E5C 00133D5C 00000000 */  nop
