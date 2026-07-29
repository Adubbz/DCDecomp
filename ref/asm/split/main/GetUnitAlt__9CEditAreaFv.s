.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetUnitAlt__9CEditAreaFv
/* 070310 00170210 240080C4 */  lwc1        $f0, 0x24($4)
/* 070314 00170214 0800E003 */  jr          $31
/* 070318 00170218 00000000 */   nop
/* 07031C 0017021C 00000000 */  nop
