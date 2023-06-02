.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RFU086_WaitEvnetFlag
/* 14580 00114480 56000324 */  addiu      $3, $0, 0x56
/* 14584 00114484 0C000000 */  syscall    0
/* 14588 00114488 0800E003 */  jr         $31
/* 1458C 0011448C 00000000 */   nop
