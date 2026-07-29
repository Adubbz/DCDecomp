.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdASetViewAngle__Fff
/* 06A250 0016A150 008F8CE7 */  swc1        $f12, -0x7100($28)
/* 06A254 0016A154 048F8DE7 */  swc1        $f13, -0x70FC($28)
/* 06A258 0016A158 0800E003 */  jr          $31
/* 06A25C 0016A15C 00000000 */   nop
