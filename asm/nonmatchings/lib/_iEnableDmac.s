.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _iEnableDmac
/* 141E0 001140E0 E4FF0324 */  addiu      $3, $0, -0x1C
/* 141E4 001140E4 0C000000 */  syscall    0
/* 141E8 001140E8 0800E003 */  jr         $31
/* 141EC 001140EC 00000000 */   nop
