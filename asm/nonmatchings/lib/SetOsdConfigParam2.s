.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetOsdConfigParam2
/* 14720 00114620 6E000324 */  addiu      $3, $0, 0x6E
/* 14724 00114624 0C000000 */  syscall    0
/* 14728 00114628 0800E003 */  jr         $31
/* 1472C 0011462C 00000000 */   nop
