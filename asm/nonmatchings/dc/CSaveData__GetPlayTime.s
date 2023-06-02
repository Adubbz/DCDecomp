.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPlayTime__9CSaveDataFv
/* 57CB0 00157BB0 D401828C */  lw         $2, 0x1D4($4)
/* 57CB4 00157BB4 0800E003 */  jr         $31
/* 57CB8 00157BB8 00000000 */   nop
/* 57CBC 00157BBC 00000000 */  nop
