.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _iDisableDmac
/* 141F0 001140F0 E3FF0324 */  addiu      $3, $0, -0x1D
/* 141F4 001140F4 0C000000 */  syscall    0
/* 141F8 001140F8 0800E003 */  jr         $31
/* 141FC 001140FC 00000000 */   nop
