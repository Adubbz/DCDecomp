.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetEffect__F11EFFECT_TYPEPcPfPfPf
/* A0040 0019FF40 0800E003 */  jr         $31
/* A0044 0019FF44 00000000 */   nop
/* A0048 0019FF48 00000000 */  nop
/* A004C 0019FF4C 00000000 */  nop
