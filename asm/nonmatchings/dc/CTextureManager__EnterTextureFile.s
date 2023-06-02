.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EnterTextureFile__15CTextureManagerFP16LOADTEXTURE_INFO
/* 34360 00134260 444E85AC */  sw         $5, 0x4E44($4)
/* 34364 00134264 01000224 */  addiu      $2, $0, 0x1
/* 34368 00134268 0800E003 */  jr         $31
/* 3436C 0013426C 00000000 */   nop
