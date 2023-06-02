.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMenuTrushMark__FP9ITEM_PACK
/* 12E760 0022E660 28360070 */  paddub     $6, $0, $0
/* 12E764 0022E664 282E0070 */  paddub     $5, $0, $0
/* 12E768 0022E668 06000010 */  b          .L0022E684
/* 12E76C 0022E66C 00000000 */   nop
.L0022E670:
/* 12E770 0022E670 40180500 */  sll        $3, $5, 1
/* 12E774 0022E674 21186400 */  addu       $3, $3, $4
/* 12E778 0022E678 08006384 */  lh         $3, 0x8($3)
/* 12E77C 0022E67C 2130C300 */  addu       $6, $6, $3
/* 12E780 0022E680 0100A524 */  addiu      $5, $5, 0x1
.L0022E684:
/* 12E784 0022E684 0300A328 */  slti       $3, $5, 0x3
/* 12E788 0022E688 F9FF6014 */  bnez       $3, .L0022E670
/* 12E78C 0022E68C 00000000 */   nop
/* 12E790 0022E690 00008380 */  lb         $3, 0x0($4)
/* 12E794 0022E694 FFFF6724 */  addiu      $7, $3, -0x1
/* 12E798 0022E698 16000010 */  b          .L0022E6F4
/* 12E79C 0022E69C 00000000 */   nop
.L0022E6A0:
/* 12E7A0 0022E6A0 40180700 */  sll        $3, $7, 1
/* 12E7A4 0022E6A4 21186400 */  addu       $3, $3, $4
/* 12E7A8 0022E6A8 0E006384 */  lh         $3, 0xE($3)
/* 12E7AC 0022E6AC 84006128 */  slti       $at, $3, 0x84
/* 12E7B0 0022E6B0 0B002010 */  beqz       $at, .L0022E6E0
/* 12E7B4 0022E6B4 00000000 */   nop
/* 12E7B8 0022E6B8 0900C018 */  blez       $6, .L0022E6E0
/* 12E7BC 0022E6BC 00000000 */   nop
/* 12E7C0 0022E6C0 01000524 */  addiu      $5, $0, 0x1
/* 12E7C4 0022E6C4 DB01033C */  lui        $3, %hi(MenuTrushMark)
/* 12E7C8 0022E6C8 10906324 */  addiu      $3, $3, %lo(MenuTrushMark)
/* 12E7CC 0022E6CC 21186700 */  addu       $3, $3, $7
/* 12E7D0 0022E6D0 000065A0 */  sb         $5, 0x0($3)
/* 12E7D4 0022E6D4 FFFFC624 */  addiu      $6, $6, -0x1
/* 12E7D8 0022E6D8 05000010 */  b          .L0022E6F0
/* 12E7DC 0022E6DC 00000000 */   nop
.L0022E6E0:
/* 12E7E0 0022E6E0 DB01033C */  lui        $3, %hi(MenuTrushMark)
/* 12E7E4 0022E6E4 10906324 */  addiu      $3, $3, %lo(MenuTrushMark)
/* 12E7E8 0022E6E8 21186700 */  addu       $3, $3, $7
/* 12E7EC 0022E6EC 000060A0 */  sb         $0, 0x0($3)
.L0022E6F0:
/* 12E7F0 0022E6F0 FFFFE724 */  addiu      $7, $7, -0x1
.L0022E6F4:
/* 12E7F4 0022E6F4 EAFFE104 */  bgez       $7, .L0022E6A0
/* 12E7F8 0022E6F8 00000000 */   nop
/* 12E7FC 0022E6FC 0800E003 */  jr         $31
/* 12E800 0022E700 00000000 */   nop
/* 12E804 0022E704 00000000 */  nop
/* 12E808 0022E708 00000000 */  nop
/* 12E80C 0022E70C 00000000 */  nop
