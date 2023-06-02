.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetInteriorOutFlag__Fv
/* F40D0 001F3FD0 68958287 */  lh         $2, -0x6A98($gp)
/* F40D4 001F3FD4 0800E003 */  jr         $31
/* F40D8 001F3FD8 00000000 */   nop
/* F40DC 001F3FDC 00000000 */  nop
