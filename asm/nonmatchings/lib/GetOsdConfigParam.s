.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetOsdConfigParam
/* 144D0 001143D0 4B000324 */  addiu      $3, $0, 0x4B
/* 144D4 001143D4 0C000000 */  syscall    0
/* 144D8 001143D8 0800E003 */  jr         $31
/* 144DC 001143DC 00000000 */   nop
