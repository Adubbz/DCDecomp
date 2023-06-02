.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuCalcBufAlignment__FP1
/* 12BD00 0022BC00 3F008230 */  andi       $2, $4, 0x3F
/* 12BD04 0022BC04 04008104 */  bgez       $4, .L0022BC18
/* 12BD08 0022BC08 00000000 */   nop
/* 12BD0C 0022BC0C 02004010 */  beqz       $2, .L0022BC18
/* 12BD10 0022BC10 00000000 */   nop
/* 12BD14 0022BC14 C0FF4224 */  addiu      $2, $2, -0x40
.L0022BC18:
/* 12BD18 0022BC18 04004010 */  beqz       $2, .L0022BC2C
/* 12BD1C 0022BC1C 00000000 */   nop
/* 12BD20 0022BC20 83110400 */  sra        $2, $4, 6
/* 12BD24 0022BC24 01004224 */  addiu      $2, $2, 0x1
/* 12BD28 0022BC28 80210200 */  sll        $4, $2, 6
.L0022BC2C:
/* 12BD2C 0022BC2C 28168070 */  paddub     $2, $4, $0
/* 12BD30 0022BC30 0800E003 */  jr         $31
/* 12BD34 0022BC34 00000000 */   nop
/* 12BD38 0022BC38 00000000 */  nop
/* 12BD3C 0022BC3C 00000000 */  nop
