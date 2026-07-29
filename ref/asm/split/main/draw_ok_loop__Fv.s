.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel draw_ok_loop__Fv
/* 069560 00169460 E48E838F */  lw          $3, -0x711C($28)
/* 069564 00169464 07006018 */  blez        $3, .L00169484
/* 069568 00169468 00000000 */   nop
/* 06956C 0016946C FFFF6324 */  addiu       $3, $3, -0x1
/* 069570 00169470 E48E83AF */  sw          $3, -0x711C($28)
/* 069574 00169474 E48E838F */  lw          $3, -0x711C($28)
/* 069578 00169478 02006104 */  bgez        $3, .L00169484
/* 06957C 0016947C 00000000 */   nop
/* 069580 00169480 E48E80AF */  sw          $0, -0x711C($28)
.L00169484:
/* 069584 00169484 0800E003 */  jr          $31
/* 069588 00169488 00000000 */   nop
/* 06958C 0016948C 00000000 */  nop
