.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel TrialEndLoop__Fv
/* 042D60 00142C60 01000224 */  addiu       $2, $0, 0x1
/* 042D64 00142C64 0800E003 */  jr          $31
/* 042D68 00142C68 00000000 */   nop
/* 042D6C 00142C6C 00000000 */  nop
