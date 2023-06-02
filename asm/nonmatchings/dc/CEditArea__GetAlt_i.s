.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAlt_i__9CEditAreaFii
/* 6DDE0 0016DCE0 0500A004 */  bltz       $5, .L0016DCF8
/* 6DDE4 0016DCE4 00000000 */   nop
/* 6DDE8 0016DCE8 0800828C */  lw         $2, 0x8($4)
/* 6DDEC 0016DCEC 2A10A200 */  slt        $2, $5, $2
/* 6DDF0 0016DCF0 04004014 */  bnez       $2, .L0016DD04
/* 6DDF4 0016DCF4 00000000 */   nop
.L0016DCF8:
/* 6DDF8 0016DCF8 28160070 */  paddub     $2, $0, $0
/* 6DDFC 0016DCFC 14000010 */  b          .L0016DD50
/* 6DE00 0016DD00 00000000 */   nop
.L0016DD04:
/* 6DE04 0016DD04 0500C004 */  bltz       $6, .L0016DD1C
/* 6DE08 0016DD08 00000000 */   nop
/* 6DE0C 0016DD0C 0C00828C */  lw         $2, 0xC($4)
/* 6DE10 0016DD10 2A10C200 */  slt        $2, $6, $2
/* 6DE14 0016DD14 04004014 */  bnez       $2, .L0016DD28
/* 6DE18 0016DD18 00000000 */   nop
.L0016DD1C:
/* 6DE1C 0016DD1C 28160070 */  paddub     $2, $0, $0
/* 6DE20 0016DD20 0B000010 */  b          .L0016DD50
/* 6DE24 0016DD24 00000000 */   nop
.L0016DD28:
/* 6DE28 0016DD28 C0100500 */  sll        $2, $5, 3
/* 6DE2C 0016DD2C 23104500 */  subu       $2, $2, $5
/* 6DE30 0016DD30 80110200 */  sll        $2, $2, 6
/* 6DE34 0016DD34 21184400 */  addu       $3, $2, $4
/* 6DE38 0016DD38 C0100600 */  sll        $2, $6, 3
/* 6DE3C 0016DD3C 23104600 */  subu       $2, $2, $6
/* 6DE40 0016DD40 80100200 */  sll        $2, $2, 2
/* 6DE44 0016DD44 21104300 */  addu       $2, $2, $3
/* 6DE48 0016DD48 2C00428C */  lw         $2, 0x2C($2)
/* 6DE4C 0016DD4C 00000000 */  nop
.L0016DD50:
/* 6DE50 0016DD50 0800E003 */  jr         $31
/* 6DE54 0016DD54 00000000 */   nop
/* 6DE58 0016DD58 00000000 */  nop
/* 6DE5C 0016DD5C 00000000 */  nop
