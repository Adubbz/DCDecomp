.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMoveMenuIcon__Fv
/* 1105F0 002104F0 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 1105F4 002104F4 8000BF7F */  sq         $31, 0x80($sp)
/* 1105F8 002104F8 7000B77F */  sq         $23, 0x70($sp)
/* 1105FC 002104FC 6000B67F */  sq         $22, 0x60($sp)
/* 110600 00210500 5000B57F */  sq         $21, 0x50($sp)
/* 110604 00210504 4000B47F */  sq         $20, 0x40($sp)
/* 110608 00210508 3000B37F */  sq         $19, 0x30($sp)
/* 11060C 0021050C 2000B27F */  sq         $18, 0x20($sp)
/* 110610 00210510 1000B17F */  sq         $17, 0x10($sp)
/* 110614 00210514 0000B07F */  sq         $16, 0x0($sp)
/* 110618 00210518 B840080C */  jal        GetEditMenuMax__Fv
/* 11061C 0021051C 00000000 */   nop
/* 110620 00210520 28964070 */  paddub     $18, $2, $0
/* 110624 00210524 289E0070 */  paddub     $19, $0, $0
/* 110628 00210528 4F000010 */  b          .L00210668
/* 11062C 0021052C 00000000 */   nop
.L00210530:
/* 110630 00210530 5496848F */  lw         $4, -0x69AC($gp)
/* 110634 00210534 02000224 */  addiu      $2, $0, 0x2
/* 110638 00210538 02008214 */  bne        $4, $2, .L00210544
/* 11063C 0021053C 00000000 */   nop
/* 110640 00210540 80001124 */  addiu      $17, $0, 0x80
.L00210544:
/* 110644 00210544 09008228 */  slti       $2, $4, 0x9
/* 110648 00210548 08004014 */  bnez       $2, .L0021056C
/* 11064C 0021054C 00000000 */   nop
/* 110650 00210550 10008128 */  slti       $at, $4, 0x10
/* 110654 00210554 05002010 */  beqz       $at, .L0021056C
/* 110658 00210558 00000000 */   nop
/* 11065C 0021055C 80000324 */  addiu      $3, $0, 0x80
/* 110660 00210560 5C96828F */  lw         $2, -0x69A4($gp)
/* 110664 00210564 C0100200 */  sll        $2, $2, 3
/* 110668 00210568 23886200 */  subu       $17, $3, $2
.L0021056C:
/* 11066C 0021056C 10008228 */  slti       $2, $4, 0x10
/* 110670 00210570 06004014 */  bnez       $2, .L0021058C
/* 110674 00210574 00000000 */   nop
/* 110678 00210578 16008128 */  slti       $at, $4, 0x16
/* 11067C 0021057C 03002010 */  beqz       $at, .L0021058C
/* 110680 00210580 00000000 */   nop
/* 110684 00210584 5C96828F */  lw         $2, -0x69A4($gp)
/* 110688 00210588 C0880200 */  sll        $17, $2, 3
.L0021058C:
/* 11068C 0021058C 02002106 */  bgez       $17, .L00210598
/* 110690 00210590 00000000 */   nop
/* 110694 00210594 288E0070 */  paddub     $17, $0, $0
.L00210598:
/* 110698 00210598 8100212A */  slti       $at, $17, 0x81
/* 11069C 0021059C 02002014 */  bnez       $at, .L002105A8
/* 1106A0 002105A0 00000000 */   nop
/* 1106A4 002105A4 80001124 */  addiu      $17, $0, 0x80
.L002105A8:
/* 1106A8 002105A8 08898227 */  addiu      $2, $gp, -0x76F8
/* 1106AC 002105AC 21105300 */  addu       $2, $2, $19
/* 1106B0 002105B0 00005480 */  lb         $20, 0x0($2)
/* 1106B4 002105B4 28268072 */  paddub     $4, $20, $0
/* 1106B8 002105B8 D0B7080C */  jal        GetMenuIconInfo__Fi
/* 1106BC 002105BC 00000000 */   nop
/* 1106C0 002105C0 28860070 */  paddub     $16, $0, $0
/* 1106C4 002105C4 281E0070 */  paddub     $3, $0, $0
/* 1106C8 002105C8 28AE0070 */  paddub     $21, $0, $0
/* 1106CC 002105CC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 1106D0 002105D0 58EF2280 */  lb         $2, -0x10A8($at)
/* 1106D4 002105D4 05006216 */  bne        $19, $2, .L002105EC
/* 1106D8 002105D8 00000000 */   nop
/* 1106DC 002105DC 06000324 */  addiu      $3, $0, 0x6
/* 1106E0 002105E0 02001024 */  addiu      $16, $0, 0x2
/* 1106E4 002105E4 80001124 */  addiu      $17, $0, 0x80
/* 1106E8 002105E8 01001524 */  addiu      $21, $0, 0x1
.L002105EC:
/* 1106EC 002105EC C0B01300 */  sll        $22, $19, 3
/* 1106F0 002105F0 DA01023C */  lui        $2, %hi(MenuIconPos)
/* 1106F4 002105F4 20EF4224 */  addiu      $2, $2, %lo(MenuIconPos)
/* 1106F8 002105F8 21105600 */  addu       $2, $2, $22
/* 1106FC 002105FC 000041C4 */  lwc1       $f1, 0x0($2)
/* 110700 00210600 00008344 */  mtc1       $3, $f0
/* 110704 00210604 00000000 */  nop
/* 110708 00210608 20008046 */  cvt.s.w    $f0, $f0
/* 11070C 0021060C 010B0046 */  sub.s      $f12, $f1, $f0
/* 110710 00210610 2C44040C */  jal        fptosi
/* 110714 00210614 00000000 */   nop
/* 110718 00210618 28BE4070 */  paddub     $23, $2, $0
/* 11071C 0021061C DA01023C */  lui        $2, %hi(D_1D9EF24)
/* 110720 00210620 24EF4224 */  addiu      $2, $2, %lo(D_1D9EF24)
/* 110724 00210624 21105600 */  addu       $2, $2, $22
/* 110728 00210628 000041C4 */  lwc1       $f1, 0x0($2)
/* 11072C 0021062C 00009044 */  mtc1       $16, $f0
/* 110730 00210630 00000000 */  nop
/* 110734 00210634 20008046 */  cvt.s.w    $f0, $f0
/* 110738 00210638 010B0046 */  sub.s      $f12, $f1, $f0
/* 11073C 0021063C 2C44040C */  jal        fptosi
/* 110740 00210640 00000000 */   nop
/* 110744 00210644 2826E072 */  paddub     $4, $23, $0
/* 110748 00210648 282E4070 */  paddub     $5, $2, $0
/* 11074C 0021064C 28368072 */  paddub     $6, $20, $0
/* 110750 00210650 283EA072 */  paddub     $7, $21, $0
/* 110754 00210654 80000824 */  addiu      $8, $0, 0x80
/* 110758 00210658 284E2072 */  paddub     $9, $17, $0
/* 11075C 0021065C E8B7080C */  jal        DrawMainMenuIcon__Fiiiiii
/* 110760 00210660 00000000 */   nop
/* 110764 00210664 01007326 */  addiu      $19, $19, 0x1
.L00210668:
/* 110768 00210668 2A187202 */  slt        $3, $19, $18
/* 11076C 0021066C B0FF6014 */  bnez       $3, .L00210530
/* 110770 00210670 00000000 */   nop
/* 110774 00210674 8000BF7B */  lq         $31, 0x80($sp)
/* 110778 00210678 7000B77B */  lq         $23, 0x70($sp)
/* 11077C 0021067C 6000B67B */  lq         $22, 0x60($sp)
/* 110780 00210680 5000B57B */  lq         $21, 0x50($sp)
/* 110784 00210684 4000B47B */  lq         $20, 0x40($sp)
/* 110788 00210688 3000B37B */  lq         $19, 0x30($sp)
/* 11078C 0021068C 2000B27B */  lq         $18, 0x20($sp)
/* 110790 00210690 1000B17B */  lq         $17, 0x10($sp)
/* 110794 00210694 0000B07B */  lq         $16, 0x0($sp)
/* 110798 00210698 9000BD27 */  addiu      $sp, $sp, 0x90
/* 11079C 0021069C 0800E003 */  jr         $31
/* 1107A0 002106A0 00000000 */   nop
/* 1107A4 002106A4 00000000 */  nop
/* 1107A8 002106A8 00000000 */  nop
/* 1107AC 002106AC 00000000 */  nop
