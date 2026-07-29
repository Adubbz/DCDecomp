.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdSetCharaCursor__Fi
/* 07CCE0 0017CBE0 B49084AF */  sw          $4, -0x6F4C($28)
/* 07CCE4 0017CBE4 0800E003 */  jr          $31
/* 07CCE8 0017CBE8 00000000 */   nop
/* 07CCEC 0017CBEC 00000000 */  nop
