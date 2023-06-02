.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _iEnableIntc
/* 141C0 001140C0 E6FF0324 */  addiu      $3, $0, -0x1A
/* 141C4 001140C4 0C000000 */  syscall    0
/* 141C8 001140C8 0800E003 */  jr         $31
/* 141CC 001140CC 00000000 */   nop
