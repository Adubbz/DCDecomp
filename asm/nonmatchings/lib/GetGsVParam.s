.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetGsVParam
/* 144F0 001143F0 4D000324 */  addiu      $3, $0, 0x4D
/* 144F4 001143F4 0C000000 */  syscall    0
/* 144F8 001143F8 0800E003 */  jr         $31
/* 144FC 001143FC 00000000 */   nop
