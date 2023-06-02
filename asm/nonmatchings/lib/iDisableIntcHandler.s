.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iDisableIntcHandler
/* 14610 00114510 A3FF0324 */  addiu      $3, $0, -0x5D
/* 14614 00114514 0C000000 */  syscall    0
/* 14618 00114518 0800E003 */  jr         $31
/* 1461C 0011451C 00000000 */   nop
