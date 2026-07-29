.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EBDebug__Fi
/* 068520 00168420 D48E84AF */  sw          $4, -0x712C($28)
/* 068524 00168424 0800E003 */  jr          $31
/* 068528 00168428 00000000 */   nop
/* 06852C 0016842C 00000000 */  nop
