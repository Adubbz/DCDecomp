.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TrialEndLoop__Fv
/* 42D60 00142C60 01000224 */  addiu      $2, $0, 0x1
/* 42D64 00142C64 0800E003 */  jr         $31
/* 42D68 00142C68 00000000 */   nop
/* 42D6C 00142C6C 00000000 */  nop
