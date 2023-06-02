.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel isceSifSetDma
/* 147F0 001146F0 89FF0324 */  addiu      $3, $0, -0x77
/* 147F4 001146F4 0C000000 */  syscall    0
/* 147F8 001146F8 0800E003 */  jr         $31
/* 147FC 001146FC 00000000 */   nop
