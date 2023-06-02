.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetWepEffectMenuReadBuf__FP1
/* 10D1A0 0020D0A0 EC9584AF */  sw         $4, -0x6A14($gp)
/* 10D1A4 0020D0A4 0800E003 */  jr         $31
/* 10D1A8 0020D0A8 00000000 */   nop
/* 10D1AC 0020D0AC 00000000 */  nop
