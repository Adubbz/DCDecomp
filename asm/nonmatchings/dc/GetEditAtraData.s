.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetEditAtraData__Fii
/* 58E80 00158D80 04008004 */  bltz       $4, .L00158D94
/* 58E84 00158D84 00000000 */   nop
/* 58E88 00158D88 06008228 */  slti       $2, $4, 0x6
/* 58E8C 00158D8C 04004014 */  bnez       $2, .L00158DA0
/* 58E90 00158D90 00000000 */   nop
.L00158D94:
/* 58E94 00158D94 28160070 */  paddub     $2, $0, $0
/* 58E98 00158D98 15000010 */  b          .L00158DF0
/* 58E9C 00158D9C 00000000 */   nop
.L00158DA0:
/* 58EA0 00158DA0 0400A004 */  bltz       $5, .L00158DB4
/* 58EA4 00158DA4 00000000 */   nop
/* 58EA8 00158DA8 6400A228 */  slti       $2, $5, 0x64
/* 58EAC 00158DAC 04004014 */  bnez       $2, .L00158DC0
/* 58EB0 00158DB0 00000000 */   nop
.L00158DB4:
/* 58EB4 00158DB4 28160070 */  paddub     $2, $0, $0
/* 58EB8 00158DB8 0D000010 */  b          .L00158DF0
/* 58EBC 00158DBC 00000000 */   nop
.L00158DC0:
/* 58EC0 00158DC0 00110400 */  sll        $2, $4, 4
/* 58EC4 00158DC4 23184400 */  subu       $3, $2, $4
/* 58EC8 00158DC8 80100300 */  sll        $2, $3, 2
/* 58ECC 00158DCC 21106200 */  addu       $2, $3, $2
/* 58ED0 00158DD0 00190200 */  sll        $3, $2, 4
/* 58ED4 00158DD4 2600023C */  lui        $2, %hi(EditElementData)
/* 58ED8 00158DD8 00AF4224 */  addiu      $2, $2, %lo(EditElementData)
/* 58EDC 00158DDC 21184300 */  addu       $3, $2, $3
/* 58EE0 00158DE0 40100500 */  sll        $2, $5, 1
/* 58EE4 00158DE4 21104500 */  addu       $2, $2, $5
/* 58EE8 00158DE8 80100200 */  sll        $2, $2, 2
/* 58EEC 00158DEC 21104300 */  addu       $2, $2, $3
.L00158DF0:
/* 58EF0 00158DF0 0800E003 */  jr         $31
/* 58EF4 00158DF4 00000000 */   nop
/* 58EF8 00158DF8 00000000 */  nop
/* 58EFC 00158DFC 00000000 */  nop
