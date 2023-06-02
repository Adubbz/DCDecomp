.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel pop__10CRunScriptFv
/* 13DC80 0023DB80 1000A68C */  lw         $6, 0x10($5)
/* 13DC84 0023DB84 F8FFC324 */  addiu      $3, $6, -0x8
/* 13DC88 0023DB88 1000A3AC */  sw         $3, 0x10($5)
/* 13DC8C 0023DB8C F8FFC1C4 */  lwc1       $f1, -0x8($6)
/* 13DC90 0023DB90 FCFFC0C4 */  lwc1       $f0, -0x4($6)
/* 13DC94 0023DB94 000081E4 */  swc1       $f1, 0x0($4)
/* 13DC98 0023DB98 040080E4 */  swc1       $f0, 0x4($4)
/* 13DC9C 0023DB9C 0800E003 */  jr         $31
/* 13DCA0 0023DBA0 00000000 */   nop
/* 13DCA4 0023DBA4 00000000 */  nop
/* 13DCA8 0023DBA8 00000000 */  nop
/* 13DCAC 0023DBAC 00000000 */  nop
