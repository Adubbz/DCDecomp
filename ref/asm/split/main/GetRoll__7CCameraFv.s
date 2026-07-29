.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRoll__7CCameraFv
/* 0247E0 001246E0 A00280C4 */  lwc1        $f0, 0x2A0($4)
/* 0247E4 001246E4 0800E003 */  jr          $31
/* 0247E8 001246E8 00000000 */   nop
/* 0247EC 001246EC 00000000 */  nop
