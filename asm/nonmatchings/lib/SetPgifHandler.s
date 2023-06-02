.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPgifHandler
/* 14780 00114680 72000324 */  addiu      $3, $0, 0x72
/* 14784 00114684 0C000000 */  syscall    0
/* 14788 00114688 0800E003 */  jr         $31
/* 1478C 0011468C 00000000 */   nop
