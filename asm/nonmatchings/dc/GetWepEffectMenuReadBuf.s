.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetWepEffectMenuReadBuf__Fv
/* 10D180 0020D080 EC95828F */  lw         $2, -0x6A14($gp)
/* 10D184 0020D084 0800E003 */  jr         $31
/* 10D188 0020D088 00000000 */   nop
/* 10D18C 0020D08C 00000000 */  nop
