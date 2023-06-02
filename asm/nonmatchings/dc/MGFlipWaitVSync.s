.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGFlipWaitVSync__Fi
/* 2D7D0 0012D6D0 C48B84AF */  sw         $4, -0x743C($gp)
/* 2D7D4 0012D6D4 0800E003 */  jr         $31
/* 2D7D8 0012D6D8 00000000 */   nop
/* 2D7DC 0012D6DC 00000000 */  nop
