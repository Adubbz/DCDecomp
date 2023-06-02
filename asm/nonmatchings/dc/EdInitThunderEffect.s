.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdInitThunderEffect__Fv
/* 72450 00172350 5C8F80AF */  sw         $0, -0x70A4($gp)
/* 72454 00172354 3C000324 */  addiu      $3, $0, 0x3C
/* 72458 00172358 648F83AF */  sw         $3, -0x709C($gp)
/* 7245C 0017235C 608F80AF */  sw         $0, -0x70A0($gp)
/* 72460 00172360 0800E003 */  jr         $31
/* 72464 00172364 00000000 */   nop
/* 72468 00172368 00000000 */  nop
/* 7246C 0017236C 00000000 */  nop
