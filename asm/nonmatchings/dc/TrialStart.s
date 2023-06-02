.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TrialStart__Fv
/* 42D70 00142C70 0800E003 */  jr         $31
/* 42D74 00142C74 00000000 */   nop
/* 42D78 00142C78 00000000 */  nop
/* 42D7C 00142C7C 00000000 */  nop
