.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdAGetViewAngleV__Fv
/* 06A240 0016A140 048F80C7 */  lwc1        $f0, -0x70FC($28)
/* 06A244 0016A144 0800E003 */  jr          $31
/* 06A248 0016A148 00000000 */   nop
/* 06A24C 0016A14C 00000000 */  nop
