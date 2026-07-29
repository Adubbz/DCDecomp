.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckTrialEnd__Fv
/* 042D80 00142C80 28160070 */  paddub      $2, $0, $0
/* 042D84 00142C84 0800E003 */  jr          $31
/* 042D88 00142C88 00000000 */   nop
/* 042D8C 00142C8C 00000000 */  nop
