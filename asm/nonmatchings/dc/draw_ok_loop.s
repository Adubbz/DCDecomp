.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel draw_ok_loop__Fv
/* 69560 00169460 E48E838F */  lw         $3, -0x711C($gp)
/* 69564 00169464 07006018 */  blez       $3, .L00169484
/* 69568 00169468 00000000 */   nop
/* 6956C 0016946C FFFF6324 */  addiu      $3, $3, -0x1
/* 69570 00169470 E48E83AF */  sw         $3, -0x711C($gp)
/* 69574 00169474 E48E838F */  lw         $3, -0x711C($gp)
/* 69578 00169478 02006104 */  bgez       $3, .L00169484
/* 6957C 0016947C 00000000 */   nop
/* 69580 00169480 E48E80AF */  sw         $0, -0x711C($gp)
.L00169484:
/* 69584 00169484 0800E003 */  jr         $31
/* 69588 00169488 00000000 */   nop
/* 6958C 0016948C 00000000 */  nop
