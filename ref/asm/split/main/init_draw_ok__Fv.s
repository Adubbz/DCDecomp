.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel init_draw_ok__Fv
/* 069520 00169420 E48E80AF */  sw          $0, -0x711C($28)
/* 069524 00169424 FFFF0324 */  addiu       $3, $0, -0x1
/* 069528 00169428 EC8E83AF */  sw          $3, -0x7114($28)
/* 06952C 0016942C 0800E003 */  jr          $31
/* 069530 00169430 00000000 */   nop
/* 069534 00169434 00000000 */  nop
/* 069538 00169438 00000000 */  nop
/* 06953C 0016943C 00000000 */  nop
