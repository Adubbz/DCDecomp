.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __empty
/* 00D6E8 0010D5E8 0800E003 */  jr          $31
/* 00D6EC 0010D5EC 00000000 */   nop
