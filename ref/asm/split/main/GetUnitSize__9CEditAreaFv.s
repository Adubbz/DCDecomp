.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetUnitSize__9CEditAreaFv
/* 070300 00170200 200080C4 */  lwc1        $f0, 0x20($4)
/* 070304 00170204 0800E003 */  jr          $31
/* 070308 00170208 00000000 */   nop
/* 07030C 0017020C 00000000 */  nop
