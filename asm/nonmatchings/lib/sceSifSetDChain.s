.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifSetDChain
/* 14800 00114700 78000324 */  addiu      $3, $0, 0x78
/* 14804 00114704 0C000000 */  syscall    0
/* 14808 00114708 0800E003 */  jr         $31
/* 1480C 0011470C 00000000 */   nop
