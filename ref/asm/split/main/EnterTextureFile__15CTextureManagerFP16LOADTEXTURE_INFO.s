.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EnterTextureFile__15CTextureManagerFP16LOADTEXTURE_INFO
/* 034360 00134260 444E85AC */  sw          $5, 0x4E44($4)
/* 034364 00134264 01000224 */  addiu       $2, $0, 0x1
/* 034368 00134268 0800E003 */  jr          $31
/* 03436C 0013426C 00000000 */   nop
