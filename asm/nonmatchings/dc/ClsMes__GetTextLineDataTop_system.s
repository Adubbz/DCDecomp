.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetTextLineDataTop_system__6ClsMesFi
/* 4F620 0014F520 A417828C */  lw         $2, 0x17A4($4)
/* 4F624 0014F524 00004484 */  lh         $4, 0x0($2)
/* 4F628 0014F528 02004624 */  addiu      $6, $2, 0x2
/* 4F62C 0014F52C 283E0070 */  paddub     $7, $0, $0
/* 4F630 0014F530 0E000010 */  b          .L0014F56C
/* 4F634 0014F534 00000000 */   nop
.L0014F538:
/* 4F638 0014F538 80100700 */  sll        $2, $7, 2
/* 4F63C 0014F53C 21184600 */  addu       $3, $2, $6
/* 4F640 0014F540 02006284 */  lh         $2, 0x2($3)
/* 4F644 0014F544 0800A214 */  bne        $5, $2, .L0014F568
/* 4F648 0014F548 00000000 */   nop
/* 4F64C 0014F54C 04006284 */  lh         $2, 0x4($3)
/* 4F650 0014F550 40180200 */  sll        $3, $2, 1
/* 4F654 0014F554 40100400 */  sll        $2, $4, 1
/* 4F658 0014F558 2110C200 */  addu       $2, $6, $2
/* 4F65C 0014F55C 21104300 */  addu       $2, $2, $3
/* 4F660 0014F560 06000010 */  b          .L0014F57C
/* 4F664 0014F564 00000000 */   nop
.L0014F568:
/* 4F668 0014F568 0100E724 */  addiu      $7, $7, 0x1
.L0014F56C:
/* 4F66C 0014F56C 2A10E400 */  slt        $2, $7, $4
/* 4F670 0014F570 F1FF4014 */  bnez       $2, .L0014F538
/* 4F674 0014F574 00000000 */   nop
/* 4F678 0014F578 28160070 */  paddub     $2, $0, $0
.L0014F57C:
/* 4F67C 0014F57C 0800E003 */  jr         $31
/* 4F680 0014F580 00000000 */   nop
/* 4F684 0014F584 00000000 */  nop
/* 4F688 0014F588 00000000 */  nop
/* 4F68C 0014F58C 00000000 */  nop