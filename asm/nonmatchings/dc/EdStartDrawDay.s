.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdStartDrawDay__Fv
/* 7D110 0017D010 A040033C */  lui        $3, (0x40A00000 >> 16)
/* 7D114 0017D014 B49183AF */  sw         $3, -0x6E4C($gp)
/* 7D118 0017D018 01000324 */  addiu      $3, $0, 0x1
/* 7D11C 0017D01C B89183AF */  sw         $3, -0x6E48($gp)
/* 7D120 0017D020 0800E003 */  jr         $31
/* 7D124 0017D024 00000000 */   nop
/* 7D128 0017D028 00000000 */  nop
/* 7D12C 0017D02C 00000000 */  nop
