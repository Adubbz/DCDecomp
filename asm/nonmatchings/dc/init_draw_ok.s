.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel init_draw_ok__Fv
/* 69520 00169420 E48E80AF */  sw         $0, -0x711C($gp)
/* 69524 00169424 FFFF0324 */  addiu      $3, $0, -0x1
/* 69528 00169428 EC8E83AF */  sw         $3, -0x7114($gp)
/* 6952C 0016942C 0800E003 */  jr         $31
/* 69530 00169430 00000000 */   nop
/* 69534 00169434 00000000 */  nop
/* 69538 00169438 00000000 */  nop
/* 6953C 0016943C 00000000 */  nop
