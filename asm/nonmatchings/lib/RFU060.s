.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU060
/* 143E0 001142E0 3C000324 */  addiu      $3, $0, 0x3C
/* 143E4 001142E4 0C000000 */  syscall    0
/* 143E8 001142E8 0800E003 */  jr         $31
/* 143EC 001142EC 00000000 */   nop
