.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetSpeed__7CCameraFf
/* 24750 00124650 A8028CE4 */  swc1       $f12, 0x2A8($4)
/* 24754 00124654 0800E003 */  jr         $31
/* 24758 00124658 00000000 */   nop
/* 2475C 0012465C 00000000 */  nop
