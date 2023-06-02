.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __as__7CVisualFRC7CVisual
/* 434F0 001433F0 0000A28C */  lw         $2, 0x0($5)
/* 434F4 001433F4 000082AC */  sw         $2, 0x0($4)
/* 434F8 001433F8 0400A28C */  lw         $2, 0x4($5)
/* 434FC 001433FC 040082AC */  sw         $2, 0x4($4)
/* 43500 00143400 28168070 */  paddub     $2, $4, $0
/* 43504 00143404 0800E003 */  jr         $31
/* 43508 00143408 00000000 */   nop
/* 4350C 0014340C 00000000 */  nop
