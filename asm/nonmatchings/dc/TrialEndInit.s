.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TrialEndInit__Fv
/* 42D50 00142C50 0800E003 */  jr         $31
/* 42D54 00142C54 00000000 */   nop
/* 42D58 00142C58 00000000 */  nop
/* 42D5C 00142C5C 00000000 */  nop
