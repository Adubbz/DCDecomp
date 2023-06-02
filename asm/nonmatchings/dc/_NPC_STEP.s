.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _NPC_STEP__FP12RS_STACKDATAi
/* 8F1A0 0018F0A0 01000224 */  addiu      $2, $0, 0x1
/* 8F1A4 0018F0A4 0800E003 */  jr         $31
/* 8F1A8 0018F0A8 00000000 */   nop
/* 8F1AC 0018F0AC 00000000 */  nop
