.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GOTO_FISH_RANKING__FP12RS_STACKDATAi
/* 8C2A0 0018C1A0 0A000224 */  addiu      $2, $0, 0xA
/* 8C2A4 0018C1A4 289282AF */  sw         $2, -0x6DD8($gp)
/* 8C2A8 0018C1A8 01000224 */  addiu      $2, $0, 0x1
/* 8C2AC 0018C1AC 0800E003 */  jr         $31
/* 8C2B0 0018C1B0 00000000 */   nop
/* 8C2B4 0018C1B4 00000000 */  nop
/* 8C2B8 0018C1B8 00000000 */  nop
/* 8C2BC 0018C1BC 00000000 */  nop
