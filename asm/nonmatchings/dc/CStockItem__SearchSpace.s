.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SearchSpace__10CStockItemFii
/* 13F700 0023F600 28160070 */  paddub     $2, $0, $0
/* 13F704 0023F604 02000324 */  addiu      $3, $0, 0x2
/* 13F708 0023F608 2100C310 */  beq        $6, $3, .L0023F690
/* 13F70C 0023F60C 00000000 */   nop
/* 13F710 0023F610 01000324 */  addiu      $3, $0, 0x1
/* 13F714 0023F614 1300C310 */  beq        $6, $3, .L0023F664
/* 13F718 0023F618 00000000 */   nop
/* 13F71C 0023F61C 0300C010 */  beqz       $6, .L0023F62C
/* 13F720 0023F620 00000000 */   nop
/* 13F724 0023F624 23000010 */  b          .L0023F6B4
/* 13F728 0023F628 00000000 */   nop
.L0023F62C:
/* 13F72C 0023F62C 40100500 */  sll        $2, $5, 1
/* 13F730 0023F630 21108200 */  addu       $2, $4, $2
/* 13F734 0023F634 00004284 */  lh         $2, 0x0($2)
/* 13F738 0023F638 84004328 */  slti       $3, $2, 0x84
/* 13F73C 0023F63C 06006014 */  bnez       $3, .L0023F658
/* 13F740 0023F640 00000000 */   nop
/* 13F744 0023F644 00014128 */  slti       $at, $2, 0x100
/* 13F748 0023F648 03002010 */  beqz       $at, .L0023F658
/* 13F74C 0023F64C 00000000 */   nop
/* 13F750 0023F650 18000010 */  b          .L0023F6B4
/* 13F754 0023F654 00000000 */   nop
.L0023F658:
/* 13F758 0023F658 28160070 */  paddub     $2, $0, $0
/* 13F75C 0023F65C 15000010 */  b          .L0023F6B4
/* 13F760 0023F660 00000000 */   nop
.L0023F664:
/* 13F764 0023F664 40190500 */  sll        $3, $5, 5
/* 13F768 0023F668 23186500 */  subu       $3, $3, $5
/* 13F76C 0023F66C C0180300 */  sll        $3, $3, 3
/* 13F770 0023F670 21186400 */  addu       $3, $3, $4
/* 13F774 0023F674 F0006484 */  lh         $4, 0xF0($3)
/* 13F778 0023F678 01018328 */  slti       $3, $4, 0x101
/* 13F77C 0023F67C 0D006014 */  bnez       $3, .L0023F6B4
/* 13F780 0023F680 00000000 */   nop
/* 13F784 0023F684 28168070 */  paddub     $2, $4, $0
/* 13F788 0023F688 0A000010 */  b          .L0023F6B4
/* 13F78C 0023F68C 00000000 */   nop
.L0023F690:
/* 13F790 0023F690 40110500 */  sll        $2, $5, 5
/* 13F794 0023F694 21104400 */  addu       $2, $2, $4
/* 13F798 0023F698 001E4284 */  lh         $2, 0x1E00($2)
/* 13F79C 0023F69C 51004128 */  slti       $at, $2, 0x51
/* 13F7A0 0023F6A0 04002010 */  beqz       $at, .L0023F6B4
/* 13F7A4 0023F6A4 00000000 */   nop
/* 13F7A8 0023F6A8 28160070 */  paddub     $2, $0, $0
/* 13F7AC 0023F6AC 01000010 */  b          .L0023F6B4
/* 13F7B0 0023F6B0 00000000 */   nop
.L0023F6B4:
/* 13F7B4 0023F6B4 0800E003 */  jr         $31
/* 13F7B8 0023F6B8 00000000 */   nop
/* 13F7BC 0023F6BC 00000000 */  nop
