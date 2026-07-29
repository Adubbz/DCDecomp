.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel TrialEndInit__Fv
/* 042D50 00142C50 0800E003 */  jr          $31
/* 042D54 00142C54 00000000 */   nop
/* 042D58 00142C58 00000000 */  nop
/* 042D5C 00142C5C 00000000 */  nop
