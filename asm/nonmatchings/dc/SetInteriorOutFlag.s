.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetInteriorOutFlag__Fi
/* F40C0 001F3FC0 689584A7 */  sh         $4, -0x6A98($gp)
/* F40C4 001F3FC4 0800E003 */  jr         $31
/* F40C8 001F3FC8 00000000 */   nop
/* F40CC 001F3FCC 00000000 */  nop
