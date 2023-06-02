.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel print
/* 147B0 001146B0 75000324 */  addiu      $3, $0, 0x75
/* 147B4 001146B4 0C000000 */  syscall    0
/* 147B8 001146B8 0800E003 */  jr         $31
/* 147BC 001146BC 00000000 */   nop
