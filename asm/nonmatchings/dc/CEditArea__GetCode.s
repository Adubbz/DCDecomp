.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetCode__9CEditAreaFii
/* 6DCD0 0016DBD0 0500A004 */  bltz       $5, .L0016DBE8
/* 6DCD4 0016DBD4 00000000 */   nop
/* 6DCD8 0016DBD8 0800828C */  lw         $2, 0x8($4)
/* 6DCDC 0016DBDC 2A10A200 */  slt        $2, $5, $2
/* 6DCE0 0016DBE0 04004014 */  bnez       $2, .L0016DBF4
/* 6DCE4 0016DBE4 00000000 */   nop
.L0016DBE8:
/* 6DCE8 0016DBE8 FFFF0224 */  addiu      $2, $0, -0x1
/* 6DCEC 0016DBEC 14000010 */  b          .L0016DC40
/* 6DCF0 0016DBF0 00000000 */   nop
.L0016DBF4:
/* 6DCF4 0016DBF4 0500C004 */  bltz       $6, .L0016DC0C
/* 6DCF8 0016DBF8 00000000 */   nop
/* 6DCFC 0016DBFC 0C00828C */  lw         $2, 0xC($4)
/* 6DD00 0016DC00 2A10C200 */  slt        $2, $6, $2
/* 6DD04 0016DC04 04004014 */  bnez       $2, .L0016DC18
/* 6DD08 0016DC08 00000000 */   nop
.L0016DC0C:
/* 6DD0C 0016DC0C FFFF0224 */  addiu      $2, $0, -0x1
/* 6DD10 0016DC10 0B000010 */  b          .L0016DC40
/* 6DD14 0016DC14 00000000 */   nop
.L0016DC18:
/* 6DD18 0016DC18 C0100500 */  sll        $2, $5, 3
/* 6DD1C 0016DC1C 23104500 */  subu       $2, $2, $5
/* 6DD20 0016DC20 80110200 */  sll        $2, $2, 6
/* 6DD24 0016DC24 21184400 */  addu       $3, $2, $4
/* 6DD28 0016DC28 C0100600 */  sll        $2, $6, 3
/* 6DD2C 0016DC2C 23104600 */  subu       $2, $2, $6
/* 6DD30 0016DC30 80100200 */  sll        $2, $2, 2
/* 6DD34 0016DC34 21104300 */  addu       $2, $2, $3
/* 6DD38 0016DC38 3800428C */  lw         $2, 0x38($2)
/* 6DD3C 0016DC3C 00000000 */  nop
.L0016DC40:
/* 6DD40 0016DC40 0800E003 */  jr         $31
/* 6DD44 0016DC44 00000000 */   nop
/* 6DD48 0016DC48 00000000 */  nop
/* 6DD4C 0016DC4C 00000000 */  nop
