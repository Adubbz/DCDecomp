.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetWepEffectMenuReadBuf__Fv
/* 10D180 0020D080 EC95828F */  lw          $2, -0x6A14($28)
/* 10D184 0020D084 0800E003 */  jr          $31
/* 10D188 0020D088 00000000 */   nop
/* 10D18C 0020D08C 00000000 */  nop
