.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdInitThunderEffect__Fv
/* 072450 00172350 5C8F80AF */  sw          $0, -0x70A4($28)
/* 072454 00172354 3C000324 */  addiu       $3, $0, 0x3C
/* 072458 00172358 648F83AF */  sw          $3, -0x709C($28)
/* 07245C 0017235C 608F80AF */  sw          $0, -0x70A0($28)
/* 072460 00172360 0800E003 */  jr          $31
/* 072464 00172364 00000000 */   nop
/* 072468 00172368 00000000 */  nop
/* 07246C 0017236C 00000000 */  nop
