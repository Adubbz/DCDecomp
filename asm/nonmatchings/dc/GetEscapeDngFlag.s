.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetEscapeDngFlag__Fv
/* F40B0 001F3FB0 64958287 */  lh         $2, -0x6A9C($gp)
/* F40B4 001F3FB4 0800E003 */  jr         $31
/* F40B8 001F3FB8 00000000 */   nop
/* F40BC 001F3FBC 00000000 */  nop
