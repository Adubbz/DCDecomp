.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckTrialEnd__Fv
/* 42D80 00142C80 28160070 */  paddub     $2, $0, $0
/* 42D84 00142C84 0800E003 */  jr         $31
/* 42D88 00142C88 00000000 */   nop
/* 42D8C 00142C8C 00000000 */  nop
