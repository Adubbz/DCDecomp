.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetGsHParam
/* 144E0 001143E0 4C000324 */  addiu      $3, $0, 0x4C
/* 144E4 001143E4 0C000000 */  syscall    0
/* 144E8 001143E8 0800E003 */  jr         $31
/* 144EC 001143EC 00000000 */   nop
