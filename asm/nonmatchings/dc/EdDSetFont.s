.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdDSetFont__FP10CDebugFont
/* 70360 00170260 508F84AF */  sw         $4, -0x70B0($gp)
/* 70364 00170264 0800E003 */  jr         $31
/* 70368 00170268 00000000 */   nop
/* 7036C 0017026C 00000000 */  nop
