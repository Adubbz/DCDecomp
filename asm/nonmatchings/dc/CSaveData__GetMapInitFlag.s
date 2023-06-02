.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMapInitFlag__9CSaveDataFii
/* 58600 00158500 0400A004 */  bltz       $5, .L00158514
/* 58604 00158504 00000000 */   nop
/* 58608 00158508 5000A228 */  slti       $2, $5, 0x50
/* 5860C 0015850C 04004014 */  bnez       $2, .L00158520
/* 58610 00158510 00000000 */   nop
.L00158514:
/* 58614 00158514 28160070 */  paddub     $2, $0, $0
/* 58618 00158518 1E000010 */  b          .L00158594
/* 5861C 0015851C 00000000 */   nop
.L00158520:
/* 58620 00158520 0400C104 */  bgez       $6, .L00158534
/* 58624 00158524 00000000 */   nop
/* 58628 00158528 28160070 */  paddub     $2, $0, $0
/* 5862C 0015852C 19000010 */  b          .L00158594
/* 58630 00158530 00000000 */   nop
.L00158534:
/* 58634 00158534 43390600 */  sra        $7, $6, 5
/* 58638 00158538 1000E228 */  slti       $2, $7, 0x10
/* 5863C 0015853C 04004014 */  bnez       $2, .L00158550
/* 58640 00158540 00000000 */   nop
/* 58644 00158544 28160070 */  paddub     $2, $0, $0
/* 58648 00158548 12000010 */  b          .L00158594
/* 5864C 0015854C 00000000 */   nop
.L00158550:
/* 58650 00158550 1F00C330 */  andi       $3, $6, 0x1F
/* 58654 00158554 0400C104 */  bgez       $6, .L00158568
/* 58658 00158558 00000000 */   nop
/* 5865C 0015855C 02006010 */  beqz       $3, .L00158568
/* 58660 00158560 00000000 */   nop
/* 58664 00158564 E0FF6324 */  addiu      $3, $3, -0x20
.L00158568:
/* 58668 00158568 01000224 */  addiu      $2, $0, 0x1
/* 5866C 0015856C 04306200 */  sllv       $6, $2, $3
/* 58670 00158570 80110500 */  sll        $2, $5, 6
/* 58674 00158574 21184400 */  addu       $3, $2, $4
/* 58678 00158578 80100700 */  sll        $2, $7, 2
/* 5867C 0015857C 21104300 */  addu       $2, $2, $3
/* 58680 00158580 0100013C */  lui        $at, (0x11AE8 >> 16)
/* 58684 00158584 21084100 */  addu       $at, $2, $at
/* 58688 00158588 E81A228C */  lw         $2, (0x11AE8 & 0xFFFF)($at)
/* 5868C 0015858C 24104600 */  and        $2, $2, $6
/* 58690 00158590 2B100200 */  sltu       $2, $0, $2
.L00158594:
/* 58694 00158594 0800E003 */  jr         $31
/* 58698 00158598 00000000 */   nop
/* 5869C 0015859C 00000000 */  nop
