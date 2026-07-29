.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdStartDrawDay__Fv
/* 07D110 0017D010 A040033C */  lui         $3, (0x40A00000 >> 16)
/* 07D114 0017D014 B49183AF */  sw          $3, -0x6E4C($28)
/* 07D118 0017D018 01000324 */  addiu       $3, $0, 0x1
/* 07D11C 0017D01C B89183AF */  sw          $3, -0x6E48($28)
/* 07D120 0017D020 0800E003 */  jr          $31
/* 07D124 0017D024 00000000 */   nop
/* 07D128 0017D028 00000000 */  nop
/* 07D12C 0017D02C 00000000 */  nop
