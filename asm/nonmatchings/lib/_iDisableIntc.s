.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _iDisableIntc
/* 141D0 001140D0 E5FF0324 */  addiu      $3, $0, -0x1B
/* 141D4 001140D4 0C000000 */  syscall    0
/* 141D8 001140D8 0800E003 */  jr         $31
/* 141DC 001140DC 00000000 */   nop
