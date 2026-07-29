.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdAGetViewAngleH__Fv
/* 06A230 0016A130 008F80C7 */  lwc1        $f0, -0x7100($28)
/* 06A234 0016A134 0800E003 */  jr          $31
/* 06A238 0016A138 00000000 */   nop
/* 06A23C 0016A13C 00000000 */  nop
