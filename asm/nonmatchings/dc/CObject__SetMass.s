.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMass__7CObjectFf
/* 56D80 00156C80 00008CE4 */  swc1       $f12, 0x0($4)
/* 56D84 00156C84 0800E003 */  jr         $31
/* 56D88 00156C88 00000000 */   nop
/* 56D8C 00156C8C 00000000 */  nop
