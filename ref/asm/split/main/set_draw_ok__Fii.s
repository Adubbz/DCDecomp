.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel set_draw_ok__Fii
/* 069540 00169440 EC8E85AF */  sw          $5, -0x7114($28)
/* 069544 00169444 1E000324 */  addiu       $3, $0, 0x1E
/* 069548 00169448 E48E83AF */  sw          $3, -0x711C($28)
/* 06954C 0016944C E88E84AF */  sw          $4, -0x7118($28)
/* 069550 00169450 0800E003 */  jr          $31
/* 069554 00169454 00000000 */   nop
/* 069558 00169458 00000000 */  nop
/* 06955C 0016945C 00000000 */  nop
