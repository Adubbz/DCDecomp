.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel TrialStart__Fv
/* 042D70 00142C70 0800E003 */  jr          $31
/* 042D74 00142C74 00000000 */   nop
/* 042D78 00142C78 00000000 */  nop
/* 042D7C 00142C7C 00000000 */  nop
