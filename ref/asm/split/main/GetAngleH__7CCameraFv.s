.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetAngleH__7CCameraFv
/* 0247D0 001246D0 AC0280C4 */  lwc1        $f0, 0x2AC($4)
/* 0247D4 001246D4 0800E003 */  jr          $31
/* 0247D8 001246D8 00000000 */   nop
/* 0247DC 001246DC 00000000 */  nop
