.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set_draw_ok__Fii
/* 69540 00169440 EC8E85AF */  sw         $5, -0x7114($gp)
/* 69544 00169444 1E000324 */  addiu      $3, $0, 0x1E
/* 69548 00169448 E48E83AF */  sw         $3, -0x711C($gp)
/* 6954C 0016944C E88E84AF */  sw         $4, -0x7118($gp)
/* 69550 00169450 0800E003 */  jr         $31
/* 69554 00169454 00000000 */   nop
/* 69558 00169458 00000000 */  nop
/* 6955C 0016945C 00000000 */  nop
