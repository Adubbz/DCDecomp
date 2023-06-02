.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DisableDmacHandler
/* 14640 00114540 5F000324 */  addiu      $3, $0, 0x5F
/* 14644 00114544 0C000000 */  syscall    0
/* 14648 00114548 0800E003 */  jr         $31
/* 1464C 0011454C 00000000 */   nop
