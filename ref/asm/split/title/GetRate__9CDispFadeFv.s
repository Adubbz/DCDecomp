.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRate__9CDispFadeFv
/* 001540 01DAD240 000080C4 */  lwc1        $f0, 0x0($4)
/* 001544 01DAD244 0800E003 */  jr          $31
/* 001548 01DAD248 00000000 */   nop
/* 00154C 01DAD24C 00000000 */  nop
