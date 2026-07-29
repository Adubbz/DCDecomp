.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetMonsterNameDrawFlag__Fi
/* 10EC60 0020EB60 209684A7 */  sh          $4, -0x69E0($28)
/* 10EC64 0020EB64 0800E003 */  jr          $31
/* 10EC68 0020EB68 00000000 */   nop
/* 10EC6C 0020EB6C 00000000 */  nop
