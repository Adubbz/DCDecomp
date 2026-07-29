.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetEffect__F11EFFECT_TYPEPcPfPfPf
/* 0A0040 0019FF40 0800E003 */  jr          $31
/* 0A0044 0019FF44 00000000 */   nop
/* 0A0048 0019FF48 00000000 */  nop
/* 0A004C 0019FF4C 00000000 */  nop
