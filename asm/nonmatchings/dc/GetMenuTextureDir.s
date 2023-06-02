.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuTextureDir__Fv
/* 12BAF0 0022B9F0 2900023C */  lui        $2, %hi(AllMenuTextureDir)
/* 12BAF4 0022B9F4 60444224 */  addiu      $2, $2, %lo(AllMenuTextureDir)
/* 12BAF8 0022B9F8 0800E003 */  jr         $31
/* 12BAFC 0022B9FC 00000000 */   nop
