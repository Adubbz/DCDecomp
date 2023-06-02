.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetOsdConfigParam
/* 144C0 001143C0 4A000324 */  addiu      $3, $0, 0x4A
/* 144C4 001143C4 0C000000 */  syscall    0
/* 144C8 001143C8 0800E003 */  jr         $31
/* 144CC 001143CC 00000000 */   nop
