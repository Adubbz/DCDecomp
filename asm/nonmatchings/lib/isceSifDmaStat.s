.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel isceSifDmaStat
/* 147D0 001146D0 8AFF0324 */  addiu      $3, $0, -0x76
/* 147D4 001146D4 0C000000 */  syscall    0
/* 147D8 001146D8 0800E003 */  jr         $31
/* 147DC 001146DC 00000000 */   nop
