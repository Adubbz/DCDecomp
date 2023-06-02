.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetStackString__FP12RS_STACKDATA_2
/* BBAB0 001BB9B0 0400828C */  lw         $2, 0x4($4)
/* BBAB4 001BB9B4 0800E003 */  jr         $31
/* BBAB8 001BB9B8 00000000 */   nop
/* BBABC 001BB9BC 00000000 */  nop
